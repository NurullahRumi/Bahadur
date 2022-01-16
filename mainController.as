package  {	
	import flash.display.MovieClip;	
	
	public class mainController extends MovieClip {
		var intData:datatransfar;
		var menu:menuWindow;
		var game:gameFile;
		var intr:introduction;
		var othr:MovieClip;
		var menuLayer:MovieClip = new MovieClip();
		var infoLayer:MovieClip = new MovieClip();
		var gameLayer:MovieClip = new MovieClip();
		var backLayer:MovieClip = new MovieClip();
		var sw:Number;
		var sh:Number;
		
		public function mainController() {
			// constructor code
			intData = new datatransfar();
			sw = stage.stageWidth;
			sh = stage.stageHeight;
			addChild(backLayer); // other thins what is not important
			addChild(gameLayer); // main Game and information Layers
			addChild(infoLayer); // information will go here
			addChild(menuLayer); // Menu and Help layer
			//addTheMenu();
			addIntroWindow(0);
			//addGameWindow(0);
		}
		public function callFromParent() {
			trace("it was called");
		}
		public function addTheMenu() {
			menu = new menuWindow(this);
			menuLayer.addChild(menu);
		}
		public function removeAllComponents() {
			if (game != null) {gameLayer.removeChild(game); game = null; removeChild(gameLayer);}
			if (intr != null) {menuLayer.removeChild(intr); intr=null;}
		}
		public function addGameWindow(level:Number) {
			removeAllComponents();
			addChild(gameLayer);
			game = new gameFile(this);
			gameLayer.addChild(game);
			game.initiateGame(level);
			intData.saveUserInfos();
		}		
		/*public function addInformationWindow() {
			removeAllComponents();
			info = new information_level(this);
			menuLayer.addChild(info);			
		}*/
		public function addIntroWindow(num:int) {
			removeAllComponents();
			addChild(menuLayer);
			intr = new introduction(this);
			intr.a = num;
			menuLayer.addChild(intr);			
		}
		public function openUserProfile() {
			removeAllComponents();
			addChild(menuLayer);
			othr = new userProfileInfos(this);
			menuLayer.addChild(othr);
		}
		public function removeUserProfile() {
			if(intr!=null) {menuLayer.removeChild(intr); intr=null;}
			addIntroWindow(8);
		}
		public function userPfofielPage() {
			var usrs:userProfileInfos = new userProfileInfos(this);
			menuLayer.addChild(usrs);
		}
		public function gameEnded(obj=null) {
			game.removeSounds();
			if(game!=null) gameLayer.removeChild(game);
			game = null;
			//menu.addStartButton();
			if(obj!=null) addGameWindow(obj);
			else addIntroWindow(8);			
		}
		public function gameStartFromIntro(obj=null) {
			if(intr != null) {removeChild(menuLayer);}	
		}
		public function gameStartFromGame(obj=null) {
			if(game != null) {removeChild(gameLayer);}	
		}
	}	
}
