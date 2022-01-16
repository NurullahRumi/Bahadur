package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.greensock.TimelineLite;
	import com.greensock.easing.*;
	import flash.events.MouseEvent;
	
	public class objdalal extends MovieClip {
		var parnt:MovieClip;
		var swid:Number;
		var shit:Number;
		var scor:Number = 32000;
		var opend:Boolean = true;
		var cpos:int = 4;
		var otype:int = 0;
		var num:Number = 0;
		var ani:TimelineLite;
		var sund:sound_controll = new sound_controll("2");
		//var desc:txt_obje2;
		
		public function objdalal(par:MovieClip, obj:MovieClip) {
			// constructor code
			addChild(obj);
			parnt = par;
			swid = par.swid;
			shit = par.shit;
			this.name = 1+"";
			this.x = swid*1.1;
			this.y = shit*0.4;   //loadCurrentLevel()
			var msg:MovieClip;
			var clev:int = parnt.parnt.g_var.loadCurrentLevel();
			if(clev==0) msg = new dalMes4();
			if(clev==1) msg = new dalMes5();
			if(clev==2) msg = new dalMes6();
			if(clev==3) msg = new dalMes7();
			this.addChild(msg);
			msg.x = -100;
			msg.y = -50;
			msg.alpha = 0;
			msg.scaleX = 0;
			//addEventListener(MouseEvent.MOUSE_DOWN, function() {startDrag(); } );
			//addEventListener(Event.ENTER_FRAME, checkCollision);
			//this.mouseEnabled = false;
			ani = new TimelineLite({onComplete:remvoeFromParent});
			ani.to(this, 1.5, {x:swid*0.925});
			ani.to(msg, 0.5, {alpha:1, scaleX:1, onComplete:playCurrentSound});
			ani.to(msg, 0.5, {alpha:0, scaleX:0}, "+=4.0");
			ani.to(this, 1.5, {x:swid*1.075});
			this.addEventListener(MouseEvent.CLICK, showNextMessage);
		}
		function playCurrentSound() {			
			var clev:int = parnt.parnt.g_var.loadCurrentLevel();
			if(clev==0) 
				sund.playSpecificSound("d_4");
			if(clev==1) 
				sund.playSpecificSound("d_5");
			if(clev==2) 
				sund.playSpecificSound("d_6");
			if(clev==3)
				sund.playSpecificSound("d_7");
		}
		public function showNextMessage(e:Event) {
			parnt.parnt.pause = true;
			ani.kill();
			ani = new TimelineLite({onComplete:preRemvoeFromParent});
			ani.to(this, 0.5, {alpha:0});
		}
		public function setPos(xp:Number, yp:Number) {
			this.x = xp;
			this.y = yp;
		}
		function preRemvoeFromParent() {
			remvoeFromParent();
			parnt.messOn = false;
			parnt.parnt.secondMessages();
		}
		function remvoeFromParent() {			
			sund.pause();
			ani.kill();
			parnt.messOn = false;
			var clev:int = parnt.parnt.g_var.loadCurrentLevel();
			if(clev==0) parnt.resetSoundVolume();
			if(clev==1) parnt.resetvoiceVolume();
			parnt.game.removeChild(this);
			while (this.numChildren > 0) 
				removeChildAt(0);
		}
		public function removeAllChild() {
			sund.pause();
			ani.kill();
			parnt.messOn = false;
			//parnt.game.removeChild(this);
			while (this.numChildren > 0) 
				removeChildAt(0);
		}
	}
	
}
