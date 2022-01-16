package  {
	import flash.display.MovieClip;
	
	public class colissionDetections {

		public function colissionDetections() {
			// constructor code
		}
		public function checkCollision(obj1:MovieClip, obj2:MovieClip):Boolean {
			if (obj1.hitTestObject(obj2)) {
				return true;
			}
			return false;
		}

	}
	
}
