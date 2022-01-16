package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class forground extends MovieClip{
		var parnt:gameFile;
		var swid:Number;
		var shit:Number;
		var laye1:MovieClip = new MovieClip();
		var obj1:MovieClip;
		var obj2:MovieClip;
		var obj3:MovieClip;
		var obj4:MovieClip;
		var obj5:MovieClip;
		var pos1:int = 0;
		var pos2:int = 0;
		var entStr:Boolean = false;
		var speed:Number = 0;

		public function forground(par:gameFile) {
			// constructor code
			parnt = par;
			swid = par.swid;
			shit = par.shit;
			addChild(laye1);
			this.mouseEnabled = false;
			speed = parnt.game.speed;
		}
		function startEnterFrame() {
			if (!entStr) addEventListener(Event.ENTER_FRAME, moveTheObject);			
		}
		function passBackComponents() {			
			createSomeObject();			
		}
		function createSomeObject() {
			var yp1:Number = 0.8;
			var yp2:Number = 0.93;
			obj1 = new tree3(); 
			//obj2 = new tree2(); 
			//obj4 = new tree3(); 
			//obj3 = new tree4(); 
			//obj5 = new tree4(); 
			var shif1:Number = 0.9;
			var shif2:Number = 0.59;
			var clos:Number = 0.005;
			assignProperty(obj1, 1, shif2);
			//assignProperty(obj2, 2, shif2);
			//assignProperty(obj5, 1, shif2);
			//assignProperty(obj4, 1, shif2);
			//assignProperty(obj3, 1, shif2);
			
			//assignProperty(hus6, 2, shif);
			if (!entStr) addEventListener(Event.ENTER_FRAME, moveTheObject); 
		}
		function assignProperty(obj:MovieClip, lay:int, shft:Number) {
			var yp2:Number = 0.745;
			var yp1:Number;
			if (lay == 1) {
				yp1 = 1.0 + Number(Math.random()*0.1);
			}
			else {
				yp1 = 1.0 ;
			}
			obj.y = shit * (yp1); 
			laye1.addChild(obj);	
			obj.name = "" + Number(speed+18);
			if(int(Math.random()*2)==0) obj.scaleX = 1.0;
			else obj.scaleX = -1.0;
			// obj.scaleY = 1.0;
			pos1 = pos1 + Math.random() * swid * shft;
			pos1 += obj.width/2;
			obj.x = pos1;
		}
		function moveTheObject(e:Event) {
			entStr = true;
			var wd1:int = speed;
			var wd2:int = speed-8;
			if (!parnt.pause) {
				if (obj1 != null) {obj1.x -= int(obj1.name);if (obj1.x <-(obj1.width / 2 + 10)) {
					var yp1:Number = 1.05 + Number(Math.random()*0.1);
					obj1.y = yp1*shit;
					obj1.x = pos1+swid +Math.random()*swid;
					}
				}
				//if (obj2 != null) {obj2.x -= int(obj2.name);if (obj2.x <-(obj2.width / 2 + 10)) obj2.x = pos1;}
				//if (obj3 != null) {obj3.x -= int(obj3.name);if (obj3.x <-(obj3.width / 2 + 10)) obj3.x = pos1;}
				//if (obj4 != null) {obj4.x -= int(obj4.name);if (obj4.x <-(obj4.width / 2 + 10)) obj4.x = pos1;}
				//if (obj5 != null) {obj5.x -= int(obj5.name);if (obj5.x <-(obj5.width / 2 + 10)) obj5.x = pos1;}
			}
		}
	}	
}
