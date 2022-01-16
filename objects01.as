package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class objects01 extends MovieClip {
		var parnt:MovieClip;
		var char:character;
		var swid:Number;
		var shit:Number;
		var scor:Number = 0;
		//var desc:txt_obje1;
		
		public function objects01(par:MovieClip, car:character, objs:MovieClip) {
			// constructor code
			addChild(objs);
			parnt = par;
			swid = par.swid;
			shit = par.shit;
			char = car;	
			this.name = 0+"";
			//addEventListener(MouseEvent.MOUSE_DOWN, function() {startDrag(); } );
			addEventListener(Event.ENTER_FRAME, checkCollision);
			this.mouseEnabled = false;
		}
		public function setPos(xp:Number, yp:Number) {
			this.x = xp;
			this.y = yp;
		}
		var num:Number = 0;
		function checkCollision(e:Event) {
			if(!parnt.pause) {
				this.x -= parnt.speed*2;
				if (parnt.coll.checkCollision(this, char)) {
					parnt.score += scor;
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
					parnt.game.removeChild(this);
				}
				if (this.x < -this.width) {
					parnt.game.removeChild(this);
					removeEventListener(Event.ENTER_FRAME, checkCollision);
				}
				/*if ((this.x < swid * 0.9) && !parnt.htip[0]) 
				{
					desc = new txt_obje1();
					desc.y = -30;
					addChild(desc);
					//parnt.parnt.showMessage(0);
				}
				if ((this.x < swid * 0.5) && !parnt.htip[0])  {
					//trace("its working");
					if (desc != null) {removeChild(desc); desc = null;}
					parnt.htip[0] = true;
				}*/
			}
		}
	}
	
}
