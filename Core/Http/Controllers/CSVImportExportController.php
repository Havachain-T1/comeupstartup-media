<?php

namespace Core\Http\Controllers;

use Carbon\Carbon;
use SplFileObject;
use Illuminate\View\View;
use Core\Models\TlBlogTag;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Core\Models\TlBlogCategory;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Exception;
use Illuminate\Support\Facades\Response;

class CSVImportExportController extends Controller
{
    /**
     * Wordpress post import page
     */
    public function csvImportExport(): View
    {
        return view('core::base.blog.csv-import-export.index');
    }

    /**
     * Wordpress File Submit
     */
    public function submit(Request $request)
    {
        // File Validation
        $request->validate([
            'file' => 'file|required|max:5024'
        ], [
            'file.file' => 'Only CSV file supported file',
            'file.required' => 'CSV file required',
            'file.max' => 'CSV file max size 5MB',
        ]);

        try {

            $csv_file = $request->file('file');

            if ($csv_file->getClientMimeType() !== 'text/csv') {
                return $this->jsonResponse(translate('Only CSV file supported'), 500);
            }

            $csv_file->move(public_path(), 'post-import.csv');
            $path = public_path() . '/post-import.csv';

            $csv_array = $this->getArrayDataFromCSV($path);

            if ($csv_array === false) {
                return $this->jsonResponse(translate('CSV File First 2 Column Header Must Be Title and Slug (Uppercase)'), 500);
            }

            $result = $this->savePostToDatabase($csv_array);

            if (!$result) {
                return $this->jsonResponse(translate('CSV Importing Unsuccessful'), 500);
            }

            return $this->jsonResponse(translate('Successfully Imported'), 200);
        } catch (\Exception $e) {

            return $this->jsonResponse($e->getMessage(), 500);
        } catch (\Error $e) {

            return $this->jsonResponse($e->getMessage(), 500);
        }
    }

    /**
     * Get Array Data From CSV
     */
    private function getArrayDataFromCSV($path)
    {
        $csv_data = [];

        $file = new SplFileObject($path, 'r');
        $file->setFlags(SplFileObject::READ_CSV | SplFileObject::SKIP_EMPTY | SplFileObject::DROP_NEW_LINE);

        $fieldHeader = ['Excerpt', 'Content', 'Image Featured', 'Format', 'Date', 'Categories', 'Tags'];

        $csvHeaderKey = [];

        foreach ($file as $index => $line) {
            if ($index == 0) {
                if (preg_replace('/[^\x20-\x7E]/u', '', $line[0]) == 'Title' && $line[1] == 'Slug') {
                    foreach ($fieldHeader as $value) {
                        $index = array_search($value, array_values($line));
                        $csvHeaderKey[$value] = $index ?? null;
                    }
                    continue;
                } else {
                    return false;
                }
            }

            if (!empty($line[0]) && !empty($line[1])) {

                $csv_data[] = [
                    'name' => substr($line[0], 0, 225),
                    'permalink' => substr($line[1], 0, 225),
                    'short_description' => $csvHeaderKey['Excerpt'] ? $line[$csvHeaderKey['Excerpt']] : '',
                    'content' => $csvHeaderKey['Content'] ? $line[$csvHeaderKey['Content']] : '',
                    'image' => $csvHeaderKey['Image Featured'] ? $line[$csvHeaderKey['Image Featured']] : null,
                    'formate' => $csvHeaderKey['Format'] ? $line[$csvHeaderKey['Format']] : null,
                    'publish_at' => $csvHeaderKey['Date'] ? $line[$csvHeaderKey['Date']] : null,
                    'categories' => $csvHeaderKey['Categories'] ? $line[$csvHeaderKey['Categories']] : 'Uncategorized',
                    'tags' => $csvHeaderKey['Tags'] ? $line[$csvHeaderKey['Tags']] : '',
                ];
            }
        }

        unlink($path);

        return $csv_data;
    }

