package  {
	import flash.display.MovieClip;
	
	public class basement extends base {
		var parnt:MovieClip;
		var swid:Number;
		var shit:Number;
		
		public function basement(par:MovieClip) {
			parnt = par;
			swid = par.swid;
			shit = par.shit;
			//trace(swid);
			pos(0.5, 1.02);
		}
		public function pos(xp:Number, yp:Number) {
			this.x = swid * xp;
			this.y = shit * yp;
		}

	}
	
}
