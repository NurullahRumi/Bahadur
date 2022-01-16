package  {
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.utils.getDefinitionByName;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class userProfileInfos extends MovieClip{
		var parnt:MovieClip;
		var swid:Number;
		var shit:Number;
		var g_var:global_variable = new global_variable();
		var labls:MovieClip = new MovieClip();
		var txtar:MovieClip = new MovieClip();

		public function userProfileInfos(par:MovieClip) {
			// constructor code
			parnt = par;
			swid = par.sw;
			shit = par.sh;
			var back:prof_back_mc = new prof_back_mc();
			addChild(back);
			back.scaleX = back.scaleY = 1.1*swid/back.width;
			back.x = swid * 0.5;
			back.y = shit * 0.5;
			addChild(labls);
			addChild(txtar);
			//addTExtLabels()
			addTextAreas();
		}
		function addTextAreas() {
			var tf:TextFormat = new TextFormat();
			tf.size = 35;
			var tfn:TextFormat = new TextFormat();
			tfn.size = 40;
			var tnam:TextField = new TextField();
			var tcur:TextField = new TextField();
			var trec:TextField = new TextField();
			tnam.defaultTextFormat = tfn;
			tcur.defaultTextFormat = tf;
			trec.defaultTextFormat = tf;
			tnam.width = 400;
			tcur.width = 150;
			trec.width = 150;
			txtar.addChild(tnam);
			txtar.addChild(tcur);
			txtar.addChild(trec);
			var str:String = g_var.retrundVal('nam');
			var nam:String = str.replace(/(^[a-z]|\s[a-z])/g, function(){ return arguments[1].toUpperCase(); });
			tnam.text = ""+nam;
			tnam.x = swid * 0.47;
			tnam.y = shit * 0.23;
			tnam.width = 400;
			tcur.text = ""+g_var.retrundVal('phn');
			tcur.x = swid * 0.47;
			tcur.y = shit * 0.4;
			tcur.width = 300;
			str = g_var.retrundVal('dit');
			var dnam:Class = getDefinitionByName(str) as Class;
            var dis:MovieClip = new dnam();
			labls.addChild(dis);
			dis.x = swid * 0.53;
			dis.y = shit * 0.6;
			trec.text = ""+g_var.loadCurentScore();
			trec.x = swid * 0.47;
			trec.y = shit * 0.76;
			trec.width = 300;
			trace(g_var.retrundVal('nam'));
			trace(g_var.retrundVal('phn'));
			trace(g_var.retrundVal('dit'));
			trace(g_var.retrundVal('edu'));
			var cnam:String = g_var.retrundVal('cun');
			var type:Class = getDefinitionByName(cnam) as Class;
            var inst:MovieClip = new type();
			labls.addChild(inst);
			inst.x = swid * 0.85;
			inst.y = shit * 0.4;
			var goBak:button_back = new button_back();
			addChild(goBak);
			goBak.x = swid*0.9;
			goBak.y = shit*0.9;
			goBak.addEventListener(MouseEvent.CLICK, goBackToMenu);
		}
		function goBackToMenu(e:Event) {
			parnt.removeUserProfile();
		}
	}	
}
