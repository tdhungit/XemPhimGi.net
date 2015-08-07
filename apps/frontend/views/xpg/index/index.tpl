<section class="vbox" id="bjax-el">
    <section class="scrollable padder-lg">
        <h2 class="font-thin m-b">Video</h2>
        <div class="row row-sm">
            {% for video in videos %}
                <div class="col-xs-12 col-sm-2">
                    <div class="item">
                        <div class="pos-rlt">
                            <div class="item-overlay opacity r r-2x bg-black">
                                <div class="center text-center m-t-n">
                                    <a href="{{ url('/detail/' ~ video.id) }}"><i class="fa fa-play-circle i-2x"></i></a>
                                </div>
                            </div>

                            <a href="video-detail.html">
                                <img src="{{ video.thumbnail_url }}" alt="" class="r r-2x img-full">
                            </a>
                        </div>
                        <div class="padder-v">
                            <a href="{{ url('/detail/' ~ video.id) }}" class="text-ellipsis">{{ video.name }}</a>
                            <a href="{{ url('/detail/' ~ video.id) }}" class="text-ellipsis text-xs text-muted">{{ video.name }}</a>
                        </div>
                    </div>
                </div>
            {% endfor %}
        </div>

        <ul class="pagination pagination">
            <li><a href="{{ current_url }}&page={{ page.before }}"><i class="fa fa-chevron-left"></i></a></li>
            {% set start_page = page.current - 5 %}
            {% if start_page <= 0 %}{% set start_page = 1 %}{% endif %}

            {% set end_page = page.current + 5 %}
            {% if end_page > page.total_pages %}{% set end_page = page.total_pages %}{% endif %}

            {% for i in start_page..end_page %}
                <li {% if i == page.current %}class="active"{% endif %}><a href="{{ current_url }}&page={{ i }}">{{ i }}</a></li>
            {% endfor %}
            <li><a href="{{ current_url }}&page={{ page.next }}"><i class="fa fa-chevron-right"></i></a></li>
        </ul>
    </section>
</section>