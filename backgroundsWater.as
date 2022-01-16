package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class backgroundsWater extends MovieClip{
		var parnt:MovieClip;
		var swid:Number;
		var shit:Number;
		var cloud:MovieClip = new MovieClip();
		var obj1:MovieClip;
		var obj2:MovieClip;
		var obj3:MovieClip;
		var stn1:MovieClip;
		var stn2:MovieClip;
		var stn3:MovieClip;

		public function backgroundsWater(par:MovieClip) {
			// constructor code
			this.mouseEnabled = false;
			parnt = par;
			swid = par.swid;
			shit = par.shit; 
			createSomeObject();
			addWaves();
		}
		function createSomeObject() {
			var yp1:Number = 0.775;
			var yp2:Number = 0.89;
			obj1 = new clud1(); 
			obj2 = new clud2();
			obj3 = new clud2();
			stn1 = new stone1();
			stn2 = new stone2();
			stn3 = new stone3();
			var back:wsky = new wsky();
			addChild(back);
			back.x = 0.5*swid;
			back.y = 0.5*shit;
			back.scaleY = back.scaleX = 1.1*swid/back.width;
			addChild(cloud);
			cloud.addChild(obj1);
			cloud.addChild(obj2);
			cloud.addChild(obj3);
			cloud.addChild(stn1);
			cloud.addChild(stn2);
			cloud.addChild(stn3);
			obj1.x = swid*0.3;
			obj2.x = swid*0.9;
			obj3.x = swid*0.4;
			stn1.x = swid*0.1;
			stn2.x = swid*0.5;
			stn3.x = swid*0.8;
			stn1.y = stn2.y = stn3.y = shit*0.6;
			obj1.y = shit*0.2;
			obj2.y = shit*0.4;
			obj3.y = shit*0.1;
			obj1.name = "" + 0.5;
			obj2.name = "" + 0.2;
			obj3.name = "" + 0.1;
			stn1.name = "" + 0.65;
			stn2.name = "" + 0.62;
			stn3.name = "" + 0.69;
		}
		function addWaves() {
			var wb1:wave = new wave();
			var wb2:wave2 = new wave2();
			//var wb3:wave = new wave();
			var wb4:wave2 = new wave2();
			addChild(wb1);
			addChild(wb2);
			//addChild(wb3);
			addChild(wb4);
			wb1.x = 0.5 * swid;
			wb2.x = 0.4 * swid;
			//wb3.x = 0.7 * swid;
			wb4.x = 0.8 * swid;
			wb1.y = 0.6 * shit;
			wb2.y = 0.7 * shit;
			//wb3.y = 0.8 * shit;
			wb4.y = 0.8 * shit;
			wb1.scaleX = wb1.scaleY = 0.8;
			wb2.scaleX = wb2.scaleY = 0.9;
			//wb3.scaleX = wb3.scaleY = 1.1;
			wb4.scaleX = wb4.scaleY = 1.2;
			wb1.alpha = wb2.alpha = wb4.alpha = 0.4;
			addEventListener(Event.ENTER_FRAME, moveTheObject);
		}
		function moveTheObject(e:Event) {
			var hp:Number;
			var wp:Number;
			//if (!parnt.pause) {
				if (obj1 != null) {
					obj1.x -= Number(obj1.name);
					if (obj1.x <-(obj1.width / 2 + 50)) {
						hp = Math.random()*0.4*shit;
						wp = swid+Math.random()*swid*0.24+obj1.width;
						obj1.x = wp;
						obj1.y = hp;
						trace(obj1.y);
					}
				}
				if (obj2 != null) {
					obj2.x -= Number(obj2.name);
					if (obj2.x <-(obj2.width / 2 + 50)) {
						hp = Math.random()*0.4*shit;
						wp = swid+Math.random()*swid*0.24+obj2.width;
						obj2.x = wp;
						obj2.y = hp;
					}					
				}
				if (obj3 != null) {
					obj3.x -= Number(obj3.name);
					if (obj3.x <-(obj3.width / 2 + 50)) {
						hp = Math.random()*0.4*shit;
						wp = swid+Math.random()*swid*0.24+obj2.width;
						obj3.x = wp;
						obj3.y = hp;
					}					
				}
				if (stn1 != null) {
					stn1.x -= Number(stn1.name);
					if (stn1.x <-(stn1.width / 2 + 50)) {
						wp = swid+Math.random()*swid*0.24+stn1.width;
						stn1.x = wp;
					}					
				}
				if (stn2 != null) {
					stn2.x -= Number(stn2.name);
					if (stn2.x <-(stn2.width / 2 + 50)) {
						wp = swid+Math.random()*swid*0.24+stn2.width;
						stn2.x = wp;
					}					
				}
				if (stn3 != null) {
					stn3.x -= Number(stn3.name);
					if (stn3.x <-(stn3.width / 2 + 50)) {
						wp = swid+Math.random()*swid*0.24+stn3.width;
						stn3.x = wp;
					}					
				}
			//}
		}
	}	
}
