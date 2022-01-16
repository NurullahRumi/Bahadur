package  {
	import com.greensock.loading.data.ImageLoaderVars;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class gameFile extends MovieClip {
		var game:MovieClip;
		var back:MovieClip;
		var font:MovieClip;
		var parnt:mainController;
		var masLy:messages;
		var ends:homebtn = new homebtn();
		var paus:startGame = new startGame();
		var lvl:Number;
		var g_var:global_variable = new global_variable();
		var tf:TextFormat = new TextFormat();
		var scr_txt:TextField = new TextField();
		var tar_txt:TextField = new TextField();
		var pause:Boolean = false;
		var frams:Number = 24;	
		var swid:Number;
		var shit:Number;
		var isendGame:Boolean = false;
		var posDis:Boolean = false;
		var lifeBar:life_box = new life_box();

		public function gameFile(par:mainController) {
			// constructor code
			parnt = par;
			swid = par.sw;
			shit = par.sh;
			this.mouseEnabled = false;
		}
		function changeScores(e:Event=null) {
			var csr:int = int(scr_txt.text);
			var scr:int = g_var.loadCurentScore();
			//trace(csr+", "+scr);
			if(csr<scr-50){
				csr += 100;
				scr_txt.text = ""+csr;
			}
			if(csr>scr+50){
				csr -= 100;
				scr_txt.text = ""+csr;
			}
			if(lvl==4) scr_txt.text = "";
		}
		function initiateGame(level:Number) {			
			if (game != null) { 
				game.removeAllChild(); 
				game.sund.pause(); 
				removeChild(game); 
				game = null; 
				removeChild(back);
			}
			lvl = level;
			masLy = new messages(this);
			if(lvl==0){
				game = new gamePlying(this);
				//trace("its running again");
			}
			else if (lvl == 1)  {
				game = new information_level(this);				
			}
			else if (lvl == 2)  {
				game = new puzzleMain(this);
			}
			else if (lvl == 3)  {
				game = new gamePlying_Pass(this);
			}
			else if (lvl == 4)  {
				game = new gamePlayWater(this);
			}
			else if (lvl == 5)  {
				game = new migrationPreparation(this);
			}
			else if (lvl == 6)  {
				game = new destinationLevel(this);
			}
			else {
				endGames();
			}
			addChild(game);
			addAdditionaObject();
			createBackground();
			pause = true;
			if(lvl==1 || lvl==2 || lvl==3 || lvl==5 || lvl==6) trace("No Character");
			else game.char.mystop();
			if(lvl==3 || lvl==1) pause = false;
			tf.size = 34;
			tf.align = TextFormatAlign.CENTER;
			scr_txt.defaultTextFormat = tf;
			scr_txt.x = swid * 0.77;
			scr_txt.y = shit * 0.0;
			scr_txt.width = 200;
			scr_txt.textColor = 0x000000;
			tar_txt.x = swid * 0.32;
			tar_txt.y = shit * 0.0;
			tar_txt.width = 200;
			tar_txt.textColor = 0x000000;
			tar_txt.defaultTextFormat = tf;
			addChild(scr_txt);
			addChild(tar_txt);
			scr_txt.text = "";
			tar_txt.text = "";
			
			addChild(lifeBar);
			lifeBar.scaleX = 100;
			lifeBar.x = swid*0.582;
			lifeBar.y = shit*0.035;
			addEventListener(Event.ENTER_FRAME, changeScores);
		}
		public function createBackground() {
			if (lvl == 0) {
				back = new backgrounds(this);
				back.passBackComponents(); 
				back.startEnterFrame();
				
				font = new forground(this);
				font.passBackComponents();
				font.startEnterFrame();
				addChild(font);
				setChildIndex(font, numChildren-1);
				setChildIndex(paus, numChildren-1);
				setChildIndex(masLy, numChildren-1);
			}
			/*if (lvl == 3 || lvl == 5) {
				back = new backgroundspass(this);
				back.passBackComponents(); back.startEnterFrame();
			}*/
			if (lvl == 4) {
				back = new backgroundsWater(this);
				//back.waterBackComponents();
			}
			//back.alpha = 0.5;
			if(lvl==6 || lvl==5) {
				masLy.inf_1.alpha = 0;
				masLy.scr_txt.alpha = 0;
				masLy.inst.alpha = 0;
				scr_txt.alpha = 0;
				tar_txt.alpha = 0;
				lifeBar.alpha = 0;
			}
			else if(lvl==1 || lvl==2 || lvl==3) {
				lifeBar.alpha = 0;
			}
			else {
				masLy.inf_1.alpha = 1;
				masLy.scr_txt.alpha = 1;
				masLy.inst.alpha = 1;
				scr_txt.alpha = 1;
				tar_txt.alpha = 1;
				lifeBar.alpha = 1;
			}
			
			if (lvl == 1 || lvl == 2 || lvl == 3 || lvl == 5 || lvl==6) {
				trace("no Back");
			}
			else {
				addChild(back);
				setChildIndex(back, 0);
			}
		}
		public function addAdditionaObject() {
			addChild(masLy);
			addChild(ends);
			if(lvl==1 || lvl==2  || lvl==3  || lvl==5 || lvl==6 || posDis) trace("No Paus");
			else addChild(paus);
			ends.x = swid - 80;
			paus.x = swid*0.5;
			paus.y = shit*0.5;
			ends.y = shit - 80;
			ends.scaleX = ends.scaleY = 0.8;
			ends.addEventListener(MouseEvent.CLICK, endGames);
			paus.addEventListener(MouseEvent.CLICK, pauseGame);
		}
		function endGames(e:Event=null) {
			ends.removeEventListener(MouseEvent.CLICK, endGames);
			game.removeAllChild();
			parnt.gameEnded();
			pause = true;
		}
		function removeSounds() {
			if(lvl==0 || lvl==1 || lvl==2 || lvl==3 || lvl==4) game.removeSounds();
		}
		function endGamesWithLevel(level) {
			parnt.gameEnded();
			pause = true;
			initiateGame(level);
		}
		function startGamesWithLevel() {
			var clev:int = g_var.loadCurrentLevel();
			parnt.gameEnded();
			pause = true;
			parnt.addIntroWindow(7);
		}
		function addGameWindowInstant(level:int) {		
			game.sund.pause();
			//trace(numChildren);
			for(var a=0; a<numChildren; a++) 
				removeChildAt(0);
			//trace("Child Number "+numChildren);
			parnt.addGameWindow(level);
			//parnt.gameStartFromGame();
		}
		function addDestinationWindow() {
			parnt.addGameWindow(6);
		}
		function pauseGame(e:Event) {
			if (!pause) { 
				frams = 10;
				//parent.stage.frameRate = frams;
				pause = true;
				game.char.mystop();
			}
			else {	
				frams = 40;
				//parent.stage.frameRate = frams;
				pause = false;
				game.char.myplay();
				removeChild(paus);
			}
		}
		function pTrue(){
			if (!pause) {
				pause = true;
			}
		}
		function pFalse() {
			pause = false;
		}
		function showMessage(num:Number, mnum:int) {
			//trace("show Massage " + num);
			masLy.createMessageObject(num, mnum);
			pause = true;
		}
		function showWaterMessage(num:Number) {
			//trace("show Massage " + num);
			masLy.createMessageForWater(num);
			pause = true;
		}
		function showReturnMessage(mnum:int) {
			//trace("show Massage " + num);
			masLy.createReturnMessage(mnum);
			pause = true;
		}
		function createOneTimeMessage(num:int) {
			masLy.createMessage(num);
			pause = true;
		}
		function secondMessages() {
			masLy.secondMessages();
		}
	}	
}
