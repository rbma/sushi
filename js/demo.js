//= require "jquery"
//= require "modernizr/modernizr.js"
//= require "jquery.transit"

// -------------------------------------------------
//
// YMO
// 
// -------------------------------------------------

(function() {

  "use strict";

  var Piece = function() {

    var self = this;

    self.init();

  };

  Piece.prototype = {

    scrolled: false,
    contentHeight: 0,
    introVisible: true,
    prefix: null,

    // -------------------------------------------------
    //
    // Initial scene setup
    // 
    // -------------------------------------------------

    init: function() {

      var self = this;

      self.prefix = self.browserPrefix();

      $(function() {
        self.preload();
      });

    },

    render: function() {

      var self = this;

      var lastScrollTop = 0;

      var $frame = $('.js-frame');

      var $invertCols = $('.js-invert');

      self.reset();
      setTimeout(function() {
        self.reset();
      }, 500);

      $frame.removeClass('hidden');

      $frame.bind('scroll', function(event) {

        if (self.introVisible) {

          self.introVideo = false;

          self.hideIntro();

          self.hideScrollIndicator();

        }

        self.onScroll($frame, $invertCols);

      });

      $(window).on('resize', function() {
        self.reset();
      });

    },

    hideIntro: function() {

      var $el = $('.js-intro');

      $el.addClass('hidden')
        .on('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', function() {
          $el.remove();
        });

    },

    hideScrollIndicator: function() {

      var $el = $('.js-scroll-indicator');

      $el.addClass('hidden')
        .on('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', function() {
          $el.remove();
        });
    },

    onScroll: function($frame, $els) {

      var self = this;

      var scrollPos = $frame.scrollTop();

      // If we're at the top, show whole image as one
      if (scrollPos > 1 && !self.scrolled) {
        $('.js-cover-image').removeClass('cover');
        self.scrolled = true;
      } else if (scrollPos <= 1) {
        $('.js-cover-image').addClass('cover');
        self.scrolled = false;
      }

      // Move middle column in opposite direction
      $els.css(self.prefix + 'transform', 'translate3d(0, ' + (scrollPos * 2) + 'px, 0)');

    },

    reset: function() {

      var self = this;

      // Reset column styles previously set
      // $('.js-col').css('width', '');

      // Make sure all column widths are the same
      var colWidth = $('.js-col col--inner').innerWidth();
      $('.js-col, .js-col .col--inner').css('width', colWidth);

      // Remove fixed heights on columns so we can get their natural height
      $('.js-col').find('.js-content').css('height', '');

      // Find out which column has the biggest height
      $('.js-col').each(function(i, el) {

        var $contentEl = $(el).find('.js-content');

        if (i === 0) self.contentHeight = $contentEl.innerHeight();

        if ($contentEl.innerHeight() > self.contentHeight) {
          self.contentHeight = $contentEl.innerHeight();
        }

      });

      // Set all inner content columns to be the same
      // so that images will always match up
      $('.js-col').find('.js-content').css('height', self.contentHeight);

      // Set new heights and positions
      var height = $('.js-hero').innerHeight();
      var offset = $('.js-col.col--middle').innerHeight() - height;

      $('.js-invert').css('top', '-' + offset + 'px');
      $('.js-frame').css('height', height);

      if ($('.js-intro').length) {
        $('.js-intro').css('height', height);
      }

      if (height > window.innerHeight) {
        $('.js-intro-content, .js-scroll-indicator').addClass('fixed');
      } else {
        $('.js-intro-content, .js-scroll-indicator').removeClass('fixed');
      }

      // TODO: A start on mobile
      // if (window.innerWidth < 480) {
      //   var halfFrameWidth = $('.js-frame').innerWidth() / 2;
      //   var center = halfFrameWidth - (window.innerWidth / 2);
      //   window.scrollTo(center, 0);
      // }

      // Send new frame height to iframe
      self.sendMessage({
        height: height
      });

    },


    // Send height to iframe
    // Needs to send a JSON object containing the height key/value
    sendMessage: function(object) {

      var self = this,
        messageJSON = JSON.stringify(object);

      // console.log(messageJSON);

      return window.parent.postMessage(messageJSON, '*');

    },

    preload: function() {

      var self = this;

      var image = new Image();

      // Call the render function when the image has loaded
      image.onload = function() {

        setTimeout(function() {
          self.render();
        }, 250);
      };

      // Load the image
      image.src = $('.js-hero').attr('src');

    },

    browserPrefix: function() {

      // Gets the browser prefix
      var browserPrefix;
      navigator.sayswho = (function() {
        var N = navigator.appName,
          ua = navigator.userAgent,
          tem;

        var M = ua.match(/(opera|chrome|safari|firefox|msie)\/?\s*(\.?\d+(\.\d+)*)/i);

        if (M && (tem = ua.match(/version\/([\.\d]+)/i)) !== null) {
          M[2] = tem[1];
        }

        M = M ? [M[1], M[2]] : [N, navigator.appVersion, '-?'];
        M = M[0];

        if (M == "Chrome") {
          browserPrefix = "-webkit-";
        }
        if (M == "Firefox") {
          browserPrefix = "-moz-";
        }
        if (M == "Safari") {
          browserPrefix = "-webkit-";
        }
        if (M == "MSIE") {
          browserPrefix = "-ms-";
        }

      })();

      return browserPrefix;
    }

  };

  new Piece();

})();