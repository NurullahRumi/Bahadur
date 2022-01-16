package  {
	import flash.display.MovieClip;
	import flash.events.TouchEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.events.TransformGestureEvent;
	
	public class mySwipeEvent extends MovieClip {
		Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
		var parnt:MovieClip;		
		var t_x:int = 0;
		var t_y:int = 0;

		public function mySwipeEvent(par:MovieClip) {
			// constructor code
			var tuch:tuchObj = new tuchObj();
			addChild(tuch);
			parnt = par;
			tuch.addEventListener(TransformGestureEvent.GESTURE_SWIPE, keyDownEvnt);
			tuch.addEventListener(TouchEvent.TOUCH_BEGIN, startCalculate);
			tuch.addEventListener(TouchEvent.TOUCH_END, endCalculate);
		}
		function startCalculate(e:TouchEvent) {
			t_x = e.localX;
			t_y = e.localY;
		}
		function endCalculate(e:TouchEvent) {
			if(e.localY-t_y < -30) parnt.callFromEvent("jump");
			if(e.localY-t_y > 30) parnt.callFromEvent("slid");
		}
		function keyDownEvnt(e:TransformGestureEvent) {
			if (e.offsetY < 0) parnt.callFromEvent("jump");
			if (e.offsetY > 0) parnt.callFromEvent("slid");
			if (e.offsetX < 0) parnt.callFromEvent("jump");
			if (e.offsetX > 0) parnt.callFromEvent("jump");
		}
	}
	
}
