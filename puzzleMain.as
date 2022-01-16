package  {	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import com.greensock.TimelineLite;
	import com.greensock.easing.*;
	
	public class puzzleMain extends MovieClip {
		var parnt:gameFile;
		var swid:Number;
		var shit:Number;
		var puzzle:MovieClip;
		var butns:MovieClip = new MovieClip();
		var sund:sound_controll = new sound_controll("1");
		var scoreTime:Timer = new Timer(500);
		var g_var:global_variable = new global_variable();
		
		var chek:int = 0;
		var chkEnb:Boolean = true;
		var score:int = 0;
		var target:int = 0;
		var objs1:Array = ["brrom", "bucket", "dustpan", "floor_Buffer", "paper_Towel", "vacuum_Cleaner", "waste_Container", "water_Hoses"];
		var objs2:Array = ["carpentry_Pencils", "circular_Saw", "cordless_drill", "framing_Hammer", "linesman_Pliers", "measuring_Tape",
					"pick_Axe", "plumb_Bob", "rakes", "reciprocating_Saw", "screwdrivers", "shovels", "step_Ladders", "utility_Knife", "wrenches"];
		var objs3:Array = ["chef_knife", "cooking_Pots", "grater", "ladle", "lemon_Press", "spoon", "whisk", "wire_Mesh_Colanders"];
		var objs4:Array = ["books", "bp_Apparatus", "hand_Sanitizer", "scissors_Tape", "stethoscope", "thermometer", "tourniquet"];
		var objs5:Array = ["clothing", "defence_Equipment", "digital_Camera", "flashlight", "mobile_Phone", "notepad_Pen", "two_Way_Radio"];
		var objs6:Array = ["chevron_Alignment", "human_crossing", "left_Curve_Ahead", "left_Turn_Ahead", "no_Horn", "no_Left_Turn", "no_Overtaking", 
					"no_Parking", "no_Right_Turn", "no_Truck", "no_U_Trurn", "no_Walk", "right_Curve_Ahead", "right_Turn_Ahead", "school_Zone", 
					"stop_Ahead", "two_way_street"];
		var an:TimelineLite = new TimelineLite();
		var game:MovieClip = new MovieClip();
		var messOn:Boolean = false;
		var helpHold:MovieClip;
					
		public function puzzleMain(par:gameFile) {
			parnt = par;
			swid = par.swid;
			shit = par.shit;
			parnt.g_var.saveCurrentLevel(2);
			score = parnt.g_var.loadCurentScore();
			var cun:String = parnt.g_var.retrundVal('cun');
			target = parnt.g_var.getGameTargetValue(cun);
			parnt.tar_txt.text = ""+100+"%";
			var bg_main:comn_back_mc = new comn_back_mc();
			addChild(bg_main);
			bg_main.x = 0.5 * swid;
			bg_main.y = 0.5 * shit;
			bg_main.scaleX = bg_main.scaleY = 1.2*swid/bg_main.width;
			createButtons();
			checkConditions();
			scoreTime.addEventListener(TimerEvent.TIMER, setTargetAndScore);
			scoreTime.start();			
			parnt.pause = false;
			addChild(game);
			sund.playSpecificSound("sill");
			helpHold = new MovieClip();
			addChild(helpHold);
			var btn_strt_game:button_game_start = new button_game_start();
			helpHold.addChild(btn_strt_game);
			btn_strt_game.x = swid * 0.5;
			btn_strt_game.y = shit * 0.85;
			btn_strt_game.addEventListener(MouseEvent.CLICK, function() {removeChild(helpHold)});
			var help:messHelp3 = new messHelp3();
			helpHold.addChild(help);
			help.x = swid*0.5;
			help.y = shit*0.5;
			an.from(help, 0.5, {delay:4.0, alpha:0});
			an.from(btn_strt_game, 0.25, {alpha:0});
			an.to(help, 0.5, {alpha:0, delay:4.0, onComplete:helpHold.removeChild, onCompleteParams:[help]});
			var worn:messHelp1 = new messHelp1();
			helpHold.addChild(worn);
			worn.x = swid*0.5;
			worn.y = shit*0.5;
			an.from(worn, 0.5, {delay:0.5, alpha:0});
			//an.to(worn, 0.5, {delay:2.5, alpha:0, onComplete:this.removeChild, onCompleteParams:[helpHold]});
			worn.addEventListener(MouseEvent.CLICK, function() {removeChild(helpHold)});
		}
		function setTargetAndScore(e:TimerEvent):void{
			parnt.scr_txt.text = "" + score;
			parnt.tar_txt.text = ""+target;
			scoreTime.removeEventListener(TimerEvent.TIMER, setTargetAndScore);
		}
		function checkConditions() {
			if(score>5000) {
				//score -= 5000;
			}
			else {
				parnt.showReturnMessage(0);
			}
		}
		var btn1:puzzle1;
		var btn2:puzzle2;
		var btn3:puzzle3;
		var btn4:puzzle4;
		var btn5:puzzle5;
		var btn6:puzzle6;
		function createButtons() {
			if(puzzle!=null) removeChild(puzzle);
			addChild(butns); 
			var edu:String = g_var.retrundVal('edu');
			btn1 = new puzzle1();
			btn2 = new puzzle2();
			btn3 = new puzzle3();
			btn4 = new puzzle4();
			btn5 = new puzzle5();
			btn6 = new puzzle6();
			butns.addChild(btn1);
			butns.addChild(btn2);
			butns.addChild(btn3);
			if(edu=="edu_hs") butns.addChild(btn4);
			butns.addChild(btn5);
			butns.addChild(btn6);
			btn1.x = btn6.x = swid*0.25;
			btn2.x = btn5.x = swid*0.5;
			btn3.x = btn4.x = swid*0.75;
			var sft:Number = 0.3;
			btn1.y = btn2.y = btn3.y = shit*0.35;
			btn4.y = btn5.y = btn6.y = shit*0.75;
			an.from(btn1, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
			an.from(btn4, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
			an.from(btn2, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
			an.from(btn5, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
			an.from(btn3, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
			an.from(btn6, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75), onComplete:addEvents});			
		}
		function addEvents() {
			btn1.addEventListener(MouseEvent.CLICK, function() {if(butns!= null) removeChild(butns);createPuzzle(1);});
			btn2.addEventListener(MouseEvent.CLICK, function() {if(butns!=null) removeChild(butns);createPuzzle(2);});
			btn3.addEventListener(MouseEvent.CLICK, function() {if(butns!=null) removeChild(butns);createPuzzle(3);});
			btn4.addEventListener(MouseEvent.CLICK, function() {if(butns!=null) removeChild(butns);createPuzzle(4);});
			btn5.addEventListener(MouseEvent.CLICK, function() {if(butns!=null) removeChild(butns);createPuzzle(5);});
			btn6.addEventListener(MouseEvent.CLICK, function() {if(butns!=null) removeChild(butns);createPuzzle(6);});
		}
		function removePuzzle() {
			if (puzzle != null) removeChild(puzzle);
		}
		
		function changeScore() {
			if (score < 0) score = 0;
			parnt.scr_txt.text = "" + score;
			parnt.g_var.saveCurentScore(score);
		}
		var objs:MovieClip;
		function createPuzzle(puz:int) {
			if(objs!=null) objs.removeAllChild();
			var ary:Array = new Array();
			var rnd:int = Math.random() * 3;
			if(puz==1) ary = objs1;
			if(puz==2) ary = objs2;
			if(puz==3) ary = objs3;
			if(puz==4) ary = objs4;
			if(puz==5) ary = objs5;
			if(puz==6) ary = objs6;
			if(rnd==0) puzzle = new dragDropPuzzle(this, ary, puz);
			if(rnd==1) puzzle = new multpleChoise(this, ary, 2, puz);
			if(rnd==2) puzzle = new takeRightOne(this, ary, 2, puz);
			addChild(puzzle);
			if(chek>=4 && chkEnb) {
				parnt.createOneTimeMessage(3);
				chkEnb = false;
				parnt.g_var.setLevelTargetValue(2, 'yes');
				parnt.g_var.saveCurrentLevel(3);
			}
			if(chek%3==1) {
				var dal:dalal = new dalal();  
				objs = new objdalal(this, dal);
				game.addChild(objs);
				game.setChildIndex(objs, 0);
			}
			addButton();
		}
		public function addButton() {			
			var back:button_back = new button_back();
			puzzle.addChild(back);
			back.x = swid*0.1;
			back.y = shit*0.9;
			back.addEventListener(MouseEvent.CLICK, function() {createButtons();});
		}
		function removeSounds() {
			sund.handleDeactivate();
		}
		public function removeAllChild() {
			sund.pause();
			an.kill();
			removeChild(game);
			if(objs!=null) objs.removeAllChild();
			while (this.numChildren > 0) 
				removeChildAt(0);
		}
	}
	
}
