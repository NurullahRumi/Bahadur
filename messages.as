package  {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.getDefinitionByName;
	import com.greensock.TweenLite;
	
	public class messages extends MovieClip {
		var g_var:global_variable = new global_variable();
		var parnt:gameFile;
		var swid:Number;
		var shit:Number;
		var scr_txt:TextField = new TextField();  // its for the user name.
		var tf:TextFormat = new TextFormat();
		var uname:String;
		var ucunt:String;
		var ueduc:String;
		var ugend:String;
		var uphon:String;
		var score:Number = 0;
		var msgNum:int = 0;
		var msg:MovieClip;
		var endWGame:Boolean = false;
		var inf_1:MovieClip;
		var inst:MovieClip;
		//var scoreTime:Timer = new Timer(500);

		public function messages(par:gameFile) { 
			// constructor code  usrInf.data.name
			parnt = par;
			swid = par.swid;
			shit = par.shit;
			addMenuBack();
			this.mouseEnabled = true;
		}
		function addMenuBack() {
			uname = g_var.retrundVal('nam');
			ucunt = g_var.retrundVal('cun');
			ueduc = g_var.retrundVal('edu');
			ugend = g_var.retrundVal('gen');
			uphon = g_var.retrundVal('phn');
			var clev:int = parnt.lvl;
			if(clev==0 || clev==4) inf_1 = new topBack();
			else inf_1 = new topBack1();
			inf_1.x = swid * 0.5;
			inf_1.y = shit * 0.0;
			addChild(inf_1);
			tf.size = 26;
			scr_txt.defaultTextFormat = tf;
			scr_txt.x = swid * 0.1;
			scr_txt.y = shit * 0.01;
			scr_txt.width = 200;
			scr_txt.text = uname;
			scr_txt.textColor = 0x000000;
			
            var type:Class = getDefinitionByName(ucunt) as Class;
            inst = new type();
			addChild(inst);
			inst.x = swid * 0.05;
			inst.y = shit * 0.03;
			inst.scaleX = inst.scaleY = 0.3;
			
			var spc:Array = ucunt.split('_');			
			addChild(scr_txt);
		}
		function createMessageObject(num:Number, mnum:int) {		
			score = num;
			msgNum = mnum;
			if(mnum==0) {
				if ((ueduc == "edu_no" || ueduc == "edu_5") && (ucunt == "cun_ita" || ucunt == "cun_uk"))
					msg = new messBoxs2();
				else 
					msg = new messBoxs();
			}
			else if(mnum==1) {
				msg = new messBoxs4();
			}
			else if(mnum==2) {
				msg = new messBoxs3();
			}
			else {
				msg = new messBoxs5();
			}
			addChild(msg);
			TweenLite.from(msg, 4.15, {scaleX:1, scaleY:1});
			msg.x = swid * 0.5;
			msg.y = shit * 0.5;
			var bt1:MovieClip = new homebtn();
			var bt2:MovieClip = new nobtn();
			var bt3:MovieClip = new yesbtn();
			bt1.x = -swid * 0.1;
			bt2.x = swid * 0.0;
			bt3.x = swid * 0.1;
			bt1.y = bt2.y = bt3.y = shit * 0.2;
			bt3.name = "next";
			bt1.name = "prev";
			bt2.name = "clos";
			if ((ueduc == "edu_no" || ueduc == "edu_5") && (ucunt == "cun_ita" || ucunt == "cun_uk"))
				bt3.x = swid * 0.0;
			else {
				//msg.addChild(bt1);
				msg.addChild(bt2);
				//bt1.addEventListener(MouseEvent.CLICK, removeThisObject);
				bt2.addEventListener(MouseEvent.CLICK, removeThisObject);
				bt2.x = -swid*0.1;
			}
			/*if ((ueduc == "edu_no" || ueduc == "edu_5") && (ucunt == "cun_ita" || ucunt == "cun_uk"))
				trace("its ok");
			else {
				bt1.addEventListener(MouseEvent.CLICK, removeThisObject);
				bt2.addEventListener(MouseEvent.CLICK, removeThisObject);
			}*/
			msg.addChild(bt3);
			bt3.addEventListener(MouseEvent.CLICK, removeThisObject);
		}
		function createMessageForWater(num:int) {
			if(num==3) {
				msg = new messBoxsBD();
			}
			else if(num==4) {
				msg = new messBoxsML();
			}
			else if(num==5) {
				msg = new messBoxsTH();
			}
			else {
				msg = new messBoxsPI();
			}
			addChild(msg);
			msg.x = swid * 0.5;
			msg.y = shit * 0.5;
			TweenLite.from(msg, 4.15, {scaleX:1, scaleY:1});
			msg.addEventListener(MouseEvent.CLICK, removeWaqterMessage);
		}
		function removeWaqterMessage(e:Event) {
			removeChild(msg);
			parnt.g_var.saveCurrentChoise('sad');
			parnt.g_var.saveCurrentLevel(6);
			parnt.parnt.addIntroWindow(7);
		}
		function createReturnMessage(mnum:int) {
			msgNum = mnum;
			msg = new messBoxs5();
			addChild(msg);
			msg.x = swid * 0.5;
			msg.y = shit * 0.5;
			var bt3:MovieClip = new yesbtn();
			bt3.x = swid * 0.0;
			bt3.y = shit * 0.2;
			bt3.name = "next";
			msg.addChild(bt3);
			bt3.addEventListener(MouseEvent.CLICK, gotoParentMovie);
		}
		function gotoParentMovie(E:Event) {			
			removeChild(msg);
			parnt.isendGame = true; 
			parnt.addGameWindowInstant(0);
		}
		function removeThisObject(e:Event=null) {
			//var obj:MovieClip = e.target.parent as MovieClip;
			//obj.removeEventListener(MouseEvent.CLICK, removeThisObject);
			while (msg.numChildren > 0) {
				msg.removeChildAt(0);
			}
			//removeChild(obj);
			if (e.target.name == "clos") {parnt.pause = false; parnt.game.char.myplay(); }
			if (e.target.name == "prev") {parnt.endGames(); parnt.parnt.addIntroWindow(7); }
			if (e.target.name == "next") {
				if(msgNum==1) endOfSkillMessges(); 
				else if(msgNum==2) endOfInfoMessges(); 
				if ((ueduc == "edu_no" || ueduc == "edu_5") && (ucunt == "cun_ita" || ucunt == "cun_uk"))
					endWithWaterLevel()
				else 
					secondMessages(); 
			}
		}
		function secondMessages() {
			//parnt.pause = false; parnt.game.score -= score; parnt.game.char.myplay();
			msg = new MovieClip();
			addChild(msg);
			msg.x = swid*0.5;
			msg.y = shit*0.5;
			if ((ueduc == "edu_no" || ueduc == "edu_5") && (ucunt == "cun_ita" || ucunt == "cun_uk")) {
				var mm:messBoxs2 = new messBoxs2();
				mm.name = "mm1";
				msg.addChild(mm);
				mm.addEventListener(MouseEvent.CLICK, endOfMessges);
			}
			else {
				var mm1:dalMes1 = new dalMes1();
				var mm2:dalMes2 = new dalMes2();
				//var mm3:dalMes3 = new dalMes3();
				mm1.name = "mm1";
				mm2.name = "mm2";
				//mm3.name = "mm3";
				msg.addChild(mm1);
				msg.addChild(mm2);
				//msg.addChild(mm3);
				mm1.x = -swid * 0.15;
				mm2.x = swid * 0.15;
				//mm3.x = swid * 0.32;
				mm1.addEventListener(MouseEvent.CLICK, endOfMessges);
				mm2.addEventListener(MouseEvent.CLICK, endOfMessges);
				//mm3.addEventListener(MouseEvent.CLICK, endOfMessges);
			}
		}
		function endOfMessges(e:Event) {
			var nam:String = e.target.name;
			removeChild(msg);
			var clev:int = g_var.loadCurrentLevel();
			var cscr:int = g_var.loadCurentScore();
			if (nam == "mm1") {parnt.pause = false;
				if(clev==0) parnt.game.char.myplay(); }
			//	parnt.g_var.saveCurrentLevel(4); parnt.startGamesWithLevel();}
			if (nam == "mm2") {
				cscr -= 40000; 
				parnt.pause = false;
				parnt.isendGame = true;
				parnt.g_var.saveCurrentLevel(4); 
				parnt.startGamesWithLevel();
				if(clev==0) parnt.game.char.myplay(); 
			}
			//if (nam == "mm3") {
			//	cscr -= 10000; 
			//	parnt.pause = false; 
			//	if(clev==0) parnt.game.char.myplay();
			//}
			if(cscr<0) cscr = 0;
			parnt.game.score = cscr;
			if(clev==0) {
				parnt.game.changeScore();
			}
			else g_var.saveCurentScore(cscr);
		}
		function endWithWaterLevel() {			
			removeChild(msg);
			parnt.isendGame = true; 
			parnt.addGameWindowInstant(4);/* parnt.initiateGame(1);*/ 
		}
		function endOfSkillMessges() {
			removeChild(msg);
			parnt.game.score -= 20000;
			parnt.isendGame = true; 
			parnt.addGameWindowInstant(2);/* parnt.initiateGame(1);*/ 
		}
		function endOfInfoMessges() {
			removeChild(msg);
			parnt.game.score -= 20000;
			parnt.isendGame = true; 
			parnt.addGameWindowInstant(1);/* parnt.initiateGame(1);*/ 
		}
		function waterEndGameMessage() {
			if(!endWGame) {
				var mm:level_fail = new level_fail();
				addChild(mm);
				mm.x = swid*0.5;
				mm.y = shit*0.5;
				mm.addEventListener(MouseEvent.CLICK, endOfWaterGame);
				endWGame = true;
			}
		}
		function endOfWaterGame(e:Event) {
			var tar:MovieClip = MovieClip(e.target);
			tar.removeEventListener(MouseEvent.CLICK, endOfWaterGame);
			removeChild(tar);
			parnt.endGames();
			parnt.parnt.addIntroWindow(8);
		}
		function createMessage(num:int) {
			if(num==1) msg = new success_money();
			if(num==2) msg = new success_info();
			if(num==3) msg = new success_skill();
			if(num==4) msg = new level_success();
			if(num==5) msg = new level_fail();
			addChild(msg);
			msg.x = swid*0.5;
			msg.y = shit*0.5;
			var bt2:MovieClip = new nobtn();
			var bt3:MovieClip = new yesbtn();
			bt2.x = swid * (-0.1);
			bt3.x = swid * 0.1;
			bt2.y = bt3.y = shit * 0.2;
			bt3.name = "next";
			bt2.name = "clos";
			TweenLite.from(msg, 0.5, {alpha:0, scaleX:0, scaleY:0});
			if(num==1 || num==3 || num==5) msg.addChild(bt2);
			else bt3.x = 0;
			if(num!=5) {msg.addChild(bt3);}
			if(num==5) {bt2.addEventListener(MouseEvent.CLICK, removeFailMessage);bt2.x = 0*swid}
			else bt2.addEventListener(MouseEvent.CLICK, removeCompMessage);
			bt3.addEventListener(MouseEvent.CLICK, removeMessage);
		}
		function removeFailMessage(e:Event) {
			removeChild(msg);
			parnt.endGames();
			parnt.parnt.addIntroWindow(8);
		}
		function removeMessage(e:Event=null) {
			removeChild(msg);
			parnt.pause = false;
			parnt.startGamesWithLevel();
		}
		function removeCompMessage(e:Event=null) {
			removeChild(msg);
			parnt.pause = false;
			parnt.game.char.myplay();
		}
	}
	
}
