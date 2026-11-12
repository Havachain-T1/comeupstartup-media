<?php

namespace App\Services\Search;

use App\Services\Search\Contracts\SearchEngine;
use Core\Models\TlBlog;
use Core\Models\TlBlogCategory;
use Core\Models\User;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class DatabaseSearchEngine implements SearchEngine
{
    private const NAME_MATCH = 'MATCH(tl_blogs.name) AGAINST (? IN BOOLEAN MODE)';
    private const BODY_MATCH = 'MATCH(tl_blogs.name, tl_blogs.short_description, tl_blogs.content) AGAINST (? IN BOOLEAN MODE)';

    /** Published, public-or-password, already-live articles. Mirrors FrontendBlogRepository::getBlogs. */
    public static function publicArticles(): Builder
    {
        return TlBlog::query()
            ->where('tl_blogs.is_publish', config('settings.blog_status.publish'))
            ->where('tl_blogs.publish_at', '<', currentDateTime())
            ->where('tl_blogs.visibility', '!=', 'private');
    }

    public function suggest(SearchQuery $query, array $limits): array
    {
        $groups = [];

        if (($limits['articles'] ?? 0) > 0) {
            $groups[] = ['type' => 'articles', 'items' => $this->articles($query, $limits['articles'])];
        }
        if (($limits['categories'] ?? 0) > 0) {
            $groups[] = ['type' => 'categories', 'items' => $this->categories($query, $limits['categories'])];
        }
        if (($limits['authors'] ?? 0) > 0) {
            $groups[] = ['type' => 'authors', 'items' => $this->authors($query, $limits['authors'])];
        }

        return array_values(array_filter($groups, fn ($g) => count($g['items']) > 0));
    }

    public function constrainArticles(Builder $articles, SearchQuery $query): Builder
    {
        $expression = $this->fullTextAvailable() ? $query->booleanExpression() : null;

        if ($expression === null) {
            [$prefix, $wordPrefix] = $query->prefixPatterns();

            return $articles->where(function ($q) use ($query) {
                $q->where('tl_blogs.name', 'like', $query->likePattern())
                    ->orWhere('tl_blogs.short_description', 'like', $query->likePattern());
            })->reorder()
                ->orderByRaw('CASE WHEN tl_blogs.name LIKE ? THEN 0 WHEN tl_blogs.name LIKE ? THEN 1 ELSE 2 END', [$prefix, $wordPrefix])
                ->orderByDesc('tl_blogs.publish_at');
        }

        return $articles->whereRaw(self::BODY_MATCH, [$expression])
            ->reorder()
            ->orderByRaw('(3 * ' . self::NAME_MATCH . ' + ' . self::BODY_MATCH . ') DESC', [$expression, $expression])
            ->orderByDesc('tl_blogs.publish_at');
    }

    private function articles(SearchQuery $query, int $limit): array
    {
        $locale = getFrontLocale();

        $blogs = $this->constrainArticles(static::publicArticles(), $query)
            ->select(['tl_blogs.id', 'tl_blogs.name', 'tl_blogs.permalink', 'tl_blogs.short_description', 'tl_blogs.visibility', 'tl_blogs.publish_at'])
            ->with([
                'blog_translations' => fn ($q) => $q->where('lang', $locale)->select(['id', 'blog_id', 'name', 'short_description']),
                'categories' => fn ($q) => $q->where('tl_blog_categories.is_publish', 1)
                    ->select(['tl_blog_categories.id', 'tl_blog_categories.name'])
                    ->with(['category_translations' => fn ($t) => $t->where('lang', $locale)->select(['id', 'category_id', 'name'])]),
            ])
            ->limit($limit)
            ->get();

        return $blogs->map(function (TlBlog $blog) {
            $translation = $blog->blog_translations->first();
            $category = $blog->categories->first();
            $isProtected = $blog->visibility === 'password';

            return [
                'title' => $translation->name ?? $blog->name,
                'url' => route('theme.newslooks.blog.details', $blog->permalink),
                'excerpt' => $isProtected ? null : Str::limit(strip_tags((string) ($translation->short_description ?? $blog->short_description)), 110),
                'category' => $category ? ($category->category_translations->first()->name ?? $category->name) : null,
                'date' => $blog->publish_at ? date('M j, Y', strtotime($blog->publish_at)) : null,
                'protected' => $isProtected,
            ];
        })->all();
    }

    private function categories(SearchQuery $query, int $limit): array
    {
        [$prefix, $wordPrefix] = $query->prefixPatterns();
        $locale = getFrontLocale();

        return TlBlogCategory::query()
            ->where('is_publish', 1)
            ->where(function ($q) use ($prefix, $wordPrefix, $locale) {
                $q->where('name', 'like', $prefix)->orWhere('name', 'like', $wordPrefix)
                    ->orWhereHas('category_translations', fn ($t) => $t->where('lang', $locale)->where('name', 'like', $prefix));
            })
            ->with(['category_translations' => fn ($t) => $t->where('lang', $locale)->select(['id', 'category_id', 'name'])])
            ->orderByRaw('CASE WHEN name LIKE ? THEN 0 ELSE 1 END', [$prefix])
            ->orderBy('name')
            ->limit($limit)
            ->get(['id', 'name', 'permalink'])
            ->map(fn ($c) => [
                'title' => $c->category_translations->first()->name ?? $c->name,
                'url' => route('theme.newslooks.blog.blogByCategory', $c->permalink),
            ])->all();
    }

    private function authors(SearchQuery $query, int $limit): array
    {
        [$prefix, $wordPrefix] = $query->prefixPatterns();

        return User::query()
            ->where('status', 1)
            ->where(fn ($q) => $q->where('name', 'like', $prefix)->orWhere('name', 'like', $wordPrefix))
            ->whereExists(function ($q) {
                $q->select(DB::raw(1))->from('tl_blogs')
                    ->whereColumn('tl_blogs.user_id', 'tl_users.id')
                    ->where('tl_blogs.is_publish', config('settings.blog_status.publish'))
                    ->where('tl_blogs.publish_at', '<', currentDateTime())
                    ->where('tl_blogs.visibility', '!=', 'private');
            })
            ->orderBy('name')
            ->limit($limit)
            ->get(['id', 'name'])
            ->map(fn ($u) => [
                'title' => $u->name,
                'url' => route('theme.newslooks.blog.blogByAuthor', str_replace(' ', '-', $u->name)),
            ])->all();
    }

    private function fullTextAvailable(): bool
    {
        return in_array(DB::connection()->getDriverName(), ['mysql', 'mariadb'], true);
    }
}
