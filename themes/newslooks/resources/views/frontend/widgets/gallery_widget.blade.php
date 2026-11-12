 @php
     $type = isset($value['blog_type']) ? $value['blog_type'] : null;

     $blogs = BlogHelper::filterBlogs($type, 12);
 @endphp

 <!-- Popular Gallery -->
 <div class="widget widget_gallery">
     @isset($value['widget_title'])
         <!-- Section Title -->
         <div class="section-title has-bg-shape shape--two mb-30">
             <h2 class="c1">{{ $value['widget_title'] }}</h2>
         </div>
         <!-- End Section Title -->
     @endisset

     <ul>
         @foreach ($blogs as $blog)
             <li>
                 <a href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}">
                     @php
                         $small_variation = getImageVariation($blog->image, 'small');
                     @endphp
                     <img data-src="{{ isset($blog->image) ? $small_variation : '' }}" alt="{{ $blog->name }}" class="lazy">
                 </a>
             </li>
         @endforeach
     </ul>
 </div>
 <!-- End Popular Gallery -->
