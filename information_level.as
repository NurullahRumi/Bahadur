package  {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import com.greensock.TimelineLite;
	import com.greensock.easing.*;
	
	public class information_level extends MovieClip {
		var parnt:MovieClip;
		var swid:Number;
		var shit:Number;
		var bmet:bmet_mc;
		var demo:demo_mc;
		var ngo:ngo_mc;
		var uic:uic_mc;
		var space:Number = 50;
		var score:int = 0;
		var target:int = 0;
		var chek:int = 0;
		var chkEnb:Boolean = true;
		var messOn:Boolean = false;
		
		var end:MovieClip;
		var menu:MovieClip = new MovieClip();
		var bmetInfo:MovieClip = new MovieClip();
		var demoInfo:MovieClip = new MovieClip();
		var ngoInfo:MovieClip = new MovieClip();
		var uicInfo:MovieClip = new MovieClip();
		var quesn_mc:MovieClip = new MovieClip();
		//var back_btn: info_backbtn = new info_backbtn();			
		var btn_rgt:yesbtn = new yesbtn();
		var btn_wrng:nobtn = new nobtn();
		var sund:sound_controll = new sound_controll("1");
		var scoreTime:Timer = new Timer(500);
		var hus_posi:Array = new Array();
		var cunter:int = 0;
		var anim:TimelineLite = new TimelineLite();
		var game:MovieClip = new MovieClip();
		var msga:TimelineLite = new TimelineLite();
		var helpHold:MovieClip;

		public function information_level(par:MovieClip) {
			// constructor code
			parnt = par;
			swid = par.swid;
			shit = par.shit;
			parnt.g_var.saveCurrentLevel(1);
			score = parnt.g_var.loadCurentScore();
			var cun:String = parnt.g_var.retrundVal('cun');
			target = parnt.g_var.getGameTargetValue(cun);
			parnt.tar_txt.text = ""+target;
			hus_posi["bmet"] = [0.25, 0.25];
			hus_posi["demo"] = [0.75, 0.25];
			hus_posi["ngo"] = [0.25, 0.75];
			hus_posi["uic"] = [0.75, 0.75];
			
			comn_backgroud_add();
			addChild(menu);
			addChild(bmetInfo);
			addChild(demoInfo);
			addChild(ngoInfo);
			addChild(uicInfo);
			addChild(quesn_mc);
			moveAllInfos();
			createMenu();
			checkConditions();
			scoreTime.addEventListener(TimerEvent.TIMER, setTargetAndScore);
			scoreTime.start();			
			addEventListener(Event.ENTER_FRAME, moveDirectChar);
			parnt.pause = false;
			addChild(game);
			helpHold = new MovieClip();
			addChild(helpHold);
			var btn_strt_game:button_game_start = new button_game_start();
			helpHold.addChild(btn_strt_game);
			btn_strt_game.x = swid * 0.5;
			btn_strt_game.y = shit * 0.85;
			btn_strt_game.addEventListener(MouseEvent.CLICK, function() {removeChild(helpHold)});
			var help0:messHelp2 = new messHelp2();
			helpHold.addChild(help0);
			help0.x = swid*0.5;
			help0.y = shit*0.5;
			msga.from(help0, 0.5, {delay:1.0, alpha:0});
			msga.from(btn_strt_game, 0.25, {alpha:0});
			msga.to(help0, 2.5, {alpha:1});
			msga.to(help0, 0.25, {alpha:0, onComplete:helpHold.removeChild, onCompleteParams:[help0]});
			help0.addEventListener(MouseEvent.CLICK, function() {removeChild(helpHold)});
			var help:messHelp1 = new messHelp1();
			helpHold.addChild(help);
			help.x = swid*0.5;
			help.y = shit*0.5;
			msga.from(help, 0.5, {alpha:0});
			msga.to(help, 2.5, {alpha:1, onComplete:addEvents});
			//msga.to(help, 0.25, {alpha:0, onComplete:this.removeChild, onCompleteParams:[helpHold]*/});
			help.addEventListener(MouseEvent.CLICK, function() {removeChild(helpHold)});
			//help.addEventListener(MouseEvent.CLICK, removeMessage);
		}
		function removeMessage(e:Event=null) {
			var obj:MovieClip = MovieClip(e.target);
			obj.removeEventListener(MouseEvent.CLICK, removeMessage);
			msga.kill();
			removeChild(obj);
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
				trace("Hello world");
				//createCostForTheLevel();
			}
		}
		function comn_backgroud_add()
		{
			var comn_back:comn_back_mc = new comn_back_mc();
			addChild(comn_back);
			comn_back.x = swid*0.5;
			comn_back.y = shit*0.5;
			comn_back.scaleX = comn_back.scaleY = 1.2*swid/comn_back.width;
			//var an:TimelineLite = new TimelineLite();
			//an.from(comn_back, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
		}
		var capt:String = "bmet";
		function createQuestion(e:Event=null)
		{
			removeEachItem();
			if(e!=null) {
				var obj:MovieClip = MovieClip(e.target);
				menu.removeChild(obj);
			}
			sund.stopAudCnlOnBack();
			var an:TimelineLite = new TimelineLite();
			if(capt=="bmet") {
				var ques1:info_level_ques1 = new info_level_ques1();
				ques1.x = swid*0.5;
				ques1.y = shit*0.5;//bmet.y+bmet.height/2+ques1.height/2+space;//
				btn_rgt.name = "yes";
				btn_wrng.name = "no";
				bmetInfo.addChild(ques1);
				bmetInfo.addChild(btn_rgt);
				bmetInfo.addChild(btn_wrng);
				an.from(ques1, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
				bmet.removeEventListener(MouseEvent.CLICK, getBmetInfo);
			}
			
			if(capt=="demo") {
				var ques2:info_level_ques2 = new info_level_ques2();
				btn_rgt.name = "yes";
				btn_wrng.name = "no";
				demoInfo.addChild(ques2);
				demoInfo.addChild(btn_rgt);
				demoInfo.addChild(btn_wrng);
				ques2.x = swid*0.5;
				ques2.y = shit*0.5;//demo.y+demo.height/2+ques2.height/2+space;
				an.from(ques2, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
				demo.removeEventListener(MouseEvent.CLICK, getDemoInfo);			
			}
			
			if(capt=="ngo") {
				var ques3:info_level_ques3 = new info_level_ques3();
				btn_rgt.name = "yes";
				btn_wrng.name = "no";
				ngoInfo.addChild(ques3);
				ngoInfo.addChild(btn_rgt);
				ngoInfo.addChild(btn_wrng);
				ques3.x = swid*0.5;
				ques3.y = shit*0.5;//ngo.y+ngo.height/2+ques3.height/2+space;
				an.from(ques3, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
				ngo.removeEventListener(MouseEvent.CLICK, getNgoInfo);
			}
			
			if(capt=="uic") {
				var ques4:info_level_ques4 = new info_level_ques4();
				btn_rgt.name = "yes";
				btn_wrng.name = "no";
				uicInfo.addChild(ques4);
				uicInfo.addChild(btn_rgt);
				uicInfo.addChild(btn_wrng);
				ques4.x = swid*0.5;
				ques4.y = shit*0.5;//uic.y+uic.height/2+ques4.height/2+space;
				an.from(ques4, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
				uic.removeEventListener(MouseEvent.CLICK, getUicInfo);
			}
			
			btn_rgt.x = swid*0.6;
			btn_rgt.y = shit*0.65;			
			btn_wrng.x = swid*0.4;
			btn_wrng.y = shit*0.65;	
			an.from(btn_rgt, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
			an.from(btn_wrng, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
			//trace("quesn mc : "+quesn_mc.x+" : "+ quesn_mc.y);
			btn_rgt.addEventListener(MouseEvent.CLICK, checkAns);
			btn_wrng.addEventListener(MouseEvent.CLICK, checkAns);
		}
		var talks:fani_mal_tak;
		function createInstituInfo() {
			/*
				information show according to institution.
				here cun_info_1 is just an example. it will be changed 
				according to institution
			*/
			if(objs!=null) objs.removeAllChild();
			anim.kill();
			talks = new fani_mal_tak();
			talks.x = swid*0.7;
			talks.y = shit*0.85;
			talks.scaleX = talks.scaleY = 1.1;
			var an:TimelineLite = new TimelineLite();
			var space:Number = 30;
			if(capt=="bmet") {
				var instu_heading1: institu_heading1 = new institu_heading1();
				bmetInfo.addChild(instu_heading1);
				bmetInfo.addChild(talks);
				instu_heading1.x = swid*0.5;
				instu_heading1.y = shit*0.15;
				var pic1:bmet_info_1 = new bmet_info_1();
				var pic2:bmet_info_2 = new bmet_info_2();
				var pic3:bmet_info_3 = new bmet_info_3();
				var pic4:bmet_info_4 = new bmet_info_4();
				pic1.x = pic2.x = pic3.x = pic4.x = swid*0.2;
				pic1.y = pic2.y = pic3.y = pic4.y = shit*0.5;
				pic1.scaleX = pic2.scaleX = pic3.scaleX = pic4.scaleX = 0
				bmetInfo.addChild(pic1);
				bmetInfo.addChild(pic2);
				bmetInfo.addChild(pic3);
				bmetInfo.addChild(pic4);
				sund.playSpecificSound("bmet");
				an.from(instu_heading1, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
				an.to(pic1, 0.5, {scaleX:1});
				an.to(pic1, 0.5, {alpha:0}, "+=9.0");
				an.to(pic2, 0.5, {scaleX:1});
				an.to(pic2, 0.5, {alpha:0}, "+=7.0");
				an.to(pic3, 0.5, {scaleX:1});
				an.to(pic3, 0.5, {alpha:0}, "+=6.0");
				an.to(pic4, 0.3, {scaleX:1, y:shit*0.7}, "-=0.5");
				an.to(pic1, 0.3, {alpha:1, y:shit*0.4}, "-=0.5");
				an.to(pic2, 0.3, {alpha:1}, "-=0.5");
				an.to(pic3, 0.3, {alpha:1, y:shit*0.6/*, onComplete:createQuestion*/}, "-=0.5");
				//an.from(bmet, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
			}
			
			if(capt=="demo") {
				var instu_heading2: institu_heading2 = new institu_heading2();	
				demoInfo.addChild(instu_heading2);
				demoInfo.addChild(talks);
				instu_heading2.x = swid*0.5;
				instu_heading2.y = shit*0.15;
				sund.playSpecificSound("demo");
				var dpic1:demo_info_1 = new demo_info_1();
				var dpic2:demo_info_2 = new demo_info_2();
				var dpic3:demo_info_3 = new demo_info_3();
				dpic1.x = dpic2.x = dpic3.x = swid*0.2;
				dpic1.y = dpic2.y = dpic3.y = shit*0.5;
				dpic1.scaleX = dpic2.scaleX = dpic3.scaleX = 0
				demoInfo.addChild(dpic1);
				demoInfo.addChild(dpic2);
				demoInfo.addChild(dpic3);
				an.from(instu_heading2, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
				an.to(dpic1, 0.5, {scaleX:1});
				an.to(dpic1, 0.5, {alpha:0}, "+=9.0");
				an.to(dpic2, 0.5, {scaleX:1});
				an.to(dpic2, 0.5, {alpha:0}, "+=6.5");
				an.to(dpic3, 0.5, {scaleX:1});
				an.to(dpic3, 0.5, {alpha:0}, "+=4.0");
				an.to(dpic1, 0.3, {alpha:1, y:shit*0.4}, "-=0.5");
				an.to(dpic2, 0.3, {alpha:1}, "-=0.5");
				an.to(dpic3, 0.3, {alpha:1, y:shit*0.6/*, onComplete:createQuestion*/}, "-=0.5");
				//an.from(demo, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
			}
			
			if(capt=="ngo") {
				var instu_heading3: institu_heading3 = new institu_heading3();
				ngoInfo.addChild(instu_heading3);
				ngoInfo.addChild(talks);
				instu_heading3.x = swid*0.5;
				instu_heading3.y = shit*0.15;
				sund.playSpecificSound("ngo");
				var npic1:ngo_info_1 = new ngo_info_1();
				var npic2:ngo_info_2 = new ngo_info_2();
				var npic3:ngo_info_3 = new ngo_info_3();
				npic1.x = npic2.x = npic3.x = swid*0.2;
				npic1.y = npic2.y = npic3.y = shit*0.5;
				npic1.scaleX = npic2.scaleX = npic3.scaleX = 0
				ngoInfo.addChild(npic1);
				ngoInfo.addChild(npic2);
				ngoInfo.addChild(npic3);
				an.from(instu_heading3, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
				an.to(npic1, 0.5, {scaleX:1});
				an.to(npic1, 0.5, {alpha:0}, "+=4.0");
				an.to(npic2, 0.5, {scaleX:1});
				an.to(npic2, 0.5, {alpha:0}, "+=5.0");
				an.to(npic3, 0.5, {scaleX:1});
				an.to(npic3, 0.5, {alpha:0}, "+=5.0");
				an.to(npic1, 0.3, {alpha:1, y:shit*0.4}, "-=0.5");
				an.to(npic2, 0.3, {alpha:1}, "-=0.5");
				an.to(npic3, 0.3, {alpha:1, y:shit*0.6/*, onComplete:createQuestion*/}, "-=0.5");
			}
			
			if(capt=="uic") {
				var instu_heading4: institu_heading4 = new institu_heading4();
				uicInfo.addChild(instu_heading4);
				uicInfo.addChild(talks);
				instu_heading4.x = swid*0.5;
				instu_heading4.y = shit*0.15;
				sund.playSpecificSound("uic");
				var upic1:uic_info_1 = new uic_info_1();
				var upic2:uic_info_2 = new uic_info_2();
				upic1.x = upic2.x = swid*0.2;
				upic1.y = upic2.y = shit*0.5;
				upic1.scaleX = upic2.scaleX = 0
				uicInfo.addChild(upic1);
				uicInfo.addChild(upic2);
				an.from(instu_heading4, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
				an.to(upic1, 0.5, {scaleX:1});
				an.to(upic1, 0.5, {alpha:0}, "+=5.0");
				an.to(upic2, 0.5, {scaleX:1});
				an.to(upic2, 0.5, {alpha:0}, "+=3.0");
				an.to(upic1, 0.3, {alpha:1, y:shit*0.4}, "-=0.5");
				an.to(upic2, 0.3, {alpha:1/*, onComplete:createQuestion*/}, "-=0.5");
			}
			talks.addFrameScript(talks.totalFrames - 1, function():void 
			{
				if(!sund.snd_ip) talks.stop();
			});
			institu_btn_list();
		}
		function removeEachItem() {
			anim.kill();
			while(bmetInfo.numChildren>0)
				bmetInfo.removeChildAt(0);
			while(demoInfo.numChildren>0)
				demoInfo.removeChildAt(0);
			while(ngoInfo.numChildren>0)
				ngoInfo.removeChildAt(0);
			while(uicInfo.numChildren>0)
				uicInfo.removeChildAt(0);
		}
		var objs:MovieClip;
		function back_to_createMenu(e:MouseEvent=null)
		{
			anim.kill();
			moveAllInfos();
			removeEachItem();
			menu.x = 0;
			if(end!=null) { removeChild(end); end = null; }
			if(chek>=4 && chkEnb) {
				parnt.createOneTimeMessage(2);
				chkEnb = false;
				parnt.g_var.setLevelTargetValue(1, 'yes');
				parnt.g_var.saveCurrentLevel(2);
			}
			else if(cunter>=4 && chek<4) {
				parnt.createOneTimeMessage(5);
			}
			sund.stopAudCnlOnBack();
			if(cunter%2==1) {
				sund.mute_vo_sund();
				var dal:dalal = new dalal();  
				objs = new objdalal(this, dal);
				game.addChild(objs);
				game.setChildIndex(objs, 0);
			}
			/*if(snd_ip) {
				audCnl.stop();
				audCnl.removeEventListener(Event.SOUND_COMPLETE, handleSoundComplete);
				audCnl = null;
				snd_ip = false;
			}*/
			//back_btn.y = -shit*0.1;
		}
		public function resetvoiceVolume() {
			sund.unmute_vo_sund();
		}
		function removeSounds() {
			sund.stopAudCnlOnBack();
		}
		function institu_btn_list()
		{			
			var btn_back:button_back = new button_back();
			menu.addChild(btn_back);
			btn_back.x = swid*1.1;
			btn_back.y = shit*0.9;/*btn_uic.y+btn_uic.height;*/
			
			var next_q:button_game_start = new button_game_start();
			menu.addChild(next_q);
			next_q.x = swid*1.5;
			next_q.y = shit*0.8;
			btn_back.addEventListener(MouseEvent.CLICK, back_to_createMenu);
			next_q.addEventListener(MouseEvent.CLICK, createQuestion);
		}
		/*
			createMenu() is creating all the institution
			list where user will select icon as he wishes
		*/
		function createMenu() {
			/*
			 "intro_text" introductory text here for the institution list 
			*/
			/*
			institution list here
			*/
			bmet = new bmet_mc();
			bmet.x = swid*0.25;//swid*0.5;
			bmet.y = shit*0.25;
			//bmet.width = 512;
			menu.addChild(bmet);
			
			demo = new demo_mc();
			demo.x = swid*0.75;//swid*0.875;
			demo.y = shit*0.25;
			//demo.width = 256;
			menu.addChild(demo);
			
			ngo = new ngo_mc();
			ngo.x = swid*0.25;
			ngo.y = shit*0.75;
			//ngo.width = 256;
			menu.addChild(ngo);
			
			uic = new uic_mc();
			uic.x = swid*0.75;
			uic.y = shit*0.75;
			//uic.width = 512;
			menu.addChild(uic);
			var gen:String = parnt.g_var.retrundVal('gen');
			var car:MovieClip
			if(gen=='M') car = new fani_mal_ani();
			else car = new fani_fml_ani();
			car.x = swid*0.5;
			car.y = shit*0.5;
			menu.addChild(car);
			bmet.scaleX = bmet.scaleY = demo.scaleX = demo.scaleY = ngo.scaleX = ngo.scaleY = uic.scaleX = uic.scaleY = 0;
			var an:TimelineLite = new TimelineLite({repeat:6});
			an.to(bmet, 0.5, {scaleX:0.8, scaleY:0.8, ease: Elastic.easeOut.config(1, 0.75)});
			an.to(demo, 0.5, {scaleX:0.8, scaleY:0.8, ease: Elastic.easeOut.config(1, 0.75)});
			an.to(ngo, 0.5, {scaleX:0.8, scaleY:0.8, ease: Elastic.easeOut.config(1, 0.75)});
			an.to(uic, 0.5, {scaleX:0.8, scaleY:0.8, ease: Elastic.easeOut.config(1, 0.75)});
			an.to(bmet, 0.25, {scaleX:1.3, scaleY:1.3}, "-=0.2");
			an.to(bmet, 0.5, {scaleX:1.0, scaleY:1.0});
			an.to(demo, 0.25, {scaleX:1.3, scaleY:1.3}, "-=0.2");
			an.to(demo, 0.5, {scaleX:1.0, scaleY:1.0});
			an.to(ngo, 0.25, {scaleX:1.3, scaleY:1.3}, "-=0.2");
			an.to(ngo, 0.5, {scaleX:1.0, scaleY:1.0});
			an.to(uic, 0.25, {scaleX:1.3, scaleY:1.3}, "-=0.2");
			an.to(uic, 0.5, {scaleX:1.0, scaleY:1.0});
		}
		function addEvents() {
			bmet.addEventListener(MouseEvent.CLICK, getBmetInfo);
			demo.addEventListener(MouseEvent.CLICK, getDemoInfo);
			ngo.addEventListener(MouseEvent.CLICK, getNgoInfo);
			uic.addEventListener(MouseEvent.CLICK, getUicInfo);
		}
		
		function moveAllInfos() {
			anim.kill();
			bmetInfo.y = swid;
			demoInfo.y = swid;
			ngoInfo.y = swid;
			uicInfo.y = swid;
			quesn_mc.y = swid;
		}
		
		function getBmetInfo(e:Event)
		{
			var an:TimelineLite = new TimelineLite({repeat:6});
			an.to(bmet, 0.5, {scaleX:1.3, scaleY:1.3, ease: Elastic.easeOut.config(1, 0.75)});
			an.to(bmet, 0.5, {scaleX:1.0, scaleY:1.0, ease: Elastic.easeOut.config(1, 0.75), onComplete:changeBmetInfo});
			//trace("bmet text info & question mc : "+quesn_mc.y);
		}
		function changeBmetInfo() {
			moveAllInfos();
			bmetInfo.y = 0;
			quesn_mc.y = 0;
			menu.x = -swid;
			capt = "bmet";	
			createInstituInfo();			
		}
		function getDemoInfo(e:Event) {
			var an:TimelineLite = new TimelineLite({repeat:6});
			an.to(demo, 0.5, {scaleX:1.3, scaleY:1.3, ease: Elastic.easeOut.config(1, 0.75)});
			an.to(demo, 0.5, {scaleX:1.0, scaleY:1.0, ease: Elastic.easeOut.config(1, 0.75), onComplete:changeDemoInfo});
		}
		function changeDemoInfo() {			
			moveAllInfos();
			demoInfo.y = 0;
			menu.x = -swid;
			quesn_mc.y = 0;
			capt = "demo";
			createInstituInfo();
		}
		function getNgoInfo(e:Event)
		{
			var an:TimelineLite = new TimelineLite({repeat:6});
			an.to(ngo, 0.5, {scaleX:1.3, scaleY:1.3, ease: Elastic.easeOut.config(1, 0.75)});
			an.to(ngo, 0.5, {scaleX:1.0, scaleY:1.0, ease: Elastic.easeOut.config(1, 0.75), onComplete:changeNgoInfo});
		}
		function changeNgoInfo() {			
			moveAllInfos();
			ngoInfo.y = 0;
			quesn_mc.y = 0;
			menu.x = -swid;
			capt = "ngo";
			createInstituInfo();
		}
		function getUicInfo(e:Event)
		{
			var an:TimelineLite = new TimelineLite({repeat:6});
			an.to(uic, 0.5, {scaleX:1.3, scaleY:1.3, ease: Elastic.easeOut.config(1, 0.75)});
			an.to(uic, 0.5, {scaleX:1.0, scaleY:1.0, ease: Elastic.easeOut.config(1, 0.75), onComplete:changeUicInfo});
		}
		function changeUicInfo() {			
			moveAllInfos();
			uicInfo.y = 0;
			quesn_mc.y = 0;
			menu.x = -swid;
			capt = "uic";
			createInstituInfo();
		}
		function manageScore(scr:int) {
			score += scr;
			parnt.scr_txt.text = "" + score;
			parnt.g_var.saveCurentScore(score);
		}
		function checkAns(e:Event)
		{
			moveAllInfos();
			//menu.x = -swid;				
			var don:MovieClip;
			if(e.target.name == "yes")
			{
				don = new done();
				menu.addChild(don);
				don.x = swid*hus_posi[capt][0];
				don.y = shit*hus_posi[capt][1]-50;
				manageScore(1000);
				end = new right();
				addChild(end);
				end.x = 0.5 * swid;
				end.y = 0.5 * shit;
				chek++;
			}
			if(e.target.name == "no")
			{
				don = new failed();
				menu.addChild(don);
				don.x = swid*hus_posi[capt][0];
				don.y = shit*hus_posi[capt][1]-50;
				manageScore(-1000);		
				end = new wrong();
				addChild(end);
				end.x = 0.5 * swid;
				end.y = 0.5 * shit;
			}
			cunter++;
			//TweenLite.from(end, 0.75, {scaleX:0, scaleY:0});
			//TweenLite.to(end, 0.1, {delay:1.5, onComplete:removeButton});
			var an:TimelineLite = new TimelineLite();
			an.from(end, 0.75, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
			an.from(end, 0.5, {delay:0.5, onComplete:removeButton});
			//end.addEventListener(MouseEvent.CLICK, removeButton);
		}
		function removeButton(e:Event=null) {
			//var obj:MovieClip = MovieClip(e.target);
			//removeChild(obj);
			anim.kill();
			back_to_createMenu();
		}

		function moveDirectChar(e:Event) {
			anim.kill();
			if (parnt.pause) {
				sund.pause();
			}
			else {
				sund.resume();
			}
		}
		public function removeAllChild() {
			anim.kill();
			msga.kill();
			sund.pause();
			if(objs!=null) objs.removeAllChild();
			while (this.numChildren > 0) 
				removeChildAt(0);
		}
	}
	
}
