package  {
	import flash.display.MovieClip;
	import flash.utils.getDefinitionByName;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import com.greensock.TweenLite;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.events.TransformGestureEvent;
	import flash.events.TouchEvent;
	
	public class levels_window extends MovieClip{
		Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
		var parnt:MovieClip;
		var swid:Number;
		var shit:Number;
		var t_x:int = 0;
		var holder:MovieClip = new MovieClip();
		var lvl_nm:Array = ["l_money", "l_info", "l_skill", "l_pass", "l_watr"];
		var limits:Array = new Array();
		var bc_p:int = 0;
		var anim:TweenLite;
		var cpos:Number = 0;

		public function levels_window(par:MovieClip) {
			// constructor code
			parnt = par;
			swid = par.swid;
			shit = par.shit;
			limits[0] = "yes";
			anim = TweenLite.to(holder, 1.5, {x: (cpos)*swid*0.5});
			var cun:String = parnt.g_var.retrundVal('cun');
			var edu:String = parnt.g_var.retrundVal('edu');
			var score:int = int(parnt.g_var.loadCurentScore());
			var tar:int = parnt.g_var.getGameTargetValue(cun)
			limits[3] = String(parnt.g_var.getLevelTargetValue(2));
			limits[4] = parnt.g_var.getLevelTargetValue(3);
			if(score>tar) {
				if((cun=="cun_ita" || cun=="cun_uk") && (edu=="edu_no" || edu=="edu_5")) {
					limits[1] = "no";
					limits[2] = "no";
					limits[3] = "no";
					limits[4] = "yes";
					parnt.g_var.setLevelTargetValue(4, 'yes');
					parnt.g_var.setLevelTargetValue(2, 'no');
					parnt.g_var.setLevelTargetValue(3, 'no');
					parnt.g_var.setLevelTargetValue(1, 'no');
				}
				else {
					limits[1] = "yes";
					limits[2] = "yes";
					parnt.g_var.setLevelTargetValue(0, 'yes');
					parnt.g_var.setLevelTargetValue(1, 'yes');
				}
			}
			var back:back_eventer = new back_eventer();
			addChild(back);
			back.x = swid*0.5;
			back.y = shit*0.5;
			//back.addEventListener(MouseEvent.CLICK, getEventOfBack);
			//back.addEventListener(TransformGestureEvent.GESTURE_SWIPE, keyDownEvnt);
			/*back.addEventListener(TouchEvent.TOUCH_BEGIN, startCalculate);
			back.addEventListener(TouchEvent.TOUCH_MOVE, moveCalculate);
			back.addEventListener(TouchEvent.TOUCH_END, endCalculate);
			back.addEventListener(TouchEvent.TOUCH_OUT, endCalculate);
			*/
			addChild(holder);
			addAllLevels();
			addNevButton();
			var inf:minfo = new minfo();
			addChild(inf);
			inf.x = swid*0.1;
			inf.y = shit*0.1;
			inf.addEventListener(MouseEvent.CLICK, loadUserInfos);
		}
		function loadUserInfos(e:Event) {
			parnt.parnt.openUserProfile();
		}
		function startCalculate(e:TouchEvent) {
			t_x = e.localX;
			bc_p = holder.x;
		}
		function moveCalculate(e:TouchEvent) {
			var pos:int = int(holder.x-holder.width);
			if(pos>0 && holder.x<0)
				holder.x = bc_p + (e.localX-t_x);
		}
		function endCalculate(e:TouchEvent) {
			anim.kill();
			//anim = new TimelineLite();
			var pos:int = int((holder.x/swid*0.5)*100)/25;
			if(e.localX-t_x > 100 && pos<0) { anim = TweenLite.to(holder, 0.5, {x: (pos+1)*swid*0.5}); t_x = e.localX; }
			else if(e.localX-t_x < -100 && pos>-(lvl_nm.length-1)) { anim = TweenLite.to(holder, 0.5, {x: (pos-1)*swid*0.5}); t_x = e.localX; }
			//else { anim.to(holder, 0.5, {x:pos*swid*0.5}); t_x = e.localX;}
		}
		function addNevButton() {
			var pre:button_back = new button_back();
			var nxt:button_next = new button_next();
			addChild(pre);
			addChild(nxt);
			pre.x = swid*0.1;
			nxt.x = swid*0.9;
			pre.y = nxt.y = shit*0.9;
			pre.addEventListener(MouseEvent.CLICK, goToPreviousPage);
			nxt.addEventListener(MouseEvent.CLICK, goToNextPage);
		}
		function goToPreviousPage(e:Event) {
			anim.kill();
			cpos--;
			//anim = new TimelineLite();
			//var pos:int = int((holder.x/swid*0.5)*100)/25;
			if(cpos<-4) {
				cpos = -4;
			}
			trace("calling "+cpos);
			anim = TweenLite.to(holder, 1.5, {x: (cpos)*swid*0.5});
		}
		function goToNextPage(e:Event) {
			anim.kill();
			cpos++;
			//anim = new TimelineLite();
			//var pos:int = int((holder.x/swid*0.5)*100)/25;
			if(cpos>0) {
				cpos = 0;
			}
			trace("calling "+cpos);
			anim = TweenLite.to(holder, 1.5, {x: (cpos)*swid*0.5});
		}
		function keyDownEvnt(e:TransformGestureEvent) {
			anim.kill();
			//anim = new TimelineLite();
			var pos:int = int((holder.x/swid*0.5)*100)/25;
			if (e.offsetY < 0 && pos>-(lvl_nm.length-1)) anim = TweenLite.to(holder, 1.5, {x: (pos-1)*swid*0.5});
			if (e.offsetY > 0 && pos<0) anim = TweenLite.to(holder, 1.5, {x: (pos+1)*swid*0.5});
			if (e.offsetX < 0 && pos>-(lvl_nm.length-1)) anim = TweenLite.to(holder, 1.5, {x: (pos-1)*swid*0.5});
			if (e.offsetX > 0 && pos<0) anim = TweenLite.to(holder, 1.5, {x: (pos+1)*swid*0.5});
		}
		public function getEventOfBack(e:Event) {
			anim.kill();
			//anim = new TimelineLite();
			var pos:int = int((holder.x/swid*0.5)*100)/25;
			if(mouseX > swid*0.65 && pos>-(lvl_nm.length-1)) anim = TweenLite.to(holder, 1.5, {x: (pos-1)*swid*0.5});
			if(mouseX < swid*0.35 && pos<0) anim = TweenLite.to(holder, 1.5, {x: (pos+1)*swid*0.5});
		}
		public function addAllLevels() { 
			for(var a in lvl_nm) {
                var type:Class = getDefinitionByName(lvl_nm[a]) as Class;
                var inst:MovieClip = new type();
				inst.name = ""+a;
				holder.addChild(inst);
				inst.y = shit*0.5;
				inst.x = swid*0.5+swid*a*0.5;
				var lc:lock = new lock();
				if(limits[a]!="yes") {
					inst.addChild(lc);
				}
				else 
					inst.addEventListener(MouseEvent.CLICK, loadGamesLevels);
				lc.mouseEnabled = false; 
				//inst.addEventListener(TouchEvent.TOUCH_BEGIN, startCalculate);
				//inst.addEventListener(TouchEvent.TOUCH_END, endCalculate);
			}
		}
		public function loadGamesLevels(e:Event) {
			var nm:Number = Number(e.target.name);
			parnt.testOne(nm);
		}
	}
	
}
