package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.greensock.TweenLite;
	
	public class coinsadder extends coins {
		var parnt:MovieClip;
		var char:MovieClip;
		var swid:Number;
		var shit:Number;
		var scor:Number = 1000;
		var enab:Boolean = true;

		public function coinsadder(par:MovieClip, chr:MovieClip) {
			parnt = par;
			swid = par.swid;
			shit = par.shit;
			char = chr;
			this.mouseEnabled = false;
			addEventListener(Event.ENTER_FRAME, checkCollision);
		}
		public function setPos(xp:Number, yp:Number) {
			this.x = xp;
			this.y = yp;
		}
		var num:Number = 0;
		function checkCollision(e:Event) {
			if(!parnt.pause) {
				this.x -= parnt.speed*2;
				if (parnt.coll.checkCollision(this, char) && enab) {
					enab = false;
					parnt.score += scor;
					parnt.changeScore();
					var bls:coinblst = new coinblst();
					addChild(bls);
					bls.scaleX = bls.scaleY = 0.25;
					TweenLite.to(bls, 0.15, {scaleX:1, scaleY:1, alpha:0.75, onComplete:removeFroMTehParent});
					var sund:coin = new coin();
					sund.play();
				}
				if (this.x < -this.width) {
					parnt.game.removeChild(this);
					removeEventListener(Event.ENTER_FRAME, checkCollision);
				}
			}
		}
		function removeFroMTehParent() {
			removeEventListener(Event.ENTER_FRAME, checkCollision);
			parnt.game.removeChild(this);
		}

	}
	
}
