package  {
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class gamePlyingMigr extends MovieClip {
		var parnt:gameFile;
		var char:character;
		var base:basement;
		var coll:colissionDetections;
		var game:MovieClip = new MovieClip();
		var g_event:mySwipeEvent;
		var sund:sound_controll = new sound_controll();
		var swid:Number;
		var shit:Number;
		var pause:Boolean;
		var intv:Number = 8000;
		var myTimer:Timer = new Timer(intv);
		//var conTimer:Timer = new Timer(3000);
		var score:int = 0;
		var frate:Number = 0;
		var htip:Array = [false, false];
		var dall:Boolean = false;
		var pos:int = 0;
		var speed:Number = 18;
		var target:int = 0;

		public function gamePlyingMigr(par:gameFile) {
			// constructor code
			parnt = par;
			enableTouchEvent();
			swid = par.swid;
			shit = par.shit;
			score = parnt.g_var.loadCurentScore();
			var cun:String = parnt.g_var.retrundVal('cun');
			target = parnt.g_var.getGameTargetValue(cun);
			parnt.tar_txt.text = ""+target;
			coll = new colissionDetections();
			createCharacter();
			addObject();
			addEventListener(Event.ENTER_FRAME, moveDirectChar);
			//parnt.parnt.stage.addEventListener(KeyboardEvent.KEY_DOWN, callOfEvent);		
			myTimer.addEventListener(TimerEvent.TIMER, timerListener);			
			//conTimer.addEventListener(TimerEvent.TIMER, conTimerListener);	
			myTimer.start();
			changeScore();
			//conTimer.start();
			//addCoins();
			//myTimer.delay = 2000;
			//trace("it was created");
			checkConditions();
		}
		function checkConditions() {
			if(score<=1000) {
				parnt.showReturnMessage(0);
				parnt.posDis = true;
			}
		}
		function enableTouchEvent() {	
			g_event = new mySwipeEvent(this);
			addChild(g_event);
		}
		function timerListener (e:TimerEvent):void{
			if(!parnt.pause) addObject();
		}
		function conTimerListener (e:TimerEvent):void{
			if(!parnt.pause) addCoins();
		}
		public function callOfEvent(e:KeyboardEvent){
			//trace(e.keyCode);
			if(e.keyCode == 32)
				char.jump();
		}
		public function callFromEvent(cmd:String){
			//trace(e.keyCode);
			if(cmd == "jump")
				char.jump();
			if(cmd == "slid")
				char.slides();
			if(cmd == "sits")
				char.sitdown();
			if(cmd == "holds") {
				//char.watifor();
				parnt.pTrue();
			}
		}
		function createCharacter() {
			var gen:String = parnt.masLy.ugend;
			var car:MovieClip;
			if (gen == 'M') car = new main_char();
			else car = new fchar();
			char = new character(this, car);
			addChild(game);
			game.addChild(char);
			base = new basement(this);
			addChild(base);
		}
		function addCoins() {
			var rnd:int = Math.random() * swid * 0.12;
			var slc:int = Math.random() * 3;
			var obj:coinsadder;
			var n:int = 0;
			if(slc==0) {
				for (n = 0; n < 10; n++) {
					obj = new coinsadder(this, char);
					obj.setPos(rnd + swid + 40 * n, (shit * 0.7) - Math.sin(20 * n * Math.PI / 180) * 120);
					game.addChild(obj);
				}
			}
			else if(slc==1) {
				for (n = 0; n < 6; n++) {
					obj = new coinsadder(this, char);
					obj.setPos(rnd + swid + 40 * n, (shit * 0.7));
					game.addChild(obj);
				}
			}
			else {				
				for (n = 0; n < 3; n++) {
					obj = new coinsadder(this, char);
					obj.setPos(rnd + swid + 160 * n, (shit * 0.7));
					game.addChild(obj);
				}
			}
		}
		function addObject() {
			var obj:MovieClip;
			var ynd:Number;
			var rn:int = Math.random() * 8;
			if (rn == 0) { var nob0:prep_obj1 = new prep_obj1();  obj = new objects01(this, char, nob0); ynd = Math.random() * 0.3; obj.scor = 500; }
			if (rn == 1) { var nob1:prep_obj2 = new prep_obj2();  obj = new objects01(this, char, nob1); ynd = Math.random() * 0.1; obj.scor = 1000; }
			if (rn == 2) { var nob2:prep_obj3 = new prep_obj3();  obj = new objects01(this, char, nob2); ynd = Math.random() * 0.1; obj.scor = 2000; }
			if (rn == 3) { var nob3:prep_obj4 = new prep_obj4();  obj = new objects01(this, char, nob3); ynd = Math.random() * 0.1; obj.scor = 500; }
			if (rn == 4) { var nob4:prep_obj5 = new prep_obj5();  obj = new objects02(this, char, nob4); ynd = Math.random() * 0.1; obj.scor = 1500; }
			if (rn == 5) { var nob5:stone = new stone();  obj = new objects01(this, char, nob5); ynd = Math.random() * 0.1; obj.scor = -1000; }
			if (rn == 6) { var nob6:stone = new stone();  obj = new objects01(this, char, nob6); ynd = Math.random() * 0.1; obj.scor = -1000; }
			if (rn == 7) { var nob7:stone = new stone();  obj = new objects01(this, char, nob7); ynd = Math.random() * 0.1; obj.scor = -1000; }
			var rnd:Number = Math.random() * (swid*0.5);
			if (rn == 5 || rn == 6 || rn == 7) obj.setPos(swid + rnd, shit * 0.92);
			else obj.setPos(swid + rnd, shit * (0.5 + ynd));
			game.addChild(obj);
			
			if(parnt.isendGame) removeAllChild();
		}
		function moveDirectChar(e:Event) {
			pause = parnt.pause;
			if (frate != parnt.frams) {
				frate = parnt.frams;
				//myTimer.delay = (24 / parnt.frams) * intv;
			}
			if (parnt.pause) {
				sund.pause();
				myTimer.stop();
				//conTimer.stop();
			}
			else {
				sund.resume();
				myTimer.start();
				//conTimer.start();
			}
			if(score<=1000) {
				parnt.showReturnMessage(0);
				parnt.pause = true;
				removeEventListener(Event.ENTER_FRAME, moveDirectChar);
			}
			//this.x -= 3;
			//if (obj.hitTestObject(char)) 
				//{ trace("HIT "+num++); } 
		}
		function removeOneObject(m:MovieClip) {
			//removeChild(m);
		}
		function changeScore() {
			//trace("your Score " + score);
			if (score < 0) score = 0;
			parnt.scr_txt.text = "" + score;
			parnt.g_var.saveCurentScore(score);
		}
		public function showMessage(mv:MovieClip) {
			//trace(htip[mv.name]+" my name is " + mv.name);
			//return htip[mv.name];
		}
		public function removeAllChild() {
			trace("its removing "+this.numChildren);
			myTimer.removeEventListener(TimerEvent.TIMER, timerListener);			
			//conTimer.removeEventListener(TimerEvent.TIMER, conTimerListener);	
			sund.pause();
			while (this.numChildren > 0) 
				removeChildAt(0);
			//coll = null;
			trace("its removing "+this.numChildren);
		}
	}	
}