    /**
     * Save CSV post tyo Database
     */
    private function savePostToDatabase($posts)
    {
        try {

            $batchSize = 500;
            $insertData = [];
            $insertCategoryTags = [];

            foreach ($posts as $key => $post) {

                $post['permalink'] = $this->getPostPermalink($post);
                $post['image'] = $this->getPostImageAndSave($post);

                $insertData[] = [
                    "name" => xss_clean($post['name']),
                    "permalink" => xss_clean($post['permalink']),
                    "user_id" => 1,
                    "short_description" => xss_clean($post['short_description']),
                    "content" => xss_clean($post['content']),
                    "image" => isset($post['image']) && $post['image'] !== '' ? xss_clean($post['image']) : null,
                    "formate" => isset($post['formate']) && $post['formate'] !== '' ? strtolower(xss_clean($post['formate'])) : 'standard',
                    "publish_at" => isset($post['publish_at']) && $post['publish_at'] !== '' ? Carbon::parse($post['publish_at'])->toDateString() : currentDateTime(),
                    "visibility" => 'public',
                    "reading_time" => getReadingTime($post['content']),
                    "is_publish" => config('settings.blog_status.publish')
                ];

                $insertCategoryTags[] = [
                    "categories" => $post['categories'],
                    "tags" => $post['tags']
                ];

                if (count($insertData) === $batchSize) {
                    // Insert a batch of posts
                    $this->insertBulkPostByBatch($insertData, $insertCategoryTags);
                    $insertData = [];
                    $insertCategoryTags = [];
                }
            }

            // Insert any remaining posts
            if (!empty($insertData)) {
                $this->insertBulkPostByBatch($insertData, $insertCategoryTags);
            }

            return true;
        } catch (\Exception $e) {
            dd($e);
            return false;
        }
    }

    /**
     * Get Post Permalink
     */
    private function getPostPermalink($post)
    {
        $existingPost = DB::table('tl_blogs')->where('permalink', '=', $post['permalink'])->first();

        if ($existingPost) {
            $count = 1;

            // Combine both checks into a single query
            while (DB::table('tl_blogs')->where('permalink', '=', $post['permalink'] . '-' . $count)->exists()) {
                $count++;
            }

            $post['permalink'] = $post['permalink'] . '-' . $count;
        }

        return $post['permalink'];
    }

