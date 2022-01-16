package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class objectsd extends MovieClip {
		var parnt:MovieClip;
		var char:MovieClip;
		var swid:Number;
		var shit:Number;
		var scor:Number = 32000;
		var opend:Boolean = true;
		var cpos:int = 4;
		var otype:int = 0;
		var num:Number = 0;
		//var desc:txt_obje2;
		
		public function objectsd(par:MovieClip, car:MovieClip, obj:MovieClip) {
			// constructor code
			addChild(obj);
			parnt = par;
			swid = par.swid;
			shit = par.shit;
			char = car;	
			this.name = 1+"";
			this.x = 1024;
			//addEventListener(MouseEvent.MOUSE_DOWN, function() {startDrag(); } );
			addEventListener(Event.ENTER_FRAME, checkCollision);
			this.mouseEnabled = false;
		}
		public function setPos(xp:Number, yp:Number) {
			this.x = xp;
			this.y = yp;
		}
		function remvoeFromParent() {
			if(cpos==0) parnt.game1.removeChild(this);
			else if(cpos==1) parnt.game2.removeChild(this);
			else if(cpos==2) parnt.game3.removeChild(this);
			else parnt.game.removeChild(this);
		}
		function checkCollision(e:Event) {
			if(!parnt.pause) {
				this.x -= parnt.speed;
				if (this.x < -this.width) {
					remvoeFromParent();
					removeEventListener(Event.ENTER_FRAME, checkCollision);
				}
				if(otype>2) {
					if (parnt.coll.checkCollision(this, char) && (cpos==char.cpos)) {
						if (opend) {
							opend = false;
							parnt.char.mystop();
							parnt.parnt.showWaterMessage(otype);
						}
					}
				}
				else {
					if ((this.x < swid * 0.8)) 
					{
						if (opend) {
							opend = false;
							//parnt.score -= scor;
							parnt.char.mystop();
							//if(otype==0) 
							parnt.parnt.showMessage(scor, otype);
							//if(otype==1) parnt.parnt.showMessage(scor, 1);
							//if(otype==2) parnt.parnt.showMessage(scor, 2);
							parnt.changeScore();
						}
						//parnt.game.removeChild(this);
					}
				}
				if(otype==3 || otype==4 || otype==5 ) {
					if ((this.x < swid * 0.6)) 
					{
						if (opend) {
							opend = false;
							parnt.char.mystop();
							parnt.parnt.showWaterMessage(otype);
						}
					}
				}
				/*
				if ((this.x < swid * 0.5) && !parnt.htip[1])  {
					//trace("its working");
					if (desc != null) {removeChild(desc); desc = null;}
					parnt.htip[1] = true;
				}*/
			}
		}
	}
	
}
