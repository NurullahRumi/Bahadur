package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class backgrounds extends MovieClip{
		var parnt:gameFile;
		var swid:Number;
		var shit:Number;
		var laye0:MovieClip = new MovieClip();
		var laye1:MovieClip = new MovieClip();
		var laye2:MovieClip = new MovieClip();
		var laye3:MovieClip = new MovieClip();
		var f1:front;
		var f2:front;
		var f3:front;
		var f4:front;
		//var obj1:MovieClip;
		var hus1:MovieClip;
		var hus2:MovieClip;
		var hus3:MovieClip;
		var hus4:MovieClip;
		var pos1:int = 0;
		var pos2:int = 600;
		var entStr:Boolean = false;
		var speed:Number = 0;

		public function backgrounds(par:gameFile) {
			// constructor code
			parnt = par;
			swid = par.swid;
			shit = par.shit;
			addChild(laye0);
			addChild(laye3);
			addChild(laye1);
			addChild(laye2);
			var sky:skyg = new skyg();
			laye0.addChild(sky);
			sky.x = swid*0.5;
			sky.y = shit*0.5;
			this.mouseEnabled = false;
			//sky.mouseEnabled = true;
			speed = parnt.game.speed;
		}
		function waterBackComponents() {
			
		}
		function startEnterFrame() {
			if (!entStr) addEventListener(Event.ENTER_FRAME, moveTheObject);			
		}
		var sk:backall;
		function passBackComponents() {
			sk = new backall();
			laye3.addChild(sk);
			sk.x = swid*0.0; 
			sk.y = shit*0.81;
			sk.scaleX = sk.scaleY = 0.75*shit/sk.height;
			
			f1 = new front();
			laye1.addChild(f1);
			f1.x = 0;
			f1.y = shit * 0.78;
			f2 = new front();
			laye1.addChild(f2);
			f2.x = f1.width;
			f2.y = shit * 0.78;	
			
			createSomeObject();			
		}
		function createSomeObject() {
			var yp1:Number = 0.775;
			var yp2:Number = 0.89;
			//obj1 = new tree1(); 
			hus1 = new huse1(); 
			hus2 = new huse2(); 
			//hus3 = new huse3();
			//hus4 = new huse4(); 
			var shif1:Number = 0.9;
			var shif2:Number = 0.79;
			//var clos:Number = 0.005;
			//assignProperty(obj1, 2, shif1);
			//assignProperty(hus4, 2, shif2);
			assignProperty(hus1, 2, shif2);
			assignProperty(hus2, 2, shif2);
			//assignProperty(hus3, 2, shif2);
			
			//assignProperty(hus6, 2, shif);
			if (!entStr) addEventListener(Event.ENTER_FRAME, moveTheObject); 
		}
		function assignProperty(obj:MovieClip, lay:int, shft:Number) {
			var yp2:Number = 0.79;
			var yp1:Number = 1.0;
			if (lay == 2) { 
				obj.y = shit * (yp2);
				laye2.addChild(obj);	
				if(int(Math.random()*2)==0) obj.scaleX = 1;
				else obj.scaleX = -1;
				//obj.scaleY = 0.8;
				obj.name = "" + String(speed);
				pos2 = pos2 + Math.random() * swid * shft;
				pos2 += obj.width/2;
				//trace(obj.width);
				obj.x = pos2;
			}	
		}
		function moveTheObject(e:Event) {
			entStr = true;
			var wd1:int = speed;
			var wd2:int = speed;
			if (!parnt.pause) {
				//if (obj1 != null) {obj1.x -= Number(obj1.name);if (obj1.x <-(obj1.width / 2 + 10)) obj1.x = pos2;}
				if (hus1 != null) {hus1.x -= Number(hus1.name);
					if (hus1.x <-(hus1.width / 2 + 10)) 
					{
						if(Math.random()*2==0) hus1.scaleX = -1;
						else hus1.scaleX = 1;
						hus1.x = pos2 + Math.random()*300;
						//trace(hus1.scaleX+" house 1 "+hus1.x);
					}
				}
				if (hus2 != null) {hus2.x -= Number(hus2.name);
					if (hus2.x <-(hus2.width / 2 + 10)){
						if(Math.random()*2==0) hus2.scaleX = -1;
						else hus2.scaleX = 1;
						hus2.x = pos2 + Math.random()*300;
						//trace(hus2.scaleX+" house 1 "+hus2.x);
					}
				}
				//if (hus3 != null) {hus3.x -= Number(hus3.name);if (hus3.x <-(hus3.width / 2 + 10)) hus3.x = pos2;}
				//if (hus4 != null) {hus4.x -= Number(hus4.name);if (hus4.x <-(hus4.width / 2 + 10)) hus4.x = pos2 + 100;}
				
				sk.x -= 0.5;
				if(sk.x<-sk.width) sk.x = swid+10;
				f1.x -= wd2;
				f2.x -= wd2;
				if (f1.x < - f1.width+10) {f1.x = f2.x + f2.width;}
				if (f2.x < - f2.width+10) f2.x = f1.x + f1.width;
			}
		}
	}	
}
