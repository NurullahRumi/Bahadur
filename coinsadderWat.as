package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class coinsadderWat extends coins {
		var parnt:MovieClip;
		var char:MovieClip;
		var swid:Number;
		var shit:Number;
		var scor:Number = 100;
		var cpos:int;
		var num:Number = 0;

		public function coinsadderWat(par:MovieClip, chr:MovieClip) {
			parnt = par;
			swid = par.swid;
			shit = par.shit;
			char = chr;
			addEventListener(Event.ENTER_FRAME, checkCollision);
		}
		public function setPos(xp:Number, yp:Number) {
			this.x = xp;
			this.y = yp;
		}
		function checkCollision(e:Event) {
			if(!parnt.pause) {
				this.x -= 15;
				//trace(cpos + ", " + char.cpos);
				if (parnt.coll.checkCollision(this, char) && (cpos==char.cpos)) {
					parnt.score += scor;
					parnt.changeScore();
					removeEventListener(Event.ENTER_FRAME, checkCollision);
					parnt.game.removeChild(this);
					var sund:coin = new coin();
					sund.play();
				}
				if (this.x < -this.width) {
					parnt.game.removeChild(this);
					removeEventListener(Event.ENTER_FRAME, checkCollision);
				}
			}
		}

	}
	
}
