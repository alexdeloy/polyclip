(function() {
  $(function() {
    $.fn.polyClip = function(settings) {
      var createEmbeddedSvgClip, createInlineClip, createSvgClip, randomPercentalRange, randomRange;
      settings = $.extend({}, $.fn.polyClip.options, settings);
      randomRange = function(min, max) {
        return ~~(Math.random() * (max - min + 1)) + min;
      };
      randomPercentalRange = function(min, max, size) {
        var offset, percent;
        percent = ~~(Math.random() * (max - min + 1)) + min;
        offset = size / 100 * percent;
        return offset;
      };
      createInlineClip = function(image) {
        var d, p;
        if (settings.hover) {
          image.on("mouseenter", function() {
            var d;
            d = image.attr("dimension").split(",");
            return image.css("-webkit-clip-path", "polygon(0px 0px, " + d[0] + "px 0px, " + d[0] + "px " + d[1] + "px, 0px " + d[1] + "px");
          });
          image.on("mouseleave", function() {
            var p;
            p = image.attr("polygon").split(",");
            return image.css("-webkit-clip-path", "polygon(" + p[0] + " " + p[1] + "," + p[2] + " " + p[3] + "," + p[4] + " " + p[5] + "," + p[6] + " " + p[7] + ")");
          });
        }
        image.on("load,imgloaded", d = [image.width(), image.height()], settings.pixels ? p = [randomRange(0, settings.verticalOffset) + "px", randomRange(0, settings.horizontalOffset) + "px", image.width() - randomRange(0, settings.verticalOffset) + "px", randomRange(0, settings.horizontalOffset) + "px", image.width() - randomRange(0, settings.verticalOffset) + "px", image.height() - randomRange(0, settings.horizontalOffset) + "px", randomRange(0, settings.verticalOffset) + "px", image.height() - randomRange(0, settings.horizontalOffset) + "px"] : p = [randomPercentalRange(0, settings.verticalOffset, d[0]) + "px", randomPercentalRange(0, settings.horizontalOffset, d[1]) + "px", image.width() - randomPercentalRange(0, settings.verticalOffset, d[0]) + "px", randomPercentalRange(0, settings.horizontalOffset, d[1]) + "px", image.width() - randomPercentalRange(0, settings.verticalOffset, d[0]) + "px", image.height() - randomPercentalRange(0, settings.horizontalOffset, d[1]) + "px", randomPercentalRange(0, settings.verticalOffset, d[0]) + "px", image.height() - randomPercentalRange(0, settings.horizontalOffset, d[1]) + "px"], image.attr("dimension", d), image.attr("polygon", p), image.css("-webkit-clip-path", "polygon(" + p[0] + " " + p[1] + "," + p[2] + " " + p[3] + "," + p[4] + " " + p[5] + "," + p[6] + " " + p[7] + ")"));
      };
      createSvgClip = function(image) {
        return typeof console !== "undefined" && console !== null ? console.log("creating svg clip") : void 0;
      };
      createEmbeddedSvgClip = function(image) {
        return typeof console !== "undefined" && console !== null ? console.log("creating embedded svg clip") : void 0;
      };
      return this.each(function() {
        var element;
        element = $(this);
        createInlineClip(element);
        createSvgClip(element);
        return createEmbeddedSvgClip(element);
      });
    };
    return $.fn.polyClip.options = {
      horizontalOffset: 15,
      verticalOffset: 15,
      pixels: true,
      hover: true
    };
  });

}).call(this);
