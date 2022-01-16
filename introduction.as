package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.text.*;
	import flash.utils.getDefinitionByName;
	import com.greensock.TimelineLite;
	import com.greensock.easing.*;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	public class introduction extends MovieClip {
		var parnt:mainController;
		var swid:Number;
		var shit:Number;
		var a:Number = 0;
		var srt:MovieClip;
		var chrs:MovieClip;
		var inf:MovieClip;
		var edu:MovieClip;
		var cun:MovieClip;
		var cos:MovieClip;
		var man:MovieClip;
		var sto:com_back;
		var check:Boolean = false;
		var tf:TextFormat = new TextFormat();
		var g_var:global_variable = new global_variable();
		var tx_name:TextField = new TextField();
		var tx_phone:TextField = new TextField();
		var rnum:int = 0;
		var edu_nm:Array = ["edu_no", "edu_5", "edu_hs"];
		var cun_nm:Array = ["cun_hko", "cun_ita", "cun_kor", "cun_ma", "cun_omn", "cun_qtr", "cun_sau", "cun_uk", "cun_uae", "cun_bahrain", "cun_singa"];
		var no_cun:Array = ["cun_hko", "cun_ita", "cun_kor", "cun_ma", "cun_omn", "cun_qtr", "cun_sau", "cun_uk", "cun_uae", "cun_bahrain", "cun_singa"];
		var hsc_cun:Array = ["cun_hko", "cun_ita", "cun_kor", "cun_ma", "cun_omn", "cun_qtr", "cun_sau", "cun_uk", "cun_uae", "cun_bahrain", "cun_singa"];
						
		var cun_requr:Array = new Array();
		var dist_nam:Array = new Array();
		//
		
		var cun_info:Array = new Array();
		var anim:TimelineLite;
		/*story soudn variable*/
		var s_sound: Sound;
		var soundChannel: SoundChannel;
		var bk_dsgn_board: back_board = new back_board();		
		var dis_0:dist_0;
		
		var sedu:String = '';
		var scun:String = '';
		var distr:String = "dist_1";
		
		public function introduction(par:mainController) {
			cun_requr[0] = {cun_hko:"cun_req_2", cun_ita:"cun_req_2", cun_kor:"cun_req_4", cun_ma:"cun_req_3", cun_omn:"cun_req_2", cun_qtr:"cun_req_2", cun_sau:"cun_req_1", cun_uk:"cun_req_2", cun_uae:"cun_req_2", cun_bahrain:"cun_req_2", cun_singa:"cun_req_2" };
			dist_nam[0] = {dis_1:"barishal", dis_2:"chittagong", dis_3:"dhaka", dis_4:"khulna", dis_5:"mymensing", dis_6:"rajsahi", dis_7:"rungpur", dis_8:"sylet"};
			cun_info["edu_5"] = {cun_hko:"cun_info_5", cun_ita:"cun_info_3", cun_uk:"cun_info_3", cun_kor:"cun_info_4", cun_ma:"cun_info_2", cun_omn:"cun_info_2", cun_qtr:"cun_info_2", cun_sau:"cun_info_2", cun_uae:"cun_info_2", cun_bahrain:"cun_info_2", cun_singa:"cun_info_6" };
			cun_info["edu_no"] = {cun_hko:"cun_info_5", cun_ita:"cun_info_3", cun_uk:"cun_info_3", cun_kor:"cun_info_4", cun_ma:"cun_info_2", cun_omn:"cun_info_2", cun_qtr:"cun_info_2", cun_sau:"cun_info_2", cun_uae:"cun_info_2", cun_bahrain:"cun_info_2", cun_singa:"cun_info_6" };
			cun_info["edu_hs"] = {cun_kor:"cun_info_4", cun_ma:"cun_info_1", cun_omn:"cun_info_1", cun_qtr:"cun_info_1", cun_sau:"cun_info_1", cun_uae:"cun_info_1", cun_bahrain:"cun_info_1", cun_singa:"cun_info_6", cun_uk:"cun_info_3", cun_ita:"cun_info_3", cun_hko:"cun_info_5" };

			//g_var.saveCurrentLevel(5);
			// constructor code
			parnt = par;
			tf.size = 36;			
			tf.align = TextFormatAlign.CENTER;
			swid = par.sw;
			shit = par.sh;
			parnt.stage.addEventListener(MouseEvent.CLICK, moveNext);
			goNext();
			sedu = g_var.retrundVal('edu');
			scun = g_var.retrundVal('cun');
		}
		function checkForNextStep() {
			if (check && rnum==0) {
				//trace(a+ " its here "+g_var.retrundVal('nam'));
				if (g_var.retrundVal('nam') != null) goNext();
				if (g_var.retrundVal('phn') != null) goNext();
				if (g_var.retrundVal('gen') != null) goNext();
				if (g_var.retrundVal('edu') != null) goNext();
				if (g_var.retrundVal('cun') != null) goNext();
				rnum++;
			}
		}
		function removeall() {
			if (srt != null) {removeChild(srt); srt = null; }
			if (chrs!= null) {removeChild(chrs);chrs = null;}
			if (inf != null) {removeChild(inf); inf = null; }
			if (sto != null) {removeChild(sto); sto = null; }
			if (edu != null) {removeChild(edu); edu = null; }
			if (cun != null) {removeChild(cun); cun = null; }
			if (cos != null) {removeChild(cos); cos = null; }
			if (man != null) {removeChild(man); man = null; }
		}
		function moveNext(e:Event=null) {
			anim.kill();
			bk_dsgn_board.alpha = 1;
			if (a == 0) a = 1;
			if (soundChannel != null) soundChannel.stop();
			goNext();
		}
		function goNext() {
			switch(a) {
				case 0:
					startOfTheGame();
					break;
				case 1: 
					removeall();
					comn_backgroud_add()
					storyTelling();
					break;
				case 2: 
					removeall();
					parnt.stage.addEventListener(MouseEvent.CLICK, moveNext);
					if (check)
					if (g_var.retrundVal('gen') != null) { a++;goNext(); break;}
					chrs = new MovieClip();
					addChild(chrs);
					//addBack_boardImg(chrs);
					selectGender();
					break;
				case 3: 
					removeall();					
					if (check)
					if (g_var.retrundVal('phn') != null) { a++;goNext(); break;}
					inf = new MovieClip();
					addChild(inf);
					addInfoForm();
					break;
				case 4: 
					removeall();
					if (check)
					if (g_var.retrundVal('edu') != null) { a++;goNext(); break;}
					edu = new MovieClip();
					addChild(edu);
					//addBack_boardImg(edu);
					selectMovieClp(edu, 3, 0.01, edu_nm, 0);
					break;
				case 5: 
					removeall();
					if (check)
					if (g_var.retrundVal('cun') != null) { a++;goNext(); break; }
					cun = new MovieClip();
					addChild(cun);
					/*
						select_coun_mc MC is just a introduction of this page says, "which
							country whould you like to choice for migration"?
					*/
					var type:Class = getDefinitionByName(sedu) as Class;
					var inst:MovieClip = new type();
					inst.scaleX = inst.scaleY = 0.5;
					inst.x = swid*0.1;
					inst.y = shit*0.6;
					cun.addChild(inst);
					
					var select_cun:select_coun_mc = new select_coun_mc();
					select_cun.x = swid*0.5;
					select_cun.y = shit*0.05;
					cun.addChild(select_cun);
					//addBack_boardImg(cun);
					if(sedu=='edu_5')
						selectMovieClp(cun, 3, 0.1, cun_nm, 1);
					else if(sedu=='hsc_cun')
						selectMovieClp(cun, 3, 0.1, hsc_cun, 1);
					else selectMovieClp(cun, 3, 0.1, no_cun, 1);
					add_btn_back2(1);
					break;
				case 6: 
					removeall();
					cos = new MovieClip();
					addChild(cos);
					//var uinf:infoQ = new infoQ();
					//cos.addChild(uinf);
					//uinf.x = swid*0.8;
					//uinf.y = shit*0.1;
					//uinf.addEventListener(MouseEvent.CLICK, addMyInfos);
					//addBack_boardImg(cos);
					addCostInformation();
					add_btn_back2();
					//a++;
					break;
				case 7: 
					removeall();
					//parnt.addGameWindow(0);
					//g_var.saveCurrentLevel(0);
					var clev:int = g_var.loadCurrentLevel();
					addGameWindowInstant(clev);
					//a++;
					break;
				case 8: 
					removeall();
					//parnt.addGameWindow(0);
					man = new MovieClip();
					addChild(man);
					//var uinf2:infoQ = new infoQ();
					//uinf2.x = swid*0.8;
					//uinf2.y = shit*0.1;
					//uinf2.addEventListener(MouseEvent.CLICK, addMyInfos);
					add_menu_button();
					//man.addChild(uinf2);
					//a++;
					break;
				case 9: 
					removeall();
					//parnt.addGameWindow(0);
					a++;
					break;
			}
		}
		function addMyInfos() {
			trace("it will add your infos");
		}
		function add_btn_back2(typ:Number=2)
		{
			var btn_back2:button_back = new button_back();
			btn_back2.x = swid*0.1;
			btn_back2.y = shit*0.9;
			if(typ==1) cun.addChild(btn_back2);
			if(typ==2) cos.addChild(btn_back2);
			btn_back2.addEventListener(MouseEvent.CLICK, function() {a--; g_var.saveCountry(null); goNext(); });
			if(typ==2) {
				var btn_strt_game:button_game_start = new button_game_start();
				//var wat:endGame = new endGame();
				cos.addChild(btn_strt_game);
				//cos.addChild(wat);
				btn_strt_game.x = swid * 0.9;
				btn_strt_game.y = shit * 0.9;
				//wat.x = swid * 0.6;
				btn_strt_game.addEventListener(MouseEvent.CLICK, function() {a++; goNext(); });	
				anim.from(btn_strt_game, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
			}
			anim.from(btn_back2, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
		}
		function add_menu_button() {
			var levels:levels_window = new levels_window(this);
			//var wat:endGame = new endGame();
			man.addChild(levels);
			parnt.stage.removeEventListener(MouseEvent.CLICK, moveNext);
			//cos.addChild(wat);
		}
		function addGameWindowInstant(level:int) {			
			parnt.addGameWindow(level);
			parnt.stage.removeEventListener(MouseEvent.CLICK, moveNext);
			parnt.gameStartFromIntro();
		}
		function goto_country_list(e:Event)
		{
			a = 5; 
			goNext();
		}
		/*function loadInfos(level:Number) {
			return function(e:MouseEvent):void {
				parnt.addInformationWindow();
			}
		}*/
		function levelSelection(level:Number) {
			return function(e:MouseEvent):void {
				parnt.addGameWindow(level);
			}
		}
		function startGameAgain(level:int) {			
			parnt.gameEnded();
			//pause = true;
			//initiateGame(level);
		}
		function startOfTheGame() {
			addChild(bk_dsgn_board);
			bk_dsgn_board.x = swid*0.5;
			bk_dsgn_board.y = shit*0.5;
			bk_dsgn_board.scaleX = bk_dsgn_board.scaleY = 1.0*swid/bk_dsgn_board.width;
			//comn_back.scaleX = comn_back.scaleY = 1.2*swid/comn_back.width;
			
			//bk_dsgn_board.height = shit;
			bk_dsgn_board.alpha = 0;
			srt = new MovieClip();
			addChild(srt);
			var logo:iom_logo = new iom_logo();
			srt.addChild(logo);
			logo.x = swid * 0.5;
			logo.y = shit * 0.5;			
			/*var st_bak:strt_bak = new strt_bak();
			srt.addChild(st_bak);
			st_bak.alpha = 0;
			st_bak.x = 0.5 * swid;
			st_bak.y = 0.5 * shit;			*/
			
			var cmal:strt_char = new strt_char();
			srt.addChild(cmal);
			cmal.x = - 0.25 * swid;
			cmal.y = 0.99 * shit;			
			var st_name:strt_name = new strt_name();
			srt.addChild(st_name);
			st_name.x = 0.8 * swid;  
			st_name.y = -0.25 * shit;
			play_story_sound(false);
			anim = new TimelineLite({onComplete:goToIntroPart});
			anim.to(logo, 1.0, {alpha:0.0, delay:2});
			anim.to(bk_dsgn_board,0.5,{alpha:1});
			anim.to(cmal, 0.6, {x:0.15*swid});
		//	anim.to(cmal, 0.6, {alpha:0.0, delay:3});
			anim.to(st_name,0.5,{y:0.25*shit});
			anim.to(srt, 0.5, {alpha:0, delay:2});
			//a++;
		}
		public function testOne(v:Number) {
			parnt.addGameWindow(v);
		}
		function goToIntroPart() {
			//anim.reverse();
			anim.kill();
			a++;
			goNext();
		}
		function storyTelling()
		{
			parnt.stage.removeEventListener(MouseEvent.CLICK, moveNext);
			sto = new com_back();
			addChild(sto);			
			var txt_1:com_txt_1 = new com_txt_1();
			var txt_2:com_txt_2 = new com_txt_2();
			var txt_3:com_txt_3 = new com_txt_3();
			var txt_4:com_txt_4 = new com_txt_4();
			var txt_5:com_txt_5 = new com_txt_5();
			var chr_1:com_chr_1 = new com_chr_1();
			var chr_2:com_chr_2 = new com_chr_2();
			var chr_3:com_chr_3 = new com_chr_3();
			var chr_4:com_chr_4 = new com_chr_4();
			sto.addChild(txt_1);
			sto.addChild(chr_1);
			sto.addChild(txt_2);
			sto.addChild(chr_2);
			sto.addChild(txt_3);
			sto.addChild(txt_4);
			sto.addChild(chr_3);
			sto.addChild(txt_5);
			sto.addChild(chr_4);
			txt_1.alpha = txt_2.alpha = txt_3.alpha = txt_4.alpha = txt_5.alpha = chr_1.alpha = chr_2.alpha = chr_3.alpha = chr_4.alpha = 0
			sto.x = swid / 2; 
			sto.y = shit / 2;
			var an:TimelineLite = new TimelineLite();
			an.from(sto, 0.5, {alpha:0});
			an.to(chr_1, 0.5, {alpha:1}, "+=0.2");
			an.to(txt_1, 0.5, {alpha:1});
			an.to(chr_2, 0.5, {alpha:1}, "+=7.0");
			an.to(txt_2, 0.5, {alpha:1});
			an.to(txt_3, 0.5, {alpha:1}, "+=4.0");
			an.to(chr_3, 0.5, {alpha:1}, "+=6.0");
			an.to(txt_4, 0.5, {alpha:1});
			an.to(chr_4, 0.5, {alpha:1}, "+=4.0");
			an.to(txt_5, 0.5, {alpha:1});
			play_story_sound(true);
			sto.addEventListener(MouseEvent.CLICK, doneComics);
			a++;
		}
		function doneComics(e:Event) {
			var an:TimelineLite = new TimelineLite();
			an.to(sto, 0.5, {alpha:0, onComplete:moveNext});
		}
		function play_story_sound(isItPlaying:Boolean)
		{
			if(soundChannel==null) {
				s_sound = new story_sound();
				soundChannel = s_sound.play();
				soundChannel.stop();
			} 
			if(isItPlaying) soundChannel = s_sound.play();
			addEventListener(Event.ENTER_FRAME, checkSound);
			soundChannel.addEventListener(Event.SOUND_COMPLETE,testsoundcomplete);
		}
		function checkSound (e:Event)
		{
		//	trace("sound position : "+soundChannel.position +" sound length: "+s_sound.length);
			/*if()
			{
				trace("enterframe has been removed");
				removeEventListener(Event.ENTER_FRAME, checkSound);				
			}*/
		}
		function testsoundcomplete(e:Event)
		{
			//trace("sound has stoped");				
		}
		function addCostInformation() {
			parnt.stage.addEventListener(MouseEvent.CLICK, moveNext);

			var m1nam:String = cun_requr[0][scun];
			var m2nam:String = cun_info[sedu][scun];
			
			var type:Class = getDefinitionByName(scun) as Class;
			var inst1:MovieClip = new type();
			inst1.x = swid*0.1;
			inst1.y = shit*0.2;
			cos.addChild(inst1);
			type = getDefinitionByName(m1nam) as Class;
			var inst2:MovieClip = new type();
			inst2.x = swid*0.45;
			inst2.y = shit*0.30;
			cos.addChild(inst2);
			type = getDefinitionByName(m2nam) as Class;
			var inst3:MovieClip = new type();
			inst3.x = swid*0.5;
			inst3.y = shit*0.6;
			cos.addChild(inst3);
			var an:TimelineLite = new TimelineLite();
			an.from(inst3, 0.5, {alpha:0, ease: Elastic.easeOut.config(1, 0.75)}, "-=0.2");
			an.from(inst2, 0.5, {alpha:0, ease: Elastic.easeOut.config(1, 0.75)}, "-=0.2");
			an.from(inst1, 0.5, {alpha:0, ease: Elastic.easeOut.config(1, 0.75)}, "-=0.2");
			//wat.addEventListener(MouseEvent.CLICK, levelSelection(1));
		
			//if(cun=="uk") 
		}
		function selectMovieClp(lay:MovieClip, n:int, mr:Number, ary:Array, typ:int) {
			var num:int = ary.length;
			var m:int = Math.ceil(num / n);
			var i:int = 0;
			var j:int = 0;
			var xbl:Number = (1 - mr * 2) / n;
			var xbc:Number = xbl / 2;
			var ybl:Number = (1 - mr * 2) / m;
			var ybc:Number = ybl / 2;
			anim = new TimelineLite({});
			for each (var cnam:String in ary)
            {
                var type:Class = getDefinitionByName(cnam) as Class;
                var inst:MovieClip = new type();
				inst.x = (mr + xbl * i + xbc) * swid;
				inst.y = (mr + ybl * j + ybc) * shit;
				inst.name = cnam;
                lay.addChild(inst);
				if (typ == 0) inst.addEventListener(MouseEvent.CLICK,  onClick(0, cnam));
				else if (typ == 1) inst.addEventListener(MouseEvent.CLICK,  onClick(1, cnam));
				i++;
				if (i % n == 0) {j++; i = 0;}
				//inst.alpha = 0;
				anim.from(inst, 0.5, {alpha:0, scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)}, "-=0.2");
            }
		}
		function onClick(i:int, s:String):Function {
		  return function(e:MouseEvent):void {
			//trace("Received " + b + ", " + i + ", " + n + " and " + s + ".");
			if (i == 0) {g_var.saveEducation(s); sedu = s;}
			else if (i == 1) {g_var.saveCountry(s); scun = s;}
			a++;
		  };
		}
		function selectGender() {			
			parnt.stage.removeEventListener(MouseEvent.CLICK, moveNext);
			var an:TimelineLite = new TimelineLite();
			var sel:char_sele = new char_sele();
			sel.x = 0.5*swid;
			sel.y = 0.1*shit;
			chrs.addChild(sel);
			an.from(sel, 1.2, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
			var mal:pas_mal = new pas_mal();			
			mal.x = swid * 0.30;
			mal.y = shit * 0.5;
			mal.name = "M";
			chrs.addChild(mal);
			var fml:pas_fml = new pas_fml();
			fml.x = swid * 0.65;
			fml.y = shit * 0.5;
			fml.name = "F";
			chrs.addChild(fml);
			mal.scaleX = mal.scaleY = fml.scaleX = fml.scaleY = 0.75;
			an.from(mal, 1.2, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
			an.from(fml, 1.2, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.5");
			mal.addEventListener(MouseEvent.CLICK, saveGenders);
			fml.addEventListener(MouseEvent.CLICK, saveGenders);
		}
		function saveGenders(e:Event){
			var obj:MovieClip = MovieClip(e.target)
			var gn:String = obj.name;
			trace(gn);
			g_var.saveGender(gn);
			a++;
			var an:TimelineLite = new TimelineLite();
			an.to(obj, 0.5, {scaleX:1, scaleY:1});
			an.to(chrs, 0.5, {alpha:0, onComplete:moveNext});
			//sto.addEventListener(MouseEvent.CLICK, doneComics);
		}
		var usrInf:MovieClip = new MovieClip();
		var unam:String = "";
		var phon:String = "";
		var an:TimelineLite = new TimelineLite();
		function addInfoForm() {
			//addBack_boardImg(inf);
			parnt.stage.removeEventListener(MouseEvent.CLICK, moveNext);
			var name_txt:input_name_txt = new input_name_txt();
			var name_phn:input_number_txt = new input_number_txt();			
			tx_name.type = TextFieldType.INPUT; 
			tx_phone.type = TextFieldType.INPUT; 
            tx_name.background = true; 
            tx_phone.background = true;
			inf.addChild(usrInf);
			usrInf.addChild(name_txt);
			usrInf.addChild(name_phn);
            usrInf.addChild(tx_name); 
            usrInf.addChild(tx_phone); 
			tx_name.defaultTextFormat = tf;
			tx_phone.defaultTextFormat = tf;
            //myTextBox.text = "";
			tx_name.width = swid * 0.4;
			tx_name.height = 50;
			tx_name.x = swid * 0.3;
			tx_name.y = shit * 0.15;
			tx_name.border = true;
			tx_phone.width = swid * 0.4;
			tx_phone.height = 50;
			tx_phone.x = swid * 0.3;
			tx_phone.y = shit * 0.35;
			tx_phone.border = true;
			name_txt.x = swid * 0.5;
			name_txt.y = shit * 0.1;
			name_phn.x = swid * 0.5;
			name_phn.y = swid * 0.18;
			an.from(name_txt, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
			an.from(tx_name, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.25");
			an.from(name_phn, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.25");
			an.from(tx_phone, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.25");
            //myTextBox.addEventListener(TextEvent.TEXT_INPUT, textInputCapture);
			var smt:submit = new submit();
			usrInf.addChild(smt);
			smt.addEventListener(MouseEvent.CLICK, districtsList);
			an.from(smt, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.25");
			smt.x = swid * 0.5;
			smt.y = shit * 0.8;
		}		
		var map1:m_dist_1 = new m_dist_1();
		var map2:m_dist_2 = new m_dist_2();
		var map3:m_dist_3 = new m_dist_3();
		var map4:m_dist_4 = new m_dist_4();
		var map5:m_dist_5 = new m_dist_5();
		var map6:m_dist_6 = new m_dist_6();
		var map7:m_dist_7 = new m_dist_7();
		var map8:m_dist_8 = new m_dist_8();
		function districtsList(e:Event) {
			unam = tx_name.text;
			phon = tx_phone.text;
			//an.kill();			
			inf.removeChild(usrInf);
			an = new TimelineLite();
			var sel:divi_sele = new divi_sele();
			sel.x = 0.2*swid;
			sel.y = 0.075*shit;
			inf.addChild(sel);
			an.from(sel, 1.2, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
			dis_0 = new dist_0();
			var dis_1:dist_1 = new dist_1();
			var dis_2:dist_2 = new dist_2();
			var dis_3:dist_3 = new dist_3();
			var dis_4:dist_4 = new dist_4();
			var dis_5:dist_5 = new dist_5();
			var dis_6:dist_6 = new dist_6();
			var dis_7:dist_7 = new dist_7();
			var dis_8:dist_8 = new dist_8();
			inf.addChild(dis_0);
			inf.addChild(dis_1);
			inf.addChild(dis_2);
			inf.addChild(dis_3);
			inf.addChild(dis_4);
			inf.addChild(dis_5);
			inf.addChild(dis_6);
			inf.addChild(dis_7);
			inf.addChild(dis_8);
			dis_0.x = dis_1.x = dis_2.x = dis_3.x = dis_4.x = dis_5.x = dis_6.x = dis_7.x = dis_8.x = swid*0.2;
			dis_0.y = dis_1.y = 0.175*shit;
			dis_2.y = 0.275*shit;
			dis_3.y = 0.375*shit;
			dis_4.y = 0.475*shit;
			dis_5.y = 0.575*shit;
			dis_6.y = 0.675*shit;
			dis_7.y = 0.775*shit;
			dis_8.y = 0.875*shit;
			dis_0.name =  "dist_0";
			dis_1.name =  "dist_1";
			dis_2.name =  "dist_2";
			dis_3.name =  "dist_3";
			dis_4.name =  "dist_4";
			dis_5.name =  "dist_5";
			dis_6.name =  "dist_6";
			dis_7.name =  "dist_7";
			dis_8.name =  "dist_8";
			dis_1.alpha = dis_2.alpha = dis_3.alpha = dis_4.alpha = dis_5.alpha = dis_6.alpha = dis_7.alpha  = dis_8.alpha = 1;
			dis_8.alpha = 1;
			dis_0.alpha = 0.5;
			an.from(dis_1, 0.25, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
			an.from(dis_2, 0.25, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			an.from(dis_3, 0.25, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			an.from(dis_4, 0.25, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			an.from(dis_5, 0.25, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			an.from(dis_6, 0.25, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			an.from(dis_7, 0.25, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			an.from(dis_8, 0.25, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			dis_1.addEventListener(MouseEvent.CLICK, districtSelected);
			dis_2.addEventListener(MouseEvent.CLICK, districtSelected);
			dis_3.addEventListener(MouseEvent.CLICK, districtSelected);
			dis_4.addEventListener(MouseEvent.CLICK, districtSelected);
			dis_5.addEventListener(MouseEvent.CLICK, districtSelected);
			dis_6.addEventListener(MouseEvent.CLICK, districtSelected);
			dis_7.addEventListener(MouseEvent.CLICK, districtSelected);
			dis_8.addEventListener(MouseEvent.CLICK, districtSelected);
			var map:m_dist_0 = new m_dist_0();
			inf.addChild(map);
			inf.addChild(map1);
			inf.addChild(map2);
			inf.addChild(map3);
			inf.addChild(map4);
			inf.addChild(map5);
			inf.addChild(map6);
			inf.addChild(map7);
			inf.addChild(map8);
			map.x = map1.x = map2.x = map3.x = map4.x = map5.x = map6.x = map7.x = map8.x = swid*0.7;
			map.y = map1.y = map2.y = map3.y = map4.y = map5.y = map6.y = map7.y = map8.y = shit*0.5;
			map.scaleX = map.scaleY = 0;
			map1.alpha = map2.alpha = map3.alpha = map4.alpha = map5.alpha = map6.alpha = map7.alpha = map8.alpha = 0;
			an.to(map, 0.5, {scaleX:1, scaleY:1, ease: Elastic.easeOut.config(1, 0.75)},"-=0.25");
			an.to(map1, 0.25, {alpha: 1, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			an.to(map1, 0.25, {alpha: 0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			an.to(map2, 0.25, {alpha: 1, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			an.to(map2, 0.25, {alpha: 0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			an.to(map3, 0.25, {alpha: 1, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			an.to(map3, 0.25, {alpha: 0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			an.to(map4, 0.25, {alpha: 1, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			an.to(map4, 0.25, {alpha: 0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			an.to(map5, 0.25, {alpha: 1, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			an.to(map5, 0.25, {alpha: 0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			an.to(map6, 0.25, {alpha: 1, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			an.to(map6, 0.25, {alpha: 0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			an.to(map7, 0.25, {alpha: 1, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			an.to(map7, 0.25, {alpha: 0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			an.to(map8, 0.25, {alpha: 1, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			an.to(map8, 0.25, {alpha: 0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			an.to(map1, 0.25, {alpha: 1, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
			var smt:submit = new submit();
			smt.addEventListener(MouseEvent.CLICK, checkSubmition);
			inf.addChild(smt);
			an.from(smt, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.25");
			smt.x = swid * 0.5;
			smt.y = shit * 0.9;
			an.from(dis_0, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.25");
		}
		function districtSelected(e:Event) {
			an = new TimelineLite();
			var obj:MovieClip = MovieClip(e.target);
			an.to(map1, 0.5, {alpha: 0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.45");
			an.to(map2, 0.5, {alpha: 0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.45");
			an.to(map3, 0.5, {alpha: 0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.45");
			an.to(map4, 0.5, {alpha: 0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.45");
			an.to(map5, 0.5, {alpha: 0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.45");
			an.to(map6, 0.5, {alpha: 0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.45");
			an.to(map7, 0.5, {alpha: 0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.45");
			an.to(map8, 0.5, {alpha: 0, ease: Elastic.easeOut.config(1, 0.75)},"-=0.45");
			switch(obj.name) {
				case "dist_1": an.to(map1, 0.5, {alpha: 1, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
				break;
				case "dist_2": an.to(map2, 0.5, {alpha: 1, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
				break;
				case "dist_3": an.to(map3, 0.5, {alpha: 1, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
				break;
				case "dist_4": an.to(map4, 0.5, {alpha: 1, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
				break;
				case "dist_5": an.to(map5, 0.5, {alpha: 1, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
				break;
				case "dist_6": an.to(map6, 0.5, {alpha: 1, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
				break;
				case "dist_7": an.to(map7, 0.5, {alpha: 1, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
				break;
				case "dist_8": an.to(map8, 0.5, {alpha: 1, ease: Elastic.easeOut.config(1, 0.75)},"-=0.15");
				break;
			}
			distr = obj.name;
			dis_0.x = obj.x;
			dis_0.y = obj.y;
		}
		function addBack_boardImg()
		{
			
		}
		public function checkSubmition(e:Event) {
			g_var.submitUserInfo(unam, phon, distr);
			a++;
			goNext();
			parnt.stage.addEventListener(MouseEvent.CLICK, moveNext);
		}
        /*public function textInputCapture(event:TextEvent):void 
        { 
            var str:String = myTextBox.text; 
        } */
		
		
		function comn_backgroud_add()
		{
			var comn_back: comn_back_mc = new comn_back_mc();
			addChild(comn_back);
			comn_back.x = swid * 0.5;
			comn_back.y = shit * 0.5;
			comn_back.scaleX = comn_back.scaleY = 1.2*swid/comn_back.width;
			//trace(Capabilities.screenResolutionX);
			//trace("screen " + stage.fullScreenHeight);
		}
	}
}