package  {
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class gamePlying extends MovieClip {
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
		var speed:Number = 7;
		var myTimer:Timer = new Timer(intv*1.0);
		var myDecis:Timer = new Timer(intv*4.698);
		var conTimer:Timer = new Timer(6000);
		var scoreTime:Timer = new Timer(500);
		var score:int = 0;
		var target:int = 0;
		var frate:Number = 0;
		var htip:Array = [false, false];
		var dalEnab:Number = 1;
		var sklEnab:Boolean = true;
		var infEnab:Boolean = true;
		var sucEnab:Boolean = true;
		var messOn:Boolean = false;
		var someDs:Boolean = true;
		var life:Number = 100;

		public function gamePlying(par:gameFile) {
			// constructor code
			parnt = par;
			swid = par.swid;
			shit = par.shit;
			parnt.pause = true;
			//parnt.g_var.saveCurentScore(0);
			parnt.g_var.saveCurrentLevel(0);
			score = parnt.g_var.loadCurentScore();
			dalEnab = int(score/20000);
			var cun:String = parnt.g_var.retrundVal('cun');
			var edu:String = parnt.g_var.retrundVal('edu');
			if((cun=="cun_ita" || cun=="cun_uk") && (edu=="edu_no" || edu=="edu_5")) {
				sklEnab = false;
				infEnab = false;
				sucEnab = false;
				someDs = false;
			}
			target = parnt.g_var.getGameTargetValue(cun);
			coll = new colissionDetections();
			createCharacter();
			addObject();
			addEventListener(Event.ENTER_FRAME, moveDirectChar);
			//parnt.parnt.stage.addEventListener(KeyboardEvent.KEY_DOWN, callOfEvent);		
			myTimer.addEventListener(TimerEvent.TIMER, timerListener);			
			myDecis.addEventListener(TimerEvent.TIMER, decisionListener);			
			conTimer.addEventListener(TimerEvent.TIMER, conTimerListener);
			myTimer.start();
			myDecis.start();
			conTimer.start();
			scoreTime.addEventListener(TimerEvent.TIMER, setTargetAndScore);
			scoreTime.start();			
			enableTouchEvent();
			//addCoins();
			//myTimer.delay = 2000;
			//trace("it was created");
		}
		function setTargetAndScore(e:TimerEvent):void{
			parnt.scr_txt.text = "" + score;
			parnt.tar_txt.text = ""+target;
			scoreTime.removeEventListener(TimerEvent.TIMER, setTargetAndScore);
		}
		function enableTouchEvent() {	
			g_event = new mySwipeEvent(this);
			game.addChild(g_event);
		}
		function timerListener (e:TimerEvent):void{
			if(!parnt.pause) addObject();
		}
		function decisionListener (e:TimerEvent):void{
			if(!parnt.pause) addDecisions();
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
				//parnt.pTrue();
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
			changeScore();
			//parnt.tar_txt.text = ""+target;
			var rnd:int = 0;
			var slc:int = Math.random() * 3;
			var obj:coinsadder;
			var n:int = 0;
			if(slc==0) {
				for (n = 0; n < 10; n++) {
					obj = new coinsadder(this, char);
					obj.setPos(rnd + swid + 40 * n, (shit * 0.6) - Math.sin(20 * n * Math.PI / 180) * 120);
					game.addChild(obj);
				}
			}
			else if(slc==1) {
				for (n = 0; n < 6; n++) {
					obj = new coinsadder(this, char);
					obj.setPos(rnd + swid + 40 * n, (shit * 0.6));
					game.addChild(obj);
				}
			}
			else {				
				for (n = 0; n < 3; n++) {
					obj = new coinsadder(this, char);
					obj.setPos(rnd + swid + 160 * n, (shit * 0.6));
					game.addChild(obj);
				}
			}
			if(score>target && sucEnab && !messOn) {
				messOn = true;
				parnt.createOneTimeMessage(1);
				sucEnab = false;
				parnt.g_var.saveCurrentLevel(1);
			}
		}
		var objs:MovieClip;
		function addObject() {
			changeScore();
			parnt.tar_txt.text = ""+target;
			var obj:MovieClip;
			var ynd:Number;
			var rn:int = Math.random() * 5;
			if (rn == 0) { var nob0:prep_obj1 = new prep_obj1();  obj = new objects01(this, char, nob0); ynd = Math.random() * 0.4; obj.scor = 7000; }
			if (rn == 1) { var nob5:stone = new stone();  obj = new objects02(this, char, nob5, 1); ynd = Math.random() * 0.1; obj.scor = -5; }
			if (rn == 2) { var nob6:stick = new stick();  obj = new objects02(this, char, nob6, 1); ynd = Math.random() * 0.1; obj.scor = -5; }
			if (rn == 3) { var nob7:logs = new logs();  obj = new objects02(this, char, nob7, 2); ynd = Math.random() * 0.1; obj.scor = -10; }
			if (rn == 4) { var nob8:spike = new spike();  obj = new objects02(this, char, nob8, 1); ynd = Math.random() * 0.1; obj.scor = -10; }
			//if (rn == 5) { var nob5:prep_obj2 = new prep_obj2(); obj = new objects02(this, char, nob5); ynd = 0.3; }
			var rnd:Number = Math.random() * (swid*0.5);
			if (rn == 0) obj.setPos(swid + rnd, shit * (0.3 + ynd));
			else if(rn==3)  obj.setPos(swid + rnd, shit * 0.65);
			else obj.setPos(swid + rnd, shit * 0.93);
			game.addChild(obj);			
			if(parnt.isendGame) removeAllChild();
			
			if(dalEnab*20000<score && !parnt.pause && !messOn) {
				parnt.g_var.saveCurrentLevel(0);
				dalEnab++;
				messOn = true;
				var dal:dalal = new dalal();  
				objs = new objdalal(this, dal);
				game.addChild(objs);
				game.setChildIndex(objs, game.numChildren-1);
				sund.mute_bg_sund();
			}
		}
		public function resetSoundVolume() {
			sund.unmute_bg_sund();
		}
		function addDecisions() {
			var obj:MovieClip;
			var ynd:Number;
			var rnd:Number = Math.random() * (swid*0.5);
			var nrn:int = Math.random()*2;
			if (score > target && sklEnab && nrn==0 && someDs) {
				//parnt.parnt.addInformationWindow();
				var skil:skilQ = new skilQ();  obj = new objectsd(this, char, skil);
				ynd = 0.4;
				obj.otype = 1;
				rnd = Math.random() * (swid*0.5);
				obj.setPos(swid + rnd, shit * (0.5 + ynd));
				game.addChild(obj);
				game.setChildIndex(obj, 0);
				sklEnab = false;
			}
			
			if (score > target  && infEnab && nrn==1 && someDs) {
				//parnt.parnt.addInformationWindow();
				var info:infoQ = new infoQ();  obj = new objectsd(this, char, info);
				ynd = 0.4;
				obj.otype = 2;
				rnd = Math.random() * (swid*0.5);
				obj.setPos(swid + rnd, shit * (0.5 + ynd));
				game.addChild(obj);
				game.setChildIndex(obj, 0);
				infEnab = false;
			}
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
				conTimer.stop();
				char.pauses();
			}
			else {
				messOn = false;
				sund.resume();
				myTimer.start();
				conTimer.start();
			}
		}
		function removeOneObject(m:MovieClip) {
			//removeChild(m);
		}
		function changeScore() {
			//trace("your Score " + score);
			if (score < 0) score = 0;
			//parnt.scr_txt.text = "" + score;
			//trace(life+" is your life");
			parnt.lifeBar.scaleX = life;
			if(score<0) score = 0;
			parnt.g_var.saveCurentScore(score);
			if(life<=0) {
				parnt.masLy.waterEndGameMessage();
				parnt.pause = true;
				char.pauses();
			}
		}
		//public function showMessage(mv:MovieClip) {
			//trace(htip[mv.name]+" my name is " + mv.name);
			//return htip[mv.name];
		//}
		public function removeAllChild() {
			//trace("its removing "+this.numChildren);
			if(objs!=null) objs.removeAllChild();
			myTimer.removeEventListener(TimerEvent.TIMER, timerListener);			
			conTimer.removeEventListener(TimerEvent.TIMER, conTimerListener);	
			sund.pause();
			while (this.numChildren > 0) 
				removeChildAt(0);
			//coll = null;
			//trace("its removing "+this.numChildren);
		}
		function removeSounds() {
			sund.handleDeactivate();
		}
	}	
}
