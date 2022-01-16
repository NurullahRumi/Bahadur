package  {
	
	import flash.display.MovieClip;
	import com.greensock.*; 
	import com.greensock.easing.*;
	import com.greensock.TweenMax;
	import com.greensock.TimelineLite;
	import flash.utils.getDefinitionByName;
	
	
	public class migrationPreparation extends MovieClip {
		var parnt:gameFile;
		var sund:sound_controll = new sound_controll();
		var swid:Number;
		var shit:Number;		
		var gretting_mc_:gretting_mc = new gretting_mc();
		var cun_mc_:cun_mc = new cun_mc();
		var mc_1:mc1 = new mc1();
		var mc_2:mc2 = new mc2();
		var mc_3:mc3 = new mc3();
		var mc_4:mc4 = new mc4();
		var mc_5:mc5 = new mc5();
		var mc_6:mc6 = new mc6();
		var mother_mc:MovieClip = new MovieClip();
		var sw:Number;
		var sh:Number;
		var tl = new TimelineLite();
		
		public function migrationPreparation(par:gameFile) {
			// constructor code
			// constructor code
			parnt = par;
			swid = par.swid;
			shit = par.shit;
			parnt.g_var.saveCurrentLevel(0);
			addChild(mother_mc);
			start_tween();
			sund.playSpecificSound("migr");
		}
		function start_tween()
		{
			comn_backgroud_add()
			gretting_msg();
		}
		function comn_backgroud_add()
		{
			var comn_back: comn_back_mc = new comn_back_mc();
			addChild(comn_back);
			comn_back.x = swid * 0.5;
			comn_back.y = shit * 0.5;
			comn_back.scaleX = swid/comn_back.width;
			comn_back.scaleY = shit/comn_back.height;
			setChildIndex(comn_back, 0);
			comn_back.scaleX = comn_back.scaleY = 1.2*swid/comn_back.width;
			//planeFlying();
			//trace(Capabilities.screenResolutionX);
			//trace("screen " + stage.fullScreenHeight);
		}
		function gretting_msg()
		{
			var cun:String = parnt.g_var.retrundVal('cun');
            var type:Class = getDefinitionByName(cun) as Class;
            var inst:MovieClip = new type();
			inst.scaleX = inst.scaleY = 0.8;
			inst.y = -10;
			cun_mc_.x = gretting_mc_.x = swid/2;
			cun_mc_.y = gretting_mc_.y = shit/2;
			mother_mc.addChild(gretting_mc_);
			mother_mc.addChild(cun_mc_);
			cun_mc_.addChild(inst);
			mother_mc.addChild(mc_1);
			mother_mc.addChild(mc_2);
			mother_mc.addChild(mc_3);
			mother_mc.addChild(mc_4);
			mother_mc.addChild(mc_5);
			mother_mc.addChild(mc_6);
			gretting_mc_.scaleX = gretting_mc_.scaleY = mc_1.scaleX = mc_1.scaleY = mc_2.scaleX = mc_2.scaleY = mc_3.scaleX = mc_3.scaleY = mc_4.scaleX = mc_4.scaleY = mc_5.scaleX = mc_5.scaleY = mc_6.scaleY = cun_mc_.scaleX = cun_mc_.scaleY = 0;
			tl.to(gretting_mc_, .5, {delay: 1, scaleX:1, scaleY:1, ease: Back.easeOut.config(0.7) /*ease:Elastic.easeOut,onComplete:grettingsMove*/});
			tl.to(gretting_mc_, .5, {delay:2.0, scaleX:0.75, scaleY:0.75, x:gretting_mc_.width*.5+210, y:gretting_mc_.height*.5+70},"+=3.5");	
			tl.to(cun_mc_, .5, {scaleX:1, scaleY:1, ease: Back.easeOut.config(4.7)});
			tl.to(cun_mc_, .01, {scaleX:1, scaleY:1,onComplete:linetest, onCompleteParams:[-50, -30, -200, -30, mc_1, 0, 0]});
			tl.to(cun_mc_, .01, {scaleX:1, scaleY:1,onComplete:linetest, onCompleteParams:[-200, -30, -200, -140, mc_1, 0, 0]});
			tl.to(cun_mc_, .01, {scaleX:1, scaleY:1,onComplete:linetest, onCompleteParams:[-200, -140, -300, -140, mc_1, 1, 0]});
			tl.to(cun_mc_, .01, {scaleX:1, scaleY:1,onComplete:linetest, onCompleteParams:[20, 50, 20, 220, mc_2, 0, 0]});
			tl.to(cun_mc_, .01, {scaleX:1, scaleY:1,onComplete:linetest, onCompleteParams:[20, 220, 100, 220, mc_2, 1, 0]});
			tl.to(cun_mc_, .01, {scaleX:1, scaleY:1,onComplete:linetest, onCompleteParams:[-20, -50, -20, -180, mc_3, 0, 0]});
			tl.to(cun_mc_, .01, {scaleX:1, scaleY:1,onComplete:linetest, onCompleteParams:[-20, -180, 10, -180, mc_3, 1, 0]});
			tl.to(cun_mc_, .01, {scaleX:1, scaleY:1,onComplete:linetest, onCompleteParams:[-10, 50, -10, 180, mc_4, 0, 0]});
			tl.to(cun_mc_, .01, {scaleX:1, scaleY:1,onComplete:linetest, onCompleteParams:[-10, 180, -220, 180, mc_4, 1, 0]});
			tl.to(cun_mc_, .01, {scaleX:1, scaleY:1,onComplete:linetest, onCompleteParams:[-50, 10, -250, 10, mc_5, 1, 0]});
			//tl.to(cun_mc_, .01, {scaleX:1, scaleY:1,onComplete:linetest, onCompleteParams:[-50, 10, -150, 10, mc_5, 0, 1]});
			tl.to(cun_mc_, .01, {scaleX:1, scaleY:1,onComplete:linetest, onCompleteParams:[50, 20, 80, 20, mc_6, 0, 0]});
			tl.to(cun_mc_, .01, {scaleX:1, scaleY:1,onComplete:linetest, onCompleteParams:[80, 20, 80, -140, mc_6, 0, 0]});
			tl.to(cun_mc_, .01, {scaleX:1, scaleY:1,onComplete:linetest, onCompleteParams:[80, -140, 240, -140, mc_6, 0, 0]});
			tl.to(cun_mc_, .01, {scaleX:1, scaleY:1,onComplete:linetest, onCompleteParams:[240, -140, 240, -80, mc_6, 1, 0]});			
			
			tl.to(cun_mc_, .01, {scaleX:1, scaleY:1,onComplete:linetest, onCompleteParams:[240, -140, 240, -80, mc_6, 1, 1]});
			//tl.to(cun_mc_, .01, {delay: 8, scaleX:1, scaleY:1,onComplete:goToNextLevel});			
			//tl.to(cun_mc_, .5, {scaleX:1, scaleY:1,onComplete:linetest, onCompleteParams:[100, 10, 10, 10]});
		}
		function goToNextLevel() {
			parnt.g_var.saveCurrentChoise("suc")
			parnt.g_var.saveCurrentLevel(6);
			removeAllChild();
			parnt.addDestinationWindow();
		}
		
		function linetest(px:int, py:int, tx:int, ty:int, mov:MovieClip, del:Number, don:int)
		{
			var dis:Number;
			if(px<tx) dis = tx-px;
			if(px>tx) dis = px-tx;
			if(py<ty) dis = ty-py;
			if(py>ty) dis = py-ty;
			var lin:MovieClip;
			
			if(px<tx) lin = new liner();
			if(px>tx) lin = new linel();
			if(py<ty) lin = new lined();
			if(py>ty) lin = new lineu();
			mother_mc.addChild(lin);
			lin.x = swid/2+px;
			lin.y = shit/2+py;
			lin.scaleX = lin.scaleY = 0;
			tl.to(lin, .01, {scaleY:1, scaleX:1});
			if(py!=ty) tl.to(lin, .25, {scaleY:dis});
			if(px!=tx) tl.to(lin, .25, {scaleX:dis});
			mov.x = swid*0.5+tx;
			mov.y = shit*0.5+ty;
			if(del!=0) tl.to(mov, .25, {scaleX:1, scaleY:1});
			if(don!=0) tl.to(mov, .25, { delay: 15, scaleX:1, scaleY:1,onComplete:planeFlying});
		}
		public function planeFlying() {
			var comn_back: comn_back_mc = new comn_back_mc();
			addChild(comn_back);
			comn_back.x = swid * 0.5;
			comn_back.y = shit * 0.5;
			comn_back.scaleX = comn_back.scaleY = (swid/comn_back.width)*1.2;
			comn_back.alpha = 0.75;
			TweenMax.from(comn_back, 0.5, {alpha:0});
			var pln:plane = new plane();
			pln.x = -swid*0.2;
			pln.y = shit*0.96;
			addChild(pln);
 			TweenMax.to(pln, 5, {delay:0.5, bezier:{values:[{x:-swid*0.2, y:shit*0.96},{x:swid*0.27, y:shit*0.82},{x:swid*0.725, y:shit*0.55},{x:swid*1.42, y:shit*0.1}], autoRotate:true}, scaleX:1.5, scaleY:1.5,onComplete:goToNextLevel});
			//goToNextLevel();
		}
		public function removeAllChild() {
			sund.pause();
			sund.stopAudCnlOnBack();
			tl.kill();
			while (this.numChildren > 0) 
				removeChildAt(0);
		}		
	}	
}
