(function(){"use strict";var i;i=angular.module("sushiDirectives",[]),i.directive("fullsize",function(){var i;return i=function(i,n,t){var r,e;return e=$(window).width(),r=$(window).height(),n.css({width:e,height:r,backgroundColor:"black",top:0})},{link:i}}),i.directive("shrink",function(){var i;return i=function(i,n,t){var r;return r=function(){var i,t;return t=$(window).width(),i=t-28,n.css({width:i+"px",left:"14px",backgroundSize:"contain",backgroundPosition:"top center"})},r(),$(window).resize(function(){return r()})},{link:i}})}).call(this);