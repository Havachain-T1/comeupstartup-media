@php
    $vote_id = isset($value['vote_id']) ? $value['vote_id'] : null;

    $vote = BlogHelper::getVote($vote_id);
@endphp

<!-- Widget Blog List Start -->
<div class="widget widget-voting">

    @if(isset($value['widget_title']) && $value['widget_title'] != '')
        <!-- Section Title -->
        <div class="section-title has-bg-shape shape--two mb-30">
            <h2 class="c1">{{ $value['widget_title'] }}</h2>
        </div>
        <!-- End Section Title -->
    @endif

    @if ($vote)
        <div class="vote-content">
            <img data-src="{{ getFilePath($vote->image) }}" alt="vote-image" class="mb-30 lazy">
            <p>{{ $vote->translation(getFrontLocale()) }}</p>

            @if ($vote->date < currentDateTime())
                <div class="vote-result">
                    @foreach ($vote->options as $option)
                        <div class="form-check mb-10" data-option="{{ $option->id }}">
                            <div class="percentage" style="width: {{ 100 - ($option->percentage + 2) }}%;">
                                <span class="percentage-text">{{ $option->percentage }}%</span>
                            </div>
                            <label for="{{ $option->id }}" class="voting-label font-14 m-0 px-1">
                                {{ $option->options }}
                                <span>({{ $option->count }} {{ front_translate('votes') }})</span>
                            </label>
                        </div>
                    @endforeach
                </div>
            @else
                <div class="form-group">
                    @foreach ($vote->options as $option)
                        <div class="form-check mb-10" data-option="{{ $option->id }}">
                            <div class="percentage" style="width: {{ 100 - ($option->percentage + 2) }}%;">
                                <span class="percentage-text">{{ $option->percentage }}%</span>
                            </div>
                            <input type="radio" class="voting-input d-none" value="{{ $option->id }}"
                                name="voting_{{ $vote_id }}" id="{{ $option->id }}"
                                value="{{ $option->id }}">
                            <label for="{{ $option->id }}" class="voting-label font-14 m-0">
                                {{ $option->options }}
                            </label>
                        </div>
                    @endforeach
                </div>
                <div class="mt-2 text-right">
                    <button type="button" class="btn px-3 py-2 voting-btn"
                        data-url="{{ route('theme.newslooks.vote.give') }}"
                        data-type="vote">{{ front_translate('Vote') }}</button>
                </div>
            @endif
        </div>
    @endif
</div>
<!-- Widget Blog List End -->
