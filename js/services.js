(function(){var e;e=angular.module("sushiServices",[]),e.factory("brightCoveService",["$rootScope",function(e){var a,n,t,i,r,d,v,o,l,m,u;return v={},o="",d={},a={},r={},m={},l=640/360,u=$(window).width()/2.5,t=$(window).width()/2.5/l,n=function(){var e,a;return a=Handlebars.compile(o),e=a(v),document.getElementById("player").innerHTML=e,brightcove.createExperiences()},i=function(e){return v={playerID:"1890493041001",playerKey:"AQ~~%2CAAABuJ3Komk~%2CgXybzBdQzgLgC0zHvAZXtMeryIVplW-t",width:u,height:t,videoID:""+e},o='<div style="display:none"></div><object id="myExperience" class="BrightcoveExperience"><param name="bgcolor" value="#FFFFFF" /><param name="width" value="{{width}}" /><param name="height" value="{{height}}" /><param name="playerID" value="{{playerID}}" /><param name="playerKey" value="{{playerKey}}" /><param name="isSlim" value="true" /><param name="autoStart" value="false" /><param name="isVid" value="true" /><param name="isUI" value="true" /><param name="dynamicStreaming" value="true" /><param name="@videoPlayer" value="{{videoID}}"; /><param name="includeAPI" value="true" /><param name="linkBaseURL" value="http://www.redbullmusicacademy.com/magazine/diggin-in-the-carts"/><param name="templateLoadHandler" value="onTemplateLoad" /><param name="templateReadyHandler" value="onTemplateReady" /></object>',n()},window.onTemplateLoad=function(e){return d=brightcove.api.getExperience(e),a=brightcove.api.modules.APIModules,r=d.getModule(brightcove.api.modules.APIModules.VIDEO_PLAYER)},window.onTemplateReady=function(n){return m=d.getModule(a.VIDEO_PLAYER),e.$broadcast("playerready",m),r.addEventListener(brightcove.api.events.MediaEvent.BEGIN,onMediaEventFired),r.addEventListener(brightcove.api.events.MediaEvent.CHANGE,onMediaEventFired),r.addEventListener(brightcove.api.events.MediaEvent.COMPLETE,onMediaEventFired),r.addEventListener(brightcove.api.events.MediaEvent.ERROR,onMediaEventFired),r.addEventListener(brightcove.api.events.MediaEvent.PLAY,onMediaEventFired),r.addEventListener(brightcove.api.events.MediaEvent.STOP,onMediaEventFired)},{init:function(e){return i(e)}}}])}).call(this);