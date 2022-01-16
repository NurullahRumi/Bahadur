package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class watObjec01 extends MovieClip {
		var parnt:MovieClip;
		var char:MovieClip;
		var swid:Number;
		var shit:Number;
		//var desc:txt_obje1;
		var cpos:int = 0;
		var scor:Number = 0;
		
		public function watObjec01(par:MovieClip, car:MovieClip, objs:MovieClip) {
			// constructor code
			addChild(objs);
			parnt = par;
			swid = par.swid;
			shit = par.shit;
			char = car;	
			this.name = 0+"";
			this.mouseEnabled = false;
			//addEventListener(MouseEvent.MOUSE_DOWN, function() {startDrag(); } );
			addEventListener(Event.ENTER_FRAME, checkCollision);
		}
		public function setPos(xp:Number, yp:Number) {
			this.x = xp;
			this.y = yp;
		}
		var num:Number = 0;
		function remvoeFromParent() {
			if(cpos==0) parnt.game1.removeChild(this);
			if(cpos==1) parnt.game2.removeChild(this);
			if(cpos==2) parnt.game3.removeChild(this);
		}
		function checkCollision(e:Event) {
			if(!parnt.pause) {
				this.x -= parnt.speed*1.5;
				if (parnt.coll.checkCollision(this, char) && (cpos==char.cpos)) {
					parnt.score += 10;
					parnt.life +=5;
					parnt.changeScore();
					removeEventListener(Event.ENTER_FRAME, checkCollision);
					if(scor>0) {
						var sund1:sright1 = new sright1();
						sund1.play();
					}
					else {
						var sund:swrong = new swrong();
						sund.play();
					}
					remvoeFromParent();
				}
				if (this.x < -this.width) {
					removeEventListener(Event.ENTER_FRAME, checkCollision);
					remvoeFromParent();
				}
				/*if ((this.x < swid * 0.9) && !parnt.htip[0]) 
				{
					desc = new txt_obje1();
					desc.y = -30;
					addChild(desc);
					//parnt.parnt.showMessage(0);
				}
				if ((this.x < swid * 0.5) && !parnt.htip[0])  {
					if (desc != null) {removeChild(desc); desc = null;}
					parnt.htip[0] = true;
				}*/
			}
		}
	}
	
}
