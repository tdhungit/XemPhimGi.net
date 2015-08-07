<section class="vbox">
    <section class="scrollable wrapper-lg">
        <div class="row">
            <div class="col-sm-8">
                <div class="panel">
                    <!-- player -->
                    <video id="really-cool-video" class="video-js vjs-default-skin" controls
                           preload="auto" width="100%" height="450" poster="{{ video.thumbnail_url }}"
                           data-setup='{}'>
                        <source src="{{ video_media.media_url }}" type='video/mp4'>
                        <p class="vjs-no-js">Enable Javascript, please</p>
                    </video>
                    <!-- end player -->

                    <div class="wrapper-lg">
                        <h2 class="m-t-none text-black">{{ video.name }}</h2>
                        <div class="post-sum">
                            {{ video.description }}
                        </div>
                        <div class="line b-b"></div>
                        <div class="text-muted">
                            <i class="fa fa-user icon-muted"></i> by <a href="#" class="m-r-sm">{{ video.actors }}</a>
                            <br>
                            <i class="fa fa-clock-o icon-muted"></i> {{ video.years }}
                        </div>
                    </div>

                </div>
            </div>

            <div class="col-sm-4">
                <div class="panel panel-default">
                    <div class="panel-heading">Suggestions</div>
                    <div class="panel-body">
                        {% for rv in relate_videos %}
                            <article class="media">
                                <a href="{{ url('/detail/' ~ rv.id) }}" class="pull-left thumb-lg m-t-xs">
                                    <img src="{{ rv.thumbnail_url }}">
                                </a>
                                <div class="media-body">
                                    <a href="{{ url('/detail/' ~ rv.id) }}" class="font-semibold">{{ rv.name }}</a>
                                    <div class="text-xs block m-t-xs">{{ rv.years }}</div>
                                </div>
                            </article>
                        {% endfor %}
                    </div>
                </div>
            </div>

        </div>
    </section>
</section>