    /**
     * Get Post Image and Save
     */
    private function getPostImageAndSave($post)
    {
        $image_url = $post['image'];

        $ch = curl_init($image_url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        $content = curl_exec($ch);
        curl_close($ch);

        if (curl_errno($ch)) {

            return null;
        } else {
            // Check HTTP status code
            $image_info = curl_getinfo($ch);
            $http_code = $image_info['http_code'];

            $content_type = ['image/jpeg', 'image/jpg', 'image/png', 'image/svg+xml', 'image/gif'];

            if ($http_code === 200 && in_array($image_info['content_type'], $content_type)) {

                $localFilePath = public_path() . '/csv-images/' . Str::random(5) . '.jpg';

                file_put_contents($localFilePath, $content);

                $file = $this->createFileObject($localFilePath);

                $file_extension = $file->getMimeType();

                if (in_array($file_extension, $content_type)) {

                    $file_id = saveFileInStorage($file);

                    unlink($localFilePath);
                    unlink($file->getPathname());

                    return $file_id;
                }
            }
        }

        return null;
    }

    /**
     * Create A Upload File Object
     */
    private function createFileObject($url)
    {
        $path_parts = pathinfo($url);

        $newPath = $path_parts['dirname'] . '/tmp-files/';
        if (!is_dir($newPath)) {
            mkdir($newPath, 0777);
        }

        $newUrl = $newPath . $path_parts['basename'];
        copy($url, $newUrl);
        $imgInfo = getimagesize($newUrl);

        $file = new UploadedFile(
            $newUrl,
            $path_parts['basename'],
            $imgInfo['mime'],
            filesize($url),
            true,
            TRUE
        );

        return $file;
    }

    /**
     * Bulk Save Post To Database
     */
    private function insertBulkPostByBatch($postData, $insertCategoryTags)
    {
        try {
            DB::beginTransaction();
            DB::table('tl_blogs')->insert($postData);
            DB::commit();

            $lastRecordIdBeforeInsert = DB::table('tl_blogs')->latest('id')->value('id');

            $this->insertCategoriesAndTags($lastRecordIdBeforeInsert, $insertCategoryTags);
        } catch (\Exception $e) {
            DB::rollBack();
        }
    }

    /**
     * Bulk Insert Categories and Tags
     */
    private function insertCategoriesAndTags($afterBulkID, $insertCategoryTags)
    {
        $beforeBulkID = $afterBulkID - count($insertCategoryTags);

        foreach ($insertCategoryTags as $key => $singleCategoryTags) {

            $postId = $beforeBulkID + ($key + 1);

            if (!empty($singleCategoryTags['categories'])) {
                $this->storePostCategory($postId, $singleCategoryTags['categories']);
            }

            if (!empty($singleCategoryTags['tags'])) {
                $this->storePostTag($postId, $singleCategoryTags['tags']);
            }
        }
    }

    /**
     * Store Post Categories
     */
    private function storePostCategory($post_id, $categories)
    {
        $category_array = explode(',', str_replace([',', '|'], ',', $categories));

        $cat_ids = [];

        foreach ($category_array as $key => $cat) {
            if (!empty($cat)) {
                $permalink = Str::slug($cat, '-');

                $new_cat = TlBlogCategory::firstOrCreate([
                    'name' => $cat,
                    'permalink' => $permalink
                ]);

                $cat_ids[] = [
                    'blog_id' => $post_id,
                    'category_id' => $new_cat->id,
                ];
            }
        }

        // If Tag Exist Remove Previous And Add New
        if (count($cat_ids) > 0) {
            DB::table('tl_blogs_categories')->insert($cat_ids);
        }
    }

    /**
     * Store Post Tags
     */
    private function storePostTag($post_id, $tags)
    {
        $tag_array = explode(',', str_replace([',', '|'], ',', $tags));

        $tag_ids = [];

        foreach ($tag_array as $key => $tag) {

            $permalink = Str::slug($tag, '-');

            $new_tag = TlBlogTag::firstOrCreate([
                'name' => $tag,
                'permalink' => $permalink
            ]);

            $tag_ids[] = [
                'blog_id' => $post_id,
                'tag_id' => $new_tag->id,
            ];
        }
        // If Tag Exist Remove Previous And Add New
        if (count($tag_ids) > 0) {
            DB::table('tl_blogs_tags')->insert($tag_ids);
        }
    }


    /**
     * Export Post
     */
    public function export(Request $request)
    {
        try {
            //disable ONLY_FULL_GROUP_BY
            DB::statement("SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));");

            $posts = DB::table('tl_blogs')
                ->leftJoin('tl_blogs_categories', 'tl_blogs_categories.blog_id', '=', 'tl_blogs.id')
                ->leftJoin('tl_blog_categories', 'tl_blog_categories.id', '=', 'tl_blogs_categories.category_id')
                ->leftJoin('tl_blogs_tags', 'tl_blogs_tags.blog_id', '=', 'tl_blogs.id')
                ->leftJoin('tl_blog_tags', 'tl_blog_tags.id', '=', 'tl_blogs_tags.tag_id')
                ->groupBy('tl_blogs.id')
                ->selectRaw('
                    tl_blogs.id,
                    tl_blogs.name,
                    tl_blogs.permalink,
                    tl_blogs.image,
                    tl_blogs.short_description,
                    tl_blogs.content,
                    tl_blogs.publish_at,
                    tl_blogs.formate,
                    GROUP_CONCAT(distinct tl_blog_categories.name) AS category,
                    GROUP_CONCAT(distinct tl_blog_tags.name) AS tag
                ')
                ->get();

            $csv_file_name = 'post-export-' . Carbon::parse(now())->format('d-m-Y') . '.csv';

            $csvData = [
                [
                    'Title',
                    'Slug',
                    'Excerpt',
                    'Content',
                    'Image Featured',
                    'Format',
                    'Date',
                    'Categories',
                    'Tags'
                ]
            ];

            foreach ($posts as $post) {
                $csvData[] = [
                    $post->name,
                    $post->permalink,
                    $post->short_description,
                    $post->content,
                    getFilePath($post->image, false),
                    $post->formate,
                    $post->publish_at,
                    $post->category,
                    $post->tag
                ];
            }

            $headers = [
                'Content-Type' => 'text/csv',
                'Content-Disposition' => 'attachment; filename="' . $csv_file_name . '"',
            ];

            $callback = function () use ($csvData) {
                $file = fopen('php://output', 'w');

                foreach ($csvData as $row) {
                    fputcsv($file, $row);
                }

                fclose($file);
            };

            return Response::stream($callback, 200, $headers);
        } catch (Exception $e) {
            return $this->jsonResponse(translate('Exporting Unsuccessful'), 500);
        }
    }

    /**
     * Return Json Response
     */
    private function jsonResponse($msg, $code)
    {
        return response()->json([
            'message' => $msg
        ], $code);
    }
}
