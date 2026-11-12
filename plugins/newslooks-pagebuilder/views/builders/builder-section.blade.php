@if (count($page_sections))
    @foreach ($page_sections as $section)
        @php
            $section_prop = !empty($section['properties']['properties']) ? $section['properties']['properties'] : false;
            $container = isset($section_prop['container']) ? $section_prop['container'] : 'container';
            $vertical = isset($section_prop['vertical']) ? $section_prop['vertical'] : 'start';
        @endphp
        <section id="section_{{ $section['id'] . '_' . $section['page_id'] }}">
            <div class="{{ $container }}">
                <div class="row align-items-{{ $vertical }}">

                    @foreach ($section['layouts'] as $section_layouts)
                        <div class="col-sm-{{ $section_layouts['col_value'] }}">

                            @foreach ($section_layouts['layout_widgets'] as $layout_widget)
                                @php
                                    $properties = !empty($layout_widget['properties']['properties']) ? $layout_widget['properties']['properties'] : false;
                                    $alignment = isset($properties['alignment']) ? $properties['alignment'] : 'start';
                                    $widget_name = $layout_widget['widget']['name'];
                                    $widget_specific_class = Plugin\NewslooksPageBuilder\Helpers\BuilderHelper::getWidgetClass($widget_name);
                                @endphp

                                <div class="widget w-100 text-{{ $alignment }} {{ $widget_specific_class }} shadow-none"
                                    id="section_{{ $section['id'] . '_widget_' . $layout_widget['id'] }}">

                                    @if ($properties)
                                        @includeIf(
                                            'plugin/newslooks-pagebuilder::builders.builder-widgets.' .
                                                $widget_name,
                                            [
                                                'data' => $properties,
                                            ]
                                        )
                                    @endif

                                </div>
                            @endforeach

                        </div>
                    @endforeach
                </div>
            </div>
        </section>
    @endforeach
@endif
