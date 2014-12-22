// Usage: $(element).scrollToTop([position])
define(['jquery', 'rAF'], function ($) {
	// only allow one scroll to top operation to be in progress at a time,
	// which is probably what you want
	var scrollToTopInProgress = false;

	$.fn.scrollToTop = function(position){
		var $this = this;
		var $body = $('body');
		var targetY = Math.round(position) || 0;
		var initialY = $this.scrollTop();
		var lastY = initialY;
		var delta = targetY - initialY;// duration in ms, make it a bit shorter for short distances
		    // this is not scientific and you might want to adjust this for
		    // your preferences
		var speed = Math.min(750, Math.min(1500, Math.abs(initialY - targetY)));// temp variables (t will be a position between 0 and 1, y is the calculated scrollTop)
		var start;
		var t;
		var y;
		    // use requestAnimationFrame or polyfill
		var frame = window.requestAnimationFrame;
		var cancelScroll = function(){
            abort();
        };

		// abort if already in progress or nothing to scroll
		if(scrollToTopInProgress){
			return;
		}

		// quint ease-in-out smoothing, from
		// https://github.com/madrobby/scripty2/blob/master/src/effects/transitions/penner.js#L127-L136
		function smooth(pos){
			if((pos /= 0.5) < 1){
				return 0.5 * Math.pow(pos, 5);
			}
			return 0.5 * (Math.pow((pos - 2), 5) + 2);
		}

		function abort(){
			$this.off('touchstart', cancelScroll);
			scrollToTopInProgress = false;
			$body.trigger('dc-scrollEnd');
		}

		// when there's a touch detected while scrolling is in progress, abort
		// the scrolling (emulates native scrolling behavior)
		$this.on('touchstart', cancelScroll);
		scrollToTopInProgress = true;

		// start rendering away! note the function given to frame
		// is named "render" so we can reference it again further down
		frame(function render(now){
				if(!scrollToTopInProgress){
					return;
				}
				if(!start){
					start = now;
				}
				// calculate t, position of animation in [0..1]
				t = Math.min(1, Math.max((now - start) / speed, 0));
				// calculate the new scrollTop position (don't forget to smooth)
				y = Math.round(initialY + delta * smooth(t));
				// bracket scrollTop so we're never over-scrolling
				if(delta > 0 && y > targetY){
					y = targetY;
				}
				if(delta < 0 && y < targetY){
					y = targetY;
				}
				// only actually set scrollTop if there was a change fromt he last frame
				if(lastY != y){
					$this.scrollTop(y);
				}
				lastY = y;
				// if we're not done yet, queue up an other frame to render,
				// or clean up
				(y !== targetY) ? frame(render) : abort();
			})
	}
});
