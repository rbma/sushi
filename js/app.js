
// GLOBALS
var container;
var camera, scene, renderer, particles, geometry, material, i, sprite;
var mouseX = 0, mouseY = 0;

var windowHalfX = window.innerWidth / 2;
var windowHalfY = window.innerHeight / 2;


////////////////////////////////////////////////////////
//BRIGHTCOVE
(function() {


	var BrightVideo = function(){
		var self = this;
		self.init();
	};

	BrightVideo.prototype = {
		APIModules: {},
		videoPlayer: {},
		modVP: {},
		vidRatio: 640 / 360,
		targetVideo: {},
		playerTemplate: '',
		player: {},
		vidRatio: 16 / 9,
		
		init: function(){
			var self = this;
			self.playerData = {
				'playerID' : '1890493041001',
				'playerKey' : 'AQ~~%2CAAABuJ3Komk~%2CgXybzBdQzgLgC0zHvAZXtMeryIVplW-t',
				'width' : ($(window).width()) / 1.5,
				'height' : (($(window).width()) / 1.5) / self.vidRatio,
				'videoID' : 3839948921001
			};

			self.playerTemplate = '<div style=\"display:none\"></div><object id=\"myExperience\" class=\"BrightcoveExperience\"><param name=\"bgcolor\" value=\"#FFFFFF\" /><param name=\"width\" value=\"{{width}}\" /><param name=\"height\" value=\"{{height}}\" /><param name=\"playerID\" value=\"{{playerID}}\" /><param name=\"playerKey\" value=\"{{playerKey}}\" /><param name=\"isSlim\" value=\"true\" /><param name=\"autoStart\" value=\"false\" /><param name=\"isVid\" value=\"true\" /><param name=\"isUI\" value=\"true\" /><param name=\"dynamicStreaming\" value=\"true\" /><param name=\"@videoPlayer\" value=\"{{videoID}}\"; /><param name=\"includeAPI\" value=\"true\" /><param name=\"linkBaseURL\" value=\"http://www.redbullmusicacademy.com/magazine/diggin-in-the-carts\"/><param name=\"templateLoadHandler\" value=\"onTemplateLoad\" /><param name=\"templateReadyHandler\" value=\"onTemplateReady\" /></object>';
		},

		addPlayer: function(){
			var self = this;
			var template = Handlebars.compile(self.playerTemplate);
			var playerHTML = template(playerDate);

			document.getElementById('player').innerHTML = playerHTML;

			//instantiate player
			brightcove.createExperiences();

			window.onTemplateLoad = function(experienceId){
				self.player = brightcove.api.getExperience(experienceId);
				self.APIModules = brightcove.api.modules.APIModules;
				self.modVP = self.player.getModule(brightcove.api.modules.APIModules.VIDEO_PLAYER);
			};

			window.onTemplateReady = function(evt){
				self.videoPlayer = self.player.getModule(self.APIModules.VIDEO_PLAYER);
				self.modVP.addEventListener(brightcove.api.events.MediaEvent.BEGIN, onMediaEventFired);
				self.modVP.addEventListener(brightcove.api.events.MediaEvent.CHANGE, onMediaEventFired);
				self.modVP.addEventListener(brightcove.api.events.MediaEvent.COMPLETE, onMediaEventFired);
				self.modVP.addEventListener(brightcove.api.events.MediaEvent.ERROR, onMediaEventFired);
				self.modVP.addEventListener(brightcove.api.events.MediaEvent.PLAY, onMediaEventFired);
				self.modVP.addEventListener(brightcove.api.events.MediaEvent.STOP, onMediaEventFired);
			}
		}
	};

	// new BrightVideo();
}); //end anonymous function

	////////////////////////////////////////////////////////
	//3D SUSHI



function onDocumentMouseMove( event ) {

	mouseX = event.clientX - windowHalfX;
	mouseY = event.clientY - windowHalfY;

}

function onDocumentTouchStart( event ) {

	if ( event.touches.length === 1 ) {

		event.preventDefault();

		mouseX = event.touches[ 0 ].pageX - windowHalfX;
		mouseY = event.touches[ 0 ].pageY - windowHalfY;

	}

}

function onDocumentTouchMove( event ) {

	if ( event.touches.length === 1 ) {

		event.preventDefault();

		mouseX = event.touches[ 0 ].pageX - windowHalfX;
		mouseY = event.touches[ 0 ].pageY - windowHalfY;
	}
}



function onWindowResize() {

	windowHalfX = window.innerWidth / 2;
	windowHalfY = window.innerHeight / 2;

	camera.aspect = window.innerWidth / window.innerHeight;
	camera.updateProjectionMatrix();

	renderer.setSize( window.innerWidth, window.innerHeight );
}




function init() {
	container = document.createElement( 'div' );
	document.body.appendChild( container );

	camera = new THREE.PerspectiveCamera( 50, window.innerWidth / window.innerHeight, 1, 3000 );
	camera.position.z = 50

	scene = new THREE.Scene();

	geometry = new THREE.Geometry();

	sprite = THREE.ImageUtils.loadTexture('textures/sprites/2.png');

	for ( i = 0; i < 500; i ++ ) {

		var vertex = new THREE.Vector3();
		vertex.x = 2000 * Math.random() - 1000;
		vertex.y = 2000 * Math.random() - 1000;
		vertex.z = 2000 * Math.random() - 1000;

		geometry.vertices.push( vertex );


	}


	material = new THREE.PointCloudMaterial( { size: 85, map: sprite,  transparent: true } );
	

	particles = new THREE.PointCloud( geometry, material );


	particles.sortParticles = true;

	scene.add( particles );



	renderer = new THREE.WebGLRenderer( { alpha: true } );
	renderer.setSize( window.innerWidth, window.innerHeight );
	container.appendChild( renderer.domElement );


	document.addEventListener( 'mousemove', onDocumentMouseMove, false );
	document.addEventListener( 'touchstart', onDocumentTouchStart, false );
	document.addEventListener( 'touchmove', onDocumentTouchMove, false );

	window.addEventListener( 'resize', onWindowResize, false );

}

function render() {

	camera.position.x += ( mouseX - camera.position.x ) * 0.05;
	camera.position.y += ( - mouseY - camera.position.y ) * 0.05;

	camera.lookAt( scene.position );


	renderer.render( scene, camera );

}


function animate() {

	window.requestAnimationFrame( animate );

	render();

}



init();
animate();

