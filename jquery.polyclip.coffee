# CSS path resource:
# http://cssplant.com/clip-path-generator

$ ->
    $.fn.polyClip = (settings) ->
        settings = $.extend {}, $.fn.polyClip.options, settings

        # random range helper functions
        randomRange = (min, max) ->
            return ~~(Math.random() * (max - min + 1)) + min

        randomPercentalRange = (min, max, size) ->
            percent = ~~(Math.random() * (max - min + 1)) + min
            offset = size / 100 * percent
            return offset

        # create inline clip (chrome, safari)
        createInlineClip = (image) ->
            # Add hover effect
            if settings.hover
                image.on("mouseenter", ->
                    d = image.attr("dimension").split(",")
                    image.css("-webkit-clip-path", "polygon(0px 0px, "+d[0]+"px 0px, "+d[0]+"px "+d[1]+"px, 0px "+d[1]+"px")
                )
                image.on("mouseleave", ->
                    p = image.attr("polygon").split(",")
                    image.css("-webkit-clip-path", "polygon("+p[0]+" "+p[1]+","+p[2]+" "+p[3]+","+p[4]+" "+p[5]+","+p[6]+" "+p[7]+")")
                )

            image.on("load,imgloaded",
                d = [
                    image.width(),
                    image.height()
                ]
                if settings.pixels                
                    p = [
                        # top left corner
                        randomRange(0, settings.verticalOffset) + "px",
                        randomRange(0, settings.horizontalOffset) + "px",
                        # top right corner
                        image.width() - randomRange(0, settings.verticalOffset) + "px",
                        randomRange(0, settings.horizontalOffset) + "px",
                        # bottom right corner
                        image.width() - randomRange(0, settings.verticalOffset) + "px",
                        image.height() - randomRange(0, settings.horizontalOffset) + "px",
                        # bottom left corner
                        randomRange(0, settings.verticalOffset) + "px",
                        image.height() - randomRange(0, settings.horizontalOffset) + "px",
                    ]
                else
                    p = [
                        # top left corner
                        randomPercentalRange(0, settings.verticalOffset, d[0]) + "px",
                        randomPercentalRange(0, settings.horizontalOffset, d[1]) + "px",
                        # top right corner
                        image.width() - randomPercentalRange(0, settings.verticalOffset, d[0]) + "px",
                        randomPercentalRange(0, settings.horizontalOffset, d[1]) + "px",
                        # bottom right corner
                        image.width() - randomPercentalRange(0, settings.verticalOffset, d[0]) + "px",
                        image.height() - randomPercentalRange(0, settings.horizontalOffset, d[1]) + "px",
                        # bottom left corner
                        randomPercentalRange(0, settings.verticalOffset, d[0]) + "px",
                        image.height() - randomPercentalRange(0, settings.horizontalOffset, d[1]) + "px",
                    ]
                image.attr("dimension", d)
                image.attr("polygon", p)
                image.css("-webkit-clip-path", "polygon("+p[0]+" "+p[1]+","+p[2]+" "+p[3]+","+p[4]+" "+p[5]+","+p[6]+" "+p[7]+")")
            )
            return

        # create svg clip (firefox)
        createSvgClip = (image) ->
            console?.log "creating svg clip"

        # create embedded svg clip (mobile safari)
        createEmbeddedSvgClip = (image) ->
            console?.log "creating embedded svg clip"

        this.each ->
            element = $(this)
            createInlineClip(element)
            createSvgClip(element)
            createEmbeddedSvgClip(element)

    $.fn.polyClip.options =
        horizontalOffset: 15
        verticalOffset: 15
        pixels: true
        hover: true


