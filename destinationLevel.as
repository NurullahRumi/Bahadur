package  {
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.getDefinitionByName;
	import com.greensock.TweenMax;
	import com.greensock.TimelineLite;
	
	public class destinationLevel extends MovieClip {
		var parnt:MovieClip;
		var swid:Number;
		var shit:Number;
		var score:int = 0;
		var target:int = 0;
		var succ:Array = ["d_drive", "d_cons", "d_nurs"];
		var fail:Array = ["d_jail", "d_gjail"];
		var scoreTime:Timer = new Timer(500);
		var sund:sound_controll = new sound_controll("1");

		public function destinationLevel(par:MovieClip) {
			// constructor code
			parnt = par;
			swid = par.swid;
			shit = par.shit;
			parnt.g_var.saveCurrentLevel(0);
			score = parnt.g_var.loadCurentScore();
			var cun:String = parnt.g_var.retrundVal('cun');
			target = parnt.g_var.getGameTargetValue(cun);
			scoreTime.addEventListener(TimerEvent.TIMER, setTargetAndScore);
			scoreTime.start();	
			comn_backgroud_add();
			var typ:String = parnt.g_var.loadCurrentChoise();
			//typ = "happy";
			parnt.g_var.saveCurrentLevel(3);
			if(typ=="sad") addFailurImage();
			else addDestination_image();
		}
		function setTargetAndScore(e:TimerEvent):void{
			parnt.scr_txt.text = ""+ score;
			parnt.tar_txt.text = ""+target;
		}
		function comn_backgroud_add()
		{
			var comn_back:comn_back_mc = new comn_back_mc();
			addChild(comn_back);
			comn_back.x = swid*0.5;
			comn_back.y = shit*0.5;
			comn_back.scaleX = comn_back.scaleY = 1.2*swid/comn_back.width;
		}
		function addDestination_image() {
			var holder:MovieClip = new MovieClip();
			addChild(holder);
			var cun:String = "d_"+parnt.g_var.retrundVal('cun');
			var gen:String = parnt.g_var.retrundVal('gen');
			var back:d_back = new d_back();
			holder.addChild(back);
			var msg:Class = getDefinitionByName(cun) as Class;
			var ins:MovieClip = new msg();
			var mper:MovieClip;
			if(gen=="M") mper = new d_boy();
			else mper = new d_girl();
			mper.x = back.x = ins.x = swid*0.5;
			mper.y = back.y = ins.y = shit*0.5;
			holder.addChild(ins);
			holder.addChild(mper);
			var txt:ds_text = new ds_text();
			holder.addChild(txt);
			txt.x = swid*0.3;
			txt.y = shit*0.12;
			TweenMax.to(holder, 1, {delay:2.5, blurFilter:{blurX:40, blurY:40}, onComplete:creditPage});
			//ani.to(holder, 1, {delay:2.5, blurFilter:{blurX:20, blurY:20}});
		}
		function creditPage() {
			var crt:crdt = new crdt();
			var log:iom_logo = new iom_logo();
			var nam:iom_name = new iom_name();
			addChild(crt);
			addChild(log);
			addChild(nam);
			crt.x = log.x = nam.x = 0.5*swid;
			crt.y = 0.2*shit;
			log.y = 0.5*shit;
			nam.y = 0.8*shit;
			var ani:TimelineLite = new TimelineLite();
			ani.from(crt, 0.5, {alpha:0});
			ani.from(log, 0.5, {alpha:0});
			ani.from(nam, 0.5, {alpha:0});
		}
		function addFailurImage() {
			var num:int = 1;
			var gen:String = parnt.g_var.retrundVal('gen');
			if(gen=='M') num = 0;
			var msg:Class = getDefinitionByName(fail[num]) as Class;
			var ins:MovieClip = new msg();
			ins.x = swid*0.5;
			ins.y = shit*0.5;
			ins.scaleX = ins.scaleY = 1.1*swid/ins.width;
			addChild(ins)			
		}
		public function removeAllChild() {
			sund.pause();
			while (this.numChildren > 0) 
				removeChildAt(0);
		}

	}
	
}
