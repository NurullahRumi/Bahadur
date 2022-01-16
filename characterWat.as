package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import com.greensock.TimelineLite;
	
	public class characterWat extends MovieClip {
		var parnt:gamePlayWater;
		var swid:Number;
		var shit:Number;
		var jenb:Boolean = false;
		var tuch:Boolean = true;
		var forc:Number = 10;
		var grav:Number = 0.0098;
		var weit:Number = 200;
		var cpos:int = 1;
		var timL:TimelineLite;
		var locs:Array = [0.7, 0.8, 0.9];
		var char:MovieClip;

		public function characterWat(par:gamePlayWater, chra:MovieClip) {
			// constructor code
			parnt = par;
			char = chra;
			addChild(char);
			swid = par.swid;
			shit = par.shit;
			setPos(0.2, 0.7);
			timL = new TimelineLite({onComplete:function() {  timL.restart(); }});
			timL.to(this, 3.0, {y:this.y + 10});
			timL.to(this, 5.0, {y:this.y - 10});
			timL.play();
			//this.addEventListener(Event.ENTER_FRAME, enterFrameWork);
			this.addEventListener(MouseEvent.CLICK, testCall);
			moveUp();
		}
		public function setPos(xp:Number, yp:Number) {
			this.x = swid*xp;
			this.y = shit*yp;
		}
		function testCall(e:Event) {
			moveUp();
		}
		function enterFrameWork(e:Event) {
			this.y += 1-Math.random()*2;
		}
		function moveUp() {
				cpos--;
				if(cpos<=0) cpos = 0;
				timL.kill();
				this.y = locs[cpos] * shit;
				this.scaleX = this.scaleY = 1 + 2*(cpos - 1) / 10;
				//timL.play();
				trace(cpos);
		}
		function moveDown() {
				cpos++;
				if (cpos >= 2) cpos = 2;
				timL.kill();
				this.y = locs[cpos] * shit;
				trace(locs[cpos]);
				this.scaleX = this.scaleY = 1 + 2*(cpos - 1) / 10;
				//timL.play();
				trace(cpos);
		}
		
		
		public function mystop() {
			//char.gotoAndStop("run");
		}
		public function myplay() {
			//char.gotoAndPlay("run");
			//trace("i am here");
		}
		public function jump() {
			//char.gotoAndPlay("jump");
			 //if(!jenb) {forc = 24; jenb = true;} 
		}
		public function slides() {
			//char.gotoAndPlay("slid");
			// if(!jenb) {forc = 24; jenb = true;} 
		}
		public function sitdown() {
			//char.gotoAndPlay("paus");
			// if(!jenb) {forc = 24; jenb = true;} 
		}
		public function watifor() {
			char.gotoAndPlay("sits");
			// if(!jenb) {forc = 24; jenb = true;} 
		}
	}
	
}
