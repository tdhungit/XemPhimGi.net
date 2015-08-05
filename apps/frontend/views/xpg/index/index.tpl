<section class="vbox" id="bjax-el">
    <section class="scrollable padder-lg">
        <h2 class="font-thin m-b">Video</h2>
        <div class="row row-sm">
            {% for video in videos %}
                <div class="col-xs-12 col-sm-4">
                    <div class="item">
                        <div class="pos-rlt">
                            <div class="item-overlay opacity r r-2x bg-black">
                                <div class="center text-center m-t-n">
                                    <a href="video-detail.html"><i class="fa fa-play-circle i-2x"></i></a>
                                </div>
                            </div>
                            <div class="top">
                                <span class="badge bg-dark m-l-sm m-t-sm">03:20</span>
                            </div>
                            <a href="video-detail.html"><img src="{{ theme_url }}images/m40.jpg" alt="" class="r r-2x img-full"></a>
                        </div>
                        <div class="padder-v">
                            <a href="video-detail.html" class="text-ellipsis">Tempered Song</a>
                            <a href="video-detail.html" class="text-ellipsis text-xs text-muted">Miaow</a>
                        </div>
                    </div>
                </div>
            {% endfor %}
        </div>
    </section>
</section>