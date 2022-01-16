package  {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	public class menuWindow extends MovieClip {
		//var mItem:menu = new menu();
		var parnt:mainController;		
		//var strt:gstrt = new gstrt();
		var swid:Number;
		var shit:Number;

		public function menuWindow(par:mainController) {
			// constructor code
			parnt = par;
			swid = par.sw;
			shit = par.sh;
			//parnt.callFromParent();
			//addMenuIcon();
			addStartButton();
		}
		public function addStartButton() {
			//addChild(strt);
			//strt.x = swid*0.5;
			//strt.y = shit*0.5;
			//strt.addEventListener(MouseEvent.CLICK, startGame);
		}
		public function addMenuIcon() {			
			//mItem.x = swid - 40;
			//mItem.y = 40;
			//addChild(mItem);
		}
		function startGame(e:Event) {
			removeEventListener(MouseEvent.CLICK, startGame);
			//removeChild(strt);
			parnt.addIntroWindow(0);
			//parnt.addGameWindow();
		}

	}
	
}
