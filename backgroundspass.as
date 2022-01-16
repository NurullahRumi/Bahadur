package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class backgroundspass extends MovieClip{
		var parnt:gameFile;
		var swid:Number;
		var shit:Number;
		var bak1:back2;
		var bak2:back2;
		var laye0:MovieClip = new MovieClip();
		var laye1:MovieClip = new MovieClip();
		var laye2:MovieClip = new MovieClip();
		var laye3:MovieClip = new MovieClip();
		var f1:front;
		var f2:front;
		var f3:front;
		var f4:front;
		var obj1:MovieClip;
		var obj2:MovieClip;
		var obj3:MovieClip;
		var obj4:MovieClip;
		var obj5:MovieClip;
		var obj6:MovieClip;
		var obj7:MovieClip;
		var obj8:MovieClip;
		var obj9:MovieClip;
		var obj10:MovieClip;
		var obj11:MovieClip;
		var obj12:MovieClip;
		var obj13:MovieClip;
		var obj14:MovieClip;
		var obj15:MovieClip;
		var obj16:MovieClip;
		var build1:MovieClip;
		var build2:MovieClip;
		var build3:MovieClip;
		var build4:MovieClip;
		var build5:MovieClip;
		var build6:MovieClip;
		var build7:MovieClip;
		var build8:MovieClip;
		var build9:MovieClip;
		var pos1:int = 0;
		var pos2:int = 0;
		var entStr:Boolean = false;
		var speed:Number = 0;

		public function backgroundspass(par:gameFile) {
			// constructor code
			parnt = par;
			swid = par.swid;
			shit = par.shit;
			addChild(laye3);
			addChild(laye2);
			addChild(laye1);
			this.mouseEnabled = false;
			speed = parnt.game.speed;
		}
		function waterBackComponents() {
			
		}
		function startEnterFrame() {
			if (!entStr) addEventListener(Event.ENTER_FRAME, moveTheObject);			
		}
		function passBackComponents() {
			var sk:sky = new sky();
			laye3.addChild(sk);
			f1 = new front();
			laye1.addChild(f1);
			f1.x = 0;
			f1.y = shit * 0.85;
			f2 = new front();
			laye1.addChild(f2);
			f2.x = f2.width;
			f2.y = shit * 0.85;	
			f3 = new front();
			laye2.addChild(f3);
			f3.x = 0;
			f3.y = shit * 0.7;
			f4 = new front();
			laye2.addChild(f4);
			f4.x = f4.width;
			f4.y = shit * 0.7;
			
			bak1 = new back2();
			bak1.x = 0;
			bak1.y = shit * 0.6;
			laye3.addChild(bak1);
			bak1.scaleX = bak1.scaleY = swid/bak1.width;
			/*bak2 = new back1();
			bak2.x = bak1.width;
			bak2.y = shit * 0.6;
			laye3.addChild(bak2);*/
			
			createSomeObject();			
		}
		function createSomeObject() {
			var yp1:Number = 0.775;
			var yp2:Number = 0.89;
			obj1 = new tree1(); 
			obj2 = new tree2(); 
			obj4 = new tree4(); 
			obj3 = new tree3(); 
			obj5 = new tree5(); 
			obj6 = new tree3(); 
			obj7 = new tree3(); 
			obj8 = new tree3(); 
			obj9 = new tree3(); 
			obj10 = new tree6(); 
			obj11 = new tree1(); 
			obj12 = new tree5(); 
			obj13 = new tree1(); 
			obj14 = new tree2(); 
			obj15 = new tree1(); 
			obj16 = new tree5(); 
			build1 = new buld1(); 
			build2 = new buld2(); 
			build3 = new buld3();  
			build4 = new buld4(); 
			build5 = new buld1(); 
			build6 = new buld2(); 
			build7 = new buld3(); 
			build8 = new buld4(); 
			build9 = new buld1(); 
			var shif1:Number = 0.09;
			var shif2:Number = 0.19;
			var clos:Number = 0.005;
			assignProperty(obj1, 1, clos);
			assignProperty(build8, 1, shif1);
			assignProperty(obj2, 1, clos);
			assignProperty(obj11, 2, clos);
			assignProperty(build4, 2, shif2);
			assignProperty(obj12, 2, clos);
			assignProperty(obj3, 1, shif1);
			assignProperty(obj13, 2,shif2);
			assignProperty(obj4, 1, shif1);
			assignProperty(build5, 2, shif2);
			assignProperty(obj14, 2, clos);
			assignProperty(build1, 1, clos);
			assignProperty(obj5, 1, shif1);
			assignProperty(obj6, 1, shif1);
			assignProperty(build6, 2, shif2);
			assignProperty(obj16, 2, clos);
			assignProperty(build2, 1, shif1);
			assignProperty(obj7, 1, shif1);
			assignProperty(build3, 1, shif1);
			assignProperty(obj8, 1, clos);
			assignProperty(build9, 2, shif2);
			assignProperty(obj15, 2, clos);
			assignProperty(obj9, 1, shif1);
			assignProperty(build7, 1, shif1);
			assignProperty(obj10, 1, clos);
			if (!entStr) addEventListener(Event.ENTER_FRAME, moveTheObject); 
		}
		function assignProperty(obj:MovieClip, lay:int, shft:Number) {
			var yp2:Number = 0.745;
			var yp1:Number = 0.88;
			if (lay == 1) {
				obj.y = shit * (yp1); 
				laye1.addChild(obj);	
				obj.name = "" + speed;
				if(int(Math.random()*2)==0) obj.scaleX = 1.4;
				else obj.scaleX = -1.4;
				obj.scaleY = 1.4;
				pos1 = pos1 + Math.random() * swid * shft;
				pos1 += obj.width/2;
				//trace(obj.width);
				obj.x = pos1;
			}
			if (lay == 2) { 
				obj.y = shit * (yp2);
				laye2.addChild(obj);	
				if(int(Math.random()*2)==0) obj.scaleX = 0.8;
				else obj.scaleX = -0.8;
				obj.scaleY = 0.8;
				obj.name = "" + String(speed-8);
				pos2 = pos2 + Math.random() * swid * shft;
				pos2 += obj.width/2;
				//trace(obj.width);
				obj.x = pos2;
			}	
		}
		function moveTheObject(e:Event) {
			entStr = true;
			var wd1:int = speed;
			var wd2:int = speed-8;
			if (!parnt.pause) {
				if (obj1 != null) {obj1.x -= int(obj1.name);if (obj1.x <-(obj1.width / 2 + 10)) obj1.x = pos1;}
				if (obj2 != null) {obj2.x -= int(obj2.name);if (obj2.x <-(obj2.width / 2 + 10)) obj2.x = pos1;}
				if (obj3 != null) {obj3.x -= int(obj3.name);if (obj3.x <-(obj3.width / 2 + 10)) obj3.x = pos1;}
				if (obj4 != null) {obj4.x -= int(obj4.name);if (obj4.x <-(obj4.width / 2 + 10)) obj4.x = pos1;}
				if (obj5 != null) {obj5.x -= int(obj5.name);if (obj5.x <-(obj5.width / 2 + 10)) obj5.x = pos1;}
				if (obj6 != null) {obj6.x -= int(obj6.name);if (obj6.x <-(obj6.width / 2 + 10)) obj6.x = pos1;}
				if (obj7 != null) {obj7.x -= int(obj7.name);if (obj7.x <-(obj7.width / 2 + 10)) obj7.x = pos1;}
				if (obj8 != null) {obj8.x -= int(obj8.name);if (obj8.x <-(obj8.width / 2 + 10)) obj8.x = pos1;}
				if (obj9 != null) {obj9.x -= int(obj9.name);if (obj9.x <-(obj9.width / 2 + 10)) obj9.x = pos1;}
				if (obj10 != null) {obj10.x -= int(obj10.name);if (obj10.x <-(obj10.width / 2 + 10)) obj10.x = pos1;}
				if (obj11 != null) {obj11.x -= int(obj11.name);if (obj11.x <-(obj11.width / 2 + 10)) obj11.x = pos2 + 100;}
				if (obj12 != null) {obj12.x -= int(obj12.name);if (obj12.x <-(obj12.width / 2 + 10)) obj12.x = pos2 + 100;}
				if (obj13 != null) {obj13.x -= int(obj13.name);if (obj13.x <-(obj13.width / 2 + 10)) obj13.x = pos2 + 100;}
				if (obj14 != null) {obj14.x -= int(obj14.name);if (obj14.x <-(obj14.width / 2 + 10)) obj14.x = pos2 + 100;}
				if (obj15 != null) {obj15.x -= int(obj15.name);if (obj15.x <-(obj15.width / 2 + 10)) obj15.x = pos2 + 100;}
				if (obj16 != null) {obj16.x -= int(obj16.name);if (obj16.x <-(obj16.width / 2 + 10)) obj16.x = pos2 + 100;}
				if (build1 != null) {build1.x -= int(build1.name);if (build1.x <-(build1.width / 2 + 10)) build1.x = pos1;}
				if (build2 != null) {build2.x -= int(build2.name);if (build2.x <-(build2.width / 2 + 10)) build2.x = pos1;}
				if (build3 != null) {build3.x -= int(build3.name);if (build3.x <-(build3.width / 2 + 10)) build3.x = pos1;}
				if (build4 != null) {build4.x -= int(build4.name);if (build4.x <-(build4.width / 2 + 10)) build4.x = pos2 + 100;}
				if (build5 != null) {build5.x -= int(build5.name);if (build5.x <-(build5.width / 2 + 10)) build5.x = pos2 + 100;}
				if (build6 != null) {build6.x -= int(build6.name);if (build6.x <-(build6.width / 2 + 10)) build6.x = pos2 + 100;}
				if (build7 != null) {build7.x -= int(build7.name);if (build7.x <-(build7.width / 2 + 10)) build7.x = pos1;}
				if (build8 != null) {build8.x -= int(build8.name);if (build8.x <-(build8.width / 2 + 10)) build8.x = pos1;}
				if (build9 != null) {build9.x -= int(build9.name);if (build9.x <-(build9.width / 2 + 10)) build9.x = pos2 + 100;}
				/*bak1.x -= 0.5;
				bak2.x -= 0.5;
				if(bak1.x<-bak1.width)  
					bak1.x = bak2.x+bak2.width;
				if(bak2.x<-bak2.width) 
					bak2.x = bak1.x + bak1.width;*/
					
				f1.x -= speed;
				f2.x -= speed;
				if (f1.x < - f1.width+10) f1.x = f2.x + f2.width;
				if (f2.x < - f2.width+10) f2.x = f1.x + f1.width;
				f3.x -= wd2;
				f4.x -= wd2;
				if (f3.x < - f3.width+10) f3.x = f4.x + f4.width;
				if (f4.x < - f4.width+10) f4.x = f3.x + f3.width;
			}
		}
	}	
}
