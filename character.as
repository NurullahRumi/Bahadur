package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	public class character extends MovieClip {
		var parnt:MovieClip;
		var swid:Number;
		var shit:Number;
		var jenb:Boolean = false;
		var tuch:Boolean = true;
		var forc:Number = 10;
		var grav:Number = 0.0078;
		var weit:Number = 200;
		var curFrame:Number = 0;
		var char:MovieClip;

		public function character(par:MovieClip, chra:MovieClip) {
			// constructor code
			char = chra;
			addChild(char);
			parnt = par;
			swid = par.swid;
			shit = par.shit;
			setPos(0.2, 0.875);
			this.addEventListener(Event.ENTER_FRAME, enterFrameWork);
			this.mouseEnabled = false;
		}
		public function setPos(xp:Number, yp:Number) {
			this.x = swid*xp;
			this.y = shit*yp;
		}
		function enterFrameWork(e:Event) {
			//if (parnt.coll.checkCollision(parnt.base, this)) trace("It collieded");
			
			if (parnt.coll.checkCollision(parnt.base, this) && !tuch){
				trace(this.height +" it collide "+parnt.base.height);
				char.gotoAndPlay("run");
				tuch = true;
				jenb = false;
				forc = 0;
				var pos = parnt.base.y - (this.height) / 2 + 25;
				this.y = pos;
			}
			if (jenb) {
				forc -= grav * weit;
				if (forc <-12) forc = -12;
				//var dk:int = this.y+this.height*0.5;
				//var bas:int = parnt.base.y-parnt.base.height*0.5;
				//if(bas<dk && forc<-4) forc = -4;
				this.y -= forc;
			}
			if (forc < 0) {
				tuch = false;
			}
			if (parnt.pause) {curFrame = this.currentFrame; this.gotoAndStop(6); }
			else this.play();
		}
		public function mystop() {
			char.gotoAndStop("run");
		}
		public function myplay() {
			trace("i am here to call from message");
			char.gotoAndPlay("run");
			//trace("i am here");
		}
		public function pauses() {
			char.gotoAndPlay("paus");
			//trace("i am here");
		}
		public function colide(typ:int=0) {
			if(typ==1)
			   char.gotoAndPlay("colid");
			else char.gotoAndPlay("colid2");
			//trace("i am here");
		}
		public function jump() {
			if (!parnt.pause) char.gotoAndPlay("jump");
			if(!jenb && !parnt.pause) {forc = 24; jenb = true;} 
		}
		public function slides() {
			if (!parnt.pause) char.gotoAndPlay("slid");
			// if(!jenb) {forc = 24; jenb = true;} 
		}
		public function sitdown() {
			if (!parnt.pause) char.gotoAndPlay("paus");
			// if(!jenb) {forc = 24; jenb = true;} 
		}
		public function watifor() {
			if (!parnt.pause) char.gotoAndPlay("sits");
			// if(!jenb) {forc = 24; jenb = true;} 
		}
	} 
	
}
