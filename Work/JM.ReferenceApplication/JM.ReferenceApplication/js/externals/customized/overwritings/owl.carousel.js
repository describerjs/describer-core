define(['jquery', 'owl_carousel'], function($, Carousel){
	Carousel.goTo = function (position, speed, drag, callbytimeout) {
		var that = this;
		var indexCount = that.$elem.data('modules.carousel').indexCount;
		that.$elem.data('modules.carousel').indexCount = position;
		//alert(positionForAni);
		if(!callbytimeout && drag !== "drag"){
			setTimeout(function(){ that.goTo(position, speed, drag, true); }, that.options.jmDelayTime);
			this.$owlItems.eq(indexCount).children().addClass('leaving');
			return;
		}


		var base = this,
		    goToPixel;

		if (base.isTransition) {
			return false;
		}
		if (typeof base.options.beforeMove === "function") {
			base.options.beforeMove.apply(this, [base.$elem]);
		}
		if (position >= base.maximumItem) {
			position = base.maximumItem;
		} else if (position <= 0) {
			position = 0;
		}

		base.currentItem = base.owl.currentItem = position;
		if (base.options.transitionStyle !== false && drag !== "drag" && base.options.items === 1 && base.browser.support3d === true) {
			base.swapSpeed(0);
			if (base.browser.support3d === true) {
				base.transition3d(base.positionsInArray[position]);
			} else {
				base.css2slide(base.positionsInArray[position], 1);
			}
			base.afterGo();
			base.singleItemTransition();
			return false;
		}
		goToPixel = base.positionsInArray[position];

		if (base.browser.support3d === true) {
			base.isCss3Finish = false;

			if (speed === true) {
				base.swapSpeed("paginationSpeed");
				window.setTimeout(function () {
					base.isCss3Finish = true;
				}, base.options.paginationSpeed);

			} else if (speed === "rewind") {
				base.swapSpeed(base.options.rewindSpeed);
				window.setTimeout(function () {
					base.isCss3Finish = true;
				}, base.options.rewindSpeed);

			} else {
				base.swapSpeed("slideSpeed");
				window.setTimeout(function () {
					base.isCss3Finish = true;
				}, base.options.slideSpeed);
			}
			base.transition3d(goToPixel);
		} else {
			if (speed === true) {
				base.css2slide(goToPixel, base.options.paginationSpeed);
			} else if (speed === "rewind") {
				base.css2slide(goToPixel, base.options.rewindSpeed);
			} else {
				base.css2slide(goToPixel, base.options.slideSpeed);
			}
		}
		base.afterGo();
	};
	Carousel.afterGo = function () {
		var base = this;

		base.prevArr.push(base.currentItem);
		base.prevItem = base.owl.prevItem = base.prevArr[base.prevArr.length - 2];
		base.prevArr.shift(0);

		if (base.prevItem !== base.currentItem) {
			base.checkPagination();
			base.checkNavigation();
			base.eachMoveUpdate();

			if (base.options.autoPlay !== false) {
				base.checkAp();
			}
		}
		if (typeof base.options.afterMove === "function" && base.prevItem !== base.currentItem) {
			setTimeout(function(){base.options.afterMove.apply(this, [base.$elem]);}, (base.currentItem === 0) ? base.options.rewindSpeed : base.options.paginationSpeed);

		}
	};
	Carousel.stopOnHover = function () {
		var base = this;
		if (base.options.stopOnHover === true && base.browser.isTouch !== true && base.options.autoPlay !== false) {
			base.$elem.on("mouseover", function () {
				base.stop();
			});
			base.$elem.on("mouseout", function () {
				if (base.hoverStatus !== "stop" && base.options.autoPlay !== false) {
					base.play();
				}
			});
		}
	};
	Carousel.buildButtons = function () {
		var base = this,
		    buttonsWrapper = $("<div class=\"owl-buttons\"/>");
		base.owlControls.append(buttonsWrapper);

		base.buttonPrev = $("<div/>", {
			"class" : "owl-prev",
			"html" : base.options.navigationText[0] || ""
		});

		base.buttonNext = $("<div/>", {
			"class" : "owl-next",
			"html" : base.options.navigationText[1] || ""
		});

		buttonsWrapper
			.append(base.buttonPrev)
			.append(base.buttonNext);

		buttonsWrapper.on("touchstart.owlControls mousedown.owlControls", "div[class^=\"owl\"]", function (event) {
			event.preventDefault();
			if(base.options.stopAutoPlayOnPaginationClick){
				base.options.autoPlay = false;
			}
		});

		buttonsWrapper.on("touchend.owlControls mouseup.owlControls", "div[class^=\"owl\"]", function (event) {
			event.preventDefault();
			if(base.options.stopAutoPlayOnPaginationClick){
				base.options.autoPlay = false;
			}
			if ($(this).hasClass("owl-next")) {
				base.next();
			} else {
				base.prev();
			}
		});
	};
	Carousel.buildPagination = function () {
		var base = this;

		base.paginationWrapper = $("<div class=\"owl-pagination\"/>");
		base.owlControls.append(base.paginationWrapper);

		base.paginationWrapper.on("touchend.owlControls mouseup.owlControls", ".owl-page", function (event) {
			event.preventDefault();
			if(base.options.stopAutoPlayOnPaginationClick){
				base.options.autoPlay = false;
			}
			if (Number($(this).data("owl-page")) !== base.currentItem) {
				base.goTo(Number($(this).data("owl-page")), true);
			}
		});
	};
});
