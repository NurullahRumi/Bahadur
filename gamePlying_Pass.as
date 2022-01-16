package  {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import com.greensock.TweenLite;
	import com.greensock.TimelineLite;
	import com.greensock.easing.*;
	
	public class gamePlying_Pass extends MovieClip {
		var parnt:gameFile;
		var sund:sound_controll = new sound_controll("1");
		var swid:Number;
		var shit:Number;
		var score:int = 0;
		var target:int = 0;
		var cun_qust:Array = new Array();
		var cun_answ:Array = new Array();
		var hus_posi:Array = new Array();
		var ques:MovieClip;
		var csec:int;
		var cqus:int;
		var scoreTime:Timer = new Timer(500);
		var chek:int = 0;
		var cunter:int = 0;
		var game:MovieClip = new MovieClip();
		var messOn:Boolean = false;
		var an:TimelineLite = new TimelineLite();
		var helpHold:MovieClip;

		public function gamePlying_Pass(par:gameFile) {
			// constructor code
			parnt = par;
			swid = par.swid;
			shit = par.shit;
			parnt.g_var.saveCurrentLevel(3);
			cun_qust[0] = ["p_qus_1"];
			cun_answ[0] = ["yes"];
			cun_qust[1] = ["p_qus_2"];
			cun_answ[1] = ["yes"];
			cun_qust[2] = ["p_qus_3"];
			cun_answ[2] = ["yes"];
			cun_qust[3] = ["p_qus_4"];
			cun_answ[3] = ["yes"];
			cun_qust[4] = ["p_qus_5"];
			cun_answ[4] = ["no"];
			hus_posi[0] = [0.104, 0.455];
			hus_posi[1] = [0.326, 0.436];
			hus_posi[2] = [0.53, 0.426];
			hus_posi[3] = [0.697, 0.448];
			hus_posi[4] = [0.888, 0.465];
			score = parnt.g_var.loadCurentScore();
			//score = 24000;
			var cun:String = parnt.g_var.retrundVal('cun');
			target = parnt.g_var.getGameTargetValue(cun);
			parnt.tar_txt.text = ""+target;
			createBackground();
			createHouses();
			scoreTime.addEventListener(TimerEvent.TIMER, setTargetAndScore);
			scoreTime.start();			
			addEventListener(Event.ENTER_FRAME, moveDirectChar);
			parnt.pause = false;
			addChild(game);
			helpHold = new MovieClip();
			addChild(helpHold);
			/*var btn_strt_game:button_game_start = new button_game_start();
			helpHold.addChild(btn_strt_game);
			btn_strt_game.x = swid * 0.5;
			btn_strt_game.y = shit * 0.85;
			btn_strt_game.addEventListener(MouseEvent.CLICK, function() {removeChild(helpHold)});*/
			var help:messHelp4 = new messHelp4();
			helpHold.addChild(help);
			help.x = swid*0.5;
			help.y = shit*0.5;
			an.from(help, 0.5, {delay:1.0, alpha:0});
			//an.from(btn_strt_game, 0.25, {alpha:0});
			an.to(help, 0.5, {alpha:0, delay:2.0, onComplete:helpHold.removeChild, onCompleteParams:[help]});
			var worn:messHelp1 = new messHelp1();
			helpHold.addChild(worn);
			worn.x = swid*0.5;
			worn.y = shit*0.5;
			an.from(worn, 0.5, {delay:0.5, alpha:0});
			an.to(worn, 2.5, {alpha:1});
			an.to(worn, 0.25, {alpha:0, onComplete:this.removeChild, onCompleteParams:[helpHold]});
			an.to(worn, 0.1, {alpha:0, onComplete:playInfoSounds})
			checkConditions();
		}
		function playInfoSounds() {
			sund.playSpecificSound("pass");
		}
		function setTargetAndScore(e:TimerEvent):void{
			parnt.scr_txt.text = "" + score;
			parnt.tar_txt.text = ""+target;
			scoreTime.removeEventListener(TimerEvent.TIMER, setTargetAndScore);
		}
		function checkConditions() {
			if(score<=1000) {
				parnt.showReturnMessage(0);
				parnt.posDis = true;
			}
			else {
				createCostForTheLevel();
			}
		}
		function removeSounds() {
			sund.stopAudCnlOnBack();
		}
		public function createCostForTheLevel() {
			ques = new MovieClip();
			addChild(ques);
			var msg:messBoxs6 = new messBoxs6();
			ques.addChild(msg);
			msg.x = swid*0.5;
			msg.y = shit*0.5;
			var gnr:p_genr = new p_genr();
			ques.addChild(gnr);
			var arg:p_argn = new p_argn();
			ques.addChild(arg);
			gnr.y = arg.y = 0.8*shit;
			gnr.x = 0.35*swid;
			arg.x = 0.65*swid;
			arg.name = "arg";
			gnr.name = "gen";
			gnr.addEventListener(MouseEvent.CLICK, applyDecition);
			arg.addEventListener(MouseEvent.CLICK, applyDecition);
			an.from(ques, 0.5, {alpha:0});
			
		}
		var objs:MovieClip;
		function applyDecition(e:Event) {
			var nam:String = e.target.name;
			if(nam=="arg") score -= 6900;
			if(nam=="gen") score -= 3450;
			parnt.scr_txt.text = "" + score;
			parnt.g_var.saveCurentScore(score);
			removeChild(ques);
			//if(chek%3==1) {
			var dal:dalal = new dalal();  
			objs = new objdalal(this, dal);
			game.addChild(objs);
			game.setChildIndex(objs, 0);
			addEvents();
			removeSounds();
			//}
		}
		public function manageScore(scr:int) {
			score += scr;
			if(score<0) score = 0;
			parnt.scr_txt.text = "" + score;
			parnt.g_var.saveCurentScore(score);
		}
		
		public function createBackground() {			
			var back:MovieClip;
			var gen:String = parnt.g_var.retrundVal('gen');
			if(gen=='M')
				back = new pas_back();
			else 
				back = new pasg_back();
			addChild(back);
			back.x = swid*0.5;
			back.y = shit*0.5;
			back.scaleX = back.scaleY = 1.5*swid/back.width;
		}
		var h_1:p_h_1 = new p_h_1();
		var h_2:p_h_2 = new p_h_2();
		var h_3:p_h_3 = new p_h_3();
		var h_4:p_h_4 = new p_h_4();
		var h_5:p_h_5 = new p_h_5();
		
		public function createHouses() {
			addChild(h_1);
			addChild(h_2);
			addChild(h_3);
			addChild(h_4);
			addChild(h_5);
			h_1.y = 0.455*shit;
			h_2.y = 0.436*shit;
			h_3.y = 0.426*shit;
			h_4.y = 0.448*shit;
			h_5.y = 0.465*shit;
			h_1.x = 0.104*swid;
			h_2.x = 0.326*swid;
			h_3.x = 0.53*swid;
			h_4.x = 0.697*swid;
			h_5.x = 0.888*swid;
			h_1.name = "0";
			h_2.name = "1";
			h_3.name = "2";
			h_4.name = "3";
			h_5.name = "4";			
		}
		function addEvents() {
			h_1.addEventListener(MouseEvent.CLICK, showMmessage);
			h_2.addEventListener(MouseEvent.CLICK, showMmessage);
			h_3.addEventListener(MouseEvent.CLICK, showMmessage);
			h_4.addEventListener(MouseEvent.CLICK, showMmessage);
			h_5.addEventListener(MouseEvent.CLICK, showMmessage);
		}
		public function showMmessage(e:Event) {
			switch(e.target.name) {
				case "0":
					h_1.removeEventListener(MouseEvent.CLICK, showMmessage);
					TweenLite.to(h_1, 1.5, {scaleX:1.5, scaleY:1.5, onComplete:addMyMassages});
					TweenLite.to(h_1, 1.0, {delay:2.5, scaleX:1.0, scaleY:1.0});
					break;
				case "1":
					h_2.removeEventListener(MouseEvent.CLICK, showMmessage);
					TweenLite.to(h_2, 1.5, {scaleX:1.5, scaleY:1.5, onComplete:addMyMassages});
					TweenLite.to(h_2, 1.0, {delay:2.5, scaleX:1.0, scaleY:1.0});
					break;
				case "2":
					h_3.removeEventListener(MouseEvent.CLICK, showMmessage);
					TweenLite.to(h_3, 1.5, {scaleX:1.5, scaleY:1.5, onComplete:addMyMassages});
					TweenLite.to(h_3, 1.0, {delay:2.5, scaleX:1.0, scaleY:1.0});
					break;
				case "3":
					h_4.removeEventListener(MouseEvent.CLICK, showMmessage);
					TweenLite.to(h_4, 1.5, {scaleX:1.5, scaleY:1.5, onComplete:addMyMassages});
					TweenLite.to(h_4, 1.0, {delay:2.5, scaleX:1.0, scaleY:1.0});
					break;
				case "4":
					h_5.removeEventListener(MouseEvent.CLICK, showMmessage);
					TweenLite.to(h_5, 1.5, {scaleX:1.5, scaleY:1.5, onComplete:addMyMassages});
					TweenLite.to(h_5, 1.0, {delay:2.5, scaleX:1.0, scaleY:1.0});
					break;
			}
			csec = int(e.target.name);
		}
		function addMyMassages() {
			var ins:MovieClip;
			var yes:yesbtn;
			var no:nobtn;
			ques = new MovieClip();
			addChild(ques);
			var msg:Class = getDefinitionByName(cun_qust[csec][0]) as Class;
			ins = new msg();
			ques.addChild(ins);
			ins.x = swid*0.5;
			ins.y = shit*0.5;
			yes = new yesbtn();
			no  = new nobtn();
			yes.y = no.y = 0.7*shit;
			yes.x = 0.65*swid;
			no.x = 0.35*swid;
			yes.name = "yes";
			no.name = "no";
			//yes.scaleX = no.scaleX = yes.scaleY = no.scaleY = 2;
			ques.addChild(yes);
			ques.addChild(no);
			yes.addEventListener(MouseEvent.CLICK, checkAnswer);
			no.addEventListener(MouseEvent.CLICK, checkAnswer);
		}
		var end:MovieClip;
		function checkAnswer(e:Event) {			
			var nm:String = e.target.name;
			var tar:MovieClip = MovieClip(e.target);
			//trace("your position "+tar.x);		
			var don:MovieClip;
			if(nm==cun_answ[csec][0]) { 
				don = new done();
				addChild(don);
				don.x = swid*hus_posi[csec][0];
				don.y = shit*hus_posi[csec][1];
				manageScore(1000);
				end = new right();
				addChild(end);
				end.x = 0.5 * swid;
				end.y = 0.5 * shit;
				chek++;
			}
			else {
				don = new failed();
				addChild(don);
				don.x = swid*hus_posi[csec][0];
				don.y = shit*hus_posi[csec][1];
				manageScore(-1000);
				end = new wrong();
				addChild(end);
				end.x = 0.5 * swid;
				end.y = 0.5 * shit;
			}
			cunter++;
			removeChild(ques);
			TweenLite.from(end, 0.75, {scaleX:0, scaleY:0});
			TweenLite.to(end, 0.1, {delay:1.5, onComplete:removeButton});
			//end.addEventListener(MouseEvent.CLICK, removeButton);
		}
		function removeButton(e:Event=null) {
			removeChild(end);
			if(chek>=5) {
				parnt.createOneTimeMessage(4);
				parnt.g_var.saveCurrentLevel(5);
			}
			else if(cunter>=5 && chek<5) {
				parnt.createOneTimeMessage(5);
			}
		}

		function moveDirectChar(e:Event) {
			if (parnt.pause) {
				sund.pause();
			}
			else {
				sund.resume();
			}
		}
		public function removeAllChild() {
			sund.pause();
			an.kill();
			if(objs!=null) objs.removeAllChild();
			while (this.numChildren > 0) 
				removeChildAt(0);
		}
	}
	
}
