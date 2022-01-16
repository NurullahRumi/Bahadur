package  {
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.events.Event;
	
	public class gamePlayWater extends MovieClip {
		var parnt:gameFile;
		var char:characterWat;
		var coll:colissionDetections;
		var game:MovieClip = new MovieClip();
		var game1:MovieClip = new MovieClip();
		var game2:MovieClip = new MovieClip();
		var game3:MovieClip = new MovieClip();
		var g_event:mySwipeEvent;
		var sund:sound_controll = new sound_controll();
		var swid:Number;
		var shit:Number;
		var pause:Boolean;
		var intv:Number = 2000;
		var watim:Timer = new Timer(intv);
		var ship:Timer = new Timer(intv*12.75);
		//var conTimer:Timer = new Timer(3000);
		var lifeTim:Timer = new Timer(1000);
		var life:Number = 200;
		var score:int = 0;
		var target:int = 0;
		var frate:Number = 0;
		var htip:Array = [false, false];
		var locs:Array = [0.7, 0.8, 0.9];
		var lifeBar:life_box = new life_box();
		var speed:Number = 7;
		var messOn:Boolean = false;

		public function gamePlayWater(par:gameFile) {
			// constructor code
			parnt = par;
			enableTouchEvent();
			swid = par.swid;
			shit = par.shit;
			//score = parnt.g_var.loadCurentScore();
			parnt.g_var.saveCurrentLevel(4);
			var cun:String = parnt.g_var.retrundVal('cun');
			target = parnt.g_var.getGameTargetValue(cun);
			parnt.tar_txt.text = ""+100+"%";
			coll = new colissionDetections();
			addChild(game3);
			addChild(game2);
			addChild(game1);
			addChild(game);
			setChildIndex(game3, 0);
			setChildIndex(game1, 3);
			createCharacter();
			addEventListener(Event.ENTER_FRAME, moveDirectChange);
			watim.addEventListener(TimerEvent.TIMER, timerListener);	
			watim.start();
			ship.addEventListener(TimerEvent.TIMER, shipTimerListener);	
			ship.start();
			//conTimer.addEventListener(TimerEvent.TIMER, conTimerListener);
			//conTimer.start();
			lifeTim.addEventListener(TimerEvent.TIMER, decreaseTime);
			lifeTim.start();
			//addChild(lifeBar);
			lifeBar.scaleX = 100;
			lifeBar.x = swid*0.52;
			lifeBar.y = shit*0.04;
			changeScore();
		}
		function decreaseTime(e:Event) {
			if(!parnt.pause)
			   life -= 2;
			if(life<=0) {
				life = 0;
				parnt.masLy.waterEndGameMessage();
			}
			score++;
			//trace("life goes "+life);
			//changeScore();
		}
		function enableTouchEvent() {
			g_event = new mySwipeEvent(this);
			addChild(g_event);
		}
		function timerListener (e:TimerEvent):void{
			if(!parnt.pause) addObject();
		}
		function shipTimerListener (e:TimerEvent):void{
			if(!parnt.pause) addShipObject();
		}
		/*function conTimerListener (e:TimerEvent):void{
			if(!parnt.pause) addCoins();
		}
		function addCoins() {
			var rnd:int = Math.random() * swid * 0.12;
			var slc:int = Math.random() * 2;
			var obj:coinsadderWat;
			var n:int = 0;
			var crnd:int = Math.random() * 3;
			//trace("Coin Position "+crnd);
			if(slc==0) {
				for (n = 0; n < 6; n++) {
					obj = new coinsadderWat(this, char);
					obj.setPos(rnd + swid + 40 * n, (shit * locs[crnd]));
					game.addChild(obj);
					obj.cpos = crnd;
					obj.scaleX = obj.scaleY = 1 + 2*(crnd - 1) / 10;
				}
			}
			else {				
				for (n = 0; n < 3; n++) {
					obj = new coinsadderWat(this, char);
					obj.setPos(rnd + swid + 160 * n, (shit * locs[crnd]));
					game.addChild(obj);
					obj.cpos = crnd;
					obj.scaleX = obj.scaleY = 1 + 2*(crnd - 1) / 10;
				}
			}
		}*/
		function addObject() {
			var obj:MovieClip;
			var ynd:int;
			var rn:int = Math.random() * 2;
			if (rn == 0) { var nob0:prep_obj17 = new prep_obj17();  obj = new watObjec01(this, char, nob0); obj.scor = 10; }
			if (rn == 1) { var nob2:prep_obj19 = new prep_obj19();  obj = new watObjec01(this, char, nob2); obj.scor = 30; }
			var rnd:Number = Math.random() * (swid * 0.3);
			ynd = int(Math.random() * 3);
			obj.cpos = ynd;
			obj.scaleX = obj.scaleY = 0.8 - (0.1 - ynd * 0.1);
			if(ynd==0) obj.setPos(swid + rnd, shit * (0.70));
			else obj.setPos(swid + rnd, shit * (0.68 + ynd*0.12));
			if(ynd==0) game1.addChild(obj);
			if(ynd==1) game2.addChild(obj);
			if(ynd==2) game3.addChild(obj);
		}
		function addShipObject() {			
			var obj:MovieClip;
			var nrn:int = Math.random()*3;
			var ynd:int;
			var rnd:Number;
			ynd = int(Math.random() * 3);
			//obj.cpos = ynd;
			var dal:MovieClip;
			//ynd = int(Math.random() * 4);
			rnd = Math.random() * (swid*0.5);
			if (nrn==0) {
				dal = new prep_obj20();  
				obj = new objectsd(this, char, dal);
				obj.otype = 3;
			}
			else if (nrn==1) {
				dal = new prep_obj21();  
				obj = new objectsd(this, char, dal);
				obj.otype = 4;
			}
			else if (nrn==2) {
				dal = new prep_obj22();  
				obj = new objectsd(this, char, dal);
				obj.otype = 5;
			}
			/*else {				
				dal = new prep_obj18();  
				obj = new objectsd(this, char, dal);
				obj.otype = 6;
			}*/
			obj.cpos = ynd;
			obj.setPos(swid + rnd, shit * (0.68 + ynd*0.12));
			if(ynd==0) game1.addChild(obj);
			if(ynd==1) game2.addChild(obj);
			if(ynd==2) game3.addChild(obj);
		}
		public function callFromEvent(cmd:String){
			//trace(cmd);
			var posi:int = char.cpos;
			if(cmd == "jump")
				char.moveUp();
				posi = char.cpos;
			if(cmd == "slid")
				char.moveDown();
				posi = char.cpos;
			if(cmd == "sits")
				char.moveDown();
				posi = char.cpos;
			if(cmd == "holds") {
				//char.watifor();
				char.moveUp();
				posi = char.cpos;
			}
			setGameIndex(posi);
		}
		function setGameIndex(posi:int) {
			setChildIndex(game1, 0);
			if(posi>1) { setChildIndex(game, 2); setChildIndex(game2, 1); }
			if(posi<=1) { setChildIndex(game2, 2); setChildIndex(game, 1); }
			setChildIndex(game3, 3);
		}

		function moveDirectChange(e:Event) {			
			pause = parnt.pause;
			if (frate != parnt.frams) {
				frate = parnt.frams;
				//myTimer.delay = (24 / parnt.frams) * intv;
			}
			if (parnt.pause) {
				sund.pause();
			}
			else {
				sund.resume();
			}
		}
		function createCharacter() {
			var gen:String = parnt.masLy.ugend;
			var car:MovieClip;
			car = new mcharwt();
			if (gen == 'M') car = new mcharwt();
			else car = new fcharwt();
			char = new characterWat(this, car);
			game2.addChild(char);
		}
		/*function createCharacter() {
			var gen:String = parnt.masLy.ugend;
			var car:MovieClip;
			if (gen == 'M') car = new main_char();
			else car = new fchar();
			char = new character(this, car);
			addChild(game);
			game.addChild(char);
			base = new basement(this);
			addChild(base);
		}*/
		function changeScore() {
			//trace("your Score " + score);
			var scor:Number = (score/target)*100;
			parnt.scr_txt.text = "";// + scor.toFixed(2) + "%";
			parnt.tar_txt.text = "";
			if(life>200) life = 200;
			parnt.lifeBar.scaleX = (life/100)*50;
		}
		public function removeAllChild() {
			//trace("its removing "+this.numChildren);
			watim.removeEventListener(TimerEvent.TIMER, timerListener);			
			//conTimer.removeEventListener(TimerEvent.TIMER, conTimerListener);	
			lifeTim.removeEventListener(TimerEvent.TIMER, decreaseTime);	
			sund.pause();
			while (this.numChildren > 0) 
				removeChildAt(0);
		}
		function removeSounds() {
			sund.handleDeactivate();
		}
	}
	
}
