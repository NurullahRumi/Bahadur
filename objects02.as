package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class objects02 extends MovieClip {
		var parnt:MovieClip;
		var char:character;
		var swid:Number;
		var shit:Number;
		var scor:Number = 300;
		var done:Boolean = false;
		var sani:int = 0;
		//var desc:txt_obje2;
		
		public function objects02(par:MovieClip, car:character, obj:MovieClip, ani:int) {
			// constructor code
			addChild(obj);
			parnt = par;
			swid = par.swid;
			shit = par.shit;
			char = car;	
			sani = ani;
			this.name = 1+"";
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
				if (parnt.coll.checkCollision(this, char) && !done) {
					parnt.life += scor;
					parnt.score += scor*100
					parnt.changeScore();
					parnt.char.colide(sani);
					//removeEventListener(Event.ENTER_FRAME, checkCollision);
					if(scor>0) {
						var sund1:sright1 = new sright1();
						sund1.play();
					}
					else {
						var sund:swrong = new swrong();
						sund.play();
					}
					done = true;
					//parnt.game.removeChild(this);
				}
				if (this.x < -this.width) {
					parnt.game.removeChild(this);
					removeEventListener(Event.ENTER_FRAME, checkCollision);
				}
				/*if ((this.x < swid * 0.8) && !parnt.htip[1]) 
				{
					desc = new txt_obje2();
					desc.y = -30;
					addChild(desc);
					//parnt.parnt.showMessage(1);
					//parnt.htip[1] = true;
				}
				if ((this.x < swid * 0.5) && !parnt.htip[1])  {
					//trace("its working");
					if (desc != null) {removeChild(desc); desc = null;}
					parnt.htip[1] = true;
				}*/
			}
		}
	}
	
}
