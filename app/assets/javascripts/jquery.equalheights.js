/**
 * Equal Heights Plugin
 * Equalize the heights of elements. Great for columns or any elements
 * that need to be the same size (floats, etc).
 *
 * Version 1.0
 * Updated 12/10/2008
 *
 * Copyright (c) 2008 Rob Glazebrook (cssnewbie.com)
 *
 * Usage: $(object).equalHeights([minHeight], [maxHeight]);
 *
 * Example 1: $(".cols").equalHeights(); Sets all columns to the same height.
 * Example 2: $(".cols").equalHeights(400); Sets all cols to at least 400px tall.
 * Example 3: $(".cols").equalHeights(100,300); Cols are at least 100 but no more
 * than 300 pixels tall. Elements with too much content will gain a scrollbar.
 *
 */

(function($) {
	$.fn.equalHeights = function(minHeight, maxHeight) {
		minHeight = minHeight || 0;
		maxHeight = maxHeight || false;
		var tallest = minHeight || 0;
		var innerHeight = 0;
		var padding = 0;
		var $this = null;
		this.height('auto').each(function() {
			$this = $(this);
			innerHeight = $this.innerHeight();
			if(innerHeight > tallest) {
				tallest = innerHeight;
			}
		});
		if(maxHeight && tallest > maxHeight) {
			tallest = maxHeight;
		}
		return this.each(function() {
			$this = $(this);
			padding = $this.innerHeight() - $this.height();
			$this.height(
				tallest - padding
			).css("overflow","off");
		});
	}
})(jQuery);
