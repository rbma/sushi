(function(){"use strict";var e;e=angular.module("sushiControllers",[]),e.controller("IndexCtrl",["$scope","$rootScope","$http","$sce","$timeout","contentfulClient","brightCoveService",function(e,t,n,r,i,o,s){var l;return e.player0={},e.player1={},l={},e.sushi={},e.videReady=!0,e.defaultEpisode=3863856095001,e.clicked=!1,e.videoPlaying=!1,e.currentVideo="",s.init(e.defaultEpisode),o.entries({content_type:"1aSBU2rdZSKAUK4GUQ8iKy",include:1}).then(function(t){return e.sushi=t[0]}),t.$on("playerready",function(t,n){return e.player=n}),e.switchVid=function(t){return e.player.loadVideoByID(t),e.currentVideo=t},e.playVideo=function(t){return e.player.loadVideoByID(t),e.videoPlaying=!0},e.closePlayer=function(){return e.player.pause(),e.videoPlaying=!1},e.trust=function(e){return r.trustAsHtml(e)}}]),e.controller("InfoControl",["$scope","$http","$sce","contentfulClient","webgl",function(e,t,n,r,i){var o;return e.sushi={},o=new Showdown.converter,e.threed=i.checkWebGL(),e.webglsupport=!1,e.webglsupport=e.threed===!1?!1:!0,e.$watch("webglsupport",function(){return console.log(e.webglsupport)}),r.entries({"sys.id":"RSlBbwxiQ622C6iiwOG2e",include:1}).then(function(t){var n,r,i,s,l;for(e.sushi=t[0],e.sushi.fields.infoDescription=o.makeHtml(e.sushi.fields.infoDescription),s=e.sushi.fields.sushiTypes,l=[],r=0,i=s.length;i>r;r++)n=s[r],l.push(n.fields.description=o.makeHtml(n.fields.description));return l}),e.trust=function(e){return n.trustAsHtml(e)}}])}).call(this);