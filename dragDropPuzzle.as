package  {
	import flash.display.MovieClip;
	import flash.utils.getDefinitionByName;
	import flash.events.MouseEvent;
	import flash.events.Event;
	//import flash.display3D.IndexBuffer3D;
	import com.greensock.TimelineLite;
	import com.greensock.easing.*;
	
	public class dragDropPuzzle extends MovieClip {
		var parnt:MovieClip;
		var swid:Number;
		var shit:Number;
		var objs:Array = new Array();
		var tars:Array = new Array();
		var titl:Array = ["qs_title10", "qs_title11"];
		var tarObj:Array = new Array();
		var tarLObj:Array = new Array();
		var matAry:Array = new Array();
		var intPos:Array = new Array();
		var tarPos:Array = new Array();
		var doneOnce:Boolean = true;
		var prof:int = 0;
		var anim:TimelineLite = new TimelineLite();

		public function dragDropPuzzle(par:MovieClip, list:Array, pnum:int) {
			// constructor code
			parnt = par;
			swid = par.swid;
			shit = par.shit;
			objs = list.concat();
			tars = list.concat();
			prof = pnum;
			var srtObj:Array = randomSelect(objs, tars, 4);
			//trace(srtObj[1]);
			var tary:Array = randomArray(srtObj[1]);
			createTitle();
			createPosition(tary);
			createObjects(srtObj[0]);
			//addButton();
		}
		public function createTitle() {
			var titl:MovieClip;
			titl = new qs_title10();
			addChild(titl);
			titl.x = 0.1 * swid;
			titl.y = 0.1 * shit;
			anim.from(titl, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
		}
		function createObjects(ary:Array) {
			var puzPices:MovieClip = new MovieClip();
			addChild(puzPices);
			var dis:Number = 0.8/ary.length;
			for(var a=0; a<ary.length; a++){
				var type:Class = getDefinitionByName(ary[a]) as Class;
				var inst:MovieClip = new type();
				puzPices.addChild(inst);
				inst.x = swid*(0.1+dis*0.5+dis*a);
				inst.y = shit*0.3;
				inst.name = ""+ary[a].substr(-1, 1);
				tarObj.push(inst);
				intPos.push([inst.x, inst.y]);
				inst.addEventListener(MouseEvent.MOUSE_DOWN, startMyDrag);
				inst.addEventListener(MouseEvent.MOUSE_UP, stopMyDrag);
				anim.from(inst, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
			}
		}
		function startMyDrag(e:Event){
			var obj:MovieClip = e.target as MovieClip;
			obj.startDrag(false);
		}
		function getCloseTo(xp:Number, yp:Number, nam:String):Array {
			var rtPos:Array = [0, 0];
			for(var a=0; a<tarPos.length; a++) {
				if(Math.sqrt((xp-tarPos[a][0])*(xp-tarPos[a][0])+(yp-tarPos[a][1])*(yp-tarPos[a][1]))<70){
					rtPos[0] = tarPos[a][0];
					rtPos[1] = tarPos[a][1];
					if (nam == tarLObj[a].name) matAry[a] = true;
				}
			}
			return rtPos;
		}
		function stopMyDrag(e:Event) {
			var obj:MovieClip = e.target as MovieClip;
			obj.stopDrag();
			var tPos:Array = getCloseTo(obj.x, obj.y, obj.name);
			if(tPos[0]==0) {
				obj.x = intPos[tarObj.indexOf(obj)][0];
				obj.y = intPos[tarObj.indexOf(obj)][1];
			}
			else {
				obj.x = tPos[0];
				obj.y = tPos[1];
			}
			checkMatch();
		}
		function checkMatch() {
			var matched:Boolean = true;
			//trace(matAry[0]);
			var num:int = 0;
			for(var a = 0 ; a<matAry.length; a++) {
				if(matAry[a]=='false')
					matched = false;
			}
			for each (var obj in tarObj) {
				for each(var tar in tarPos) {
					//trace(tar);
					if (obj.x == tar[0] && obj.y == tar[1])
						num++;
				}
			}
			if (!matched && num == tarPos.length) youAreWrong();
			if (matched) youAreRight();
		}
		function createPosition(ary:Array) {
			var target:MovieClip = new MovieClip();
			addChild(target);
			var dis:Number = 0.8/ary.length;
			for (var a:int = 0; a < ary.length; a++) {
				var nam:String = ary[a] + "_txt";
				var type:Class = getDefinitionByName(nam) as Class;
				var inst:MovieClip = new type();
				inst.name = ""+ary[a].substr(-1, 1);
				target.addChild(inst);
				inst.x = swid*(0.1+dis*0.5+dis*a);
				inst.y = shit * 0.8;
				var ract:ractBox = new ractBox();
				inst.addChild(ract);
				ract.y = -75;
				matAry.push([false]);
				tarLObj.push(inst);
				tarPos.push([inst.x, inst.y-75]);
				anim.from(inst, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
			}
		}
		function randomSelect(main:Array, targ:Array, siz:Number):Array {
			var outPut:Array = new Array();
			var tarOut:Array = new Array();
			if(main.length<siz) siz = main.length;
			for(var a=0; a<siz; a++) {
				var rnd:int = Math.random()*main.length;
				outPut.push(main[rnd]);
				tarOut.push(targ[rnd]);
				main.splice(rnd,1);
				targ.splice(rnd,1);
			}
			return [outPut, tarOut];
		}
		function randomArray(ary:Array):Array {
			var outPut:Array = new Array();
			var len:int = ary.length;
			for(var a:int=0; a<len; a++) {
				var rnd:int = Math.random()*ary.length;
				outPut.push(ary[rnd]);
				ary.splice(rnd, 1);
			}
			return outPut;
		}
		function youAreRight() {
			anim.kill();
			if(doneOnce) {
				parnt.score += 1000;
				parnt.changeScore();
				var end:right = new right();
				addChild(end);
				end.x = 0.5 * swid;
				end.y = 0.5 * shit;
				addOnEndButton(end);
				doneOnce = false;
				parnt.chek++;
			}
			//anim.from(end, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
		}
		function youAreWrong() {
			anim.kill();
			parnt.score -= 1000;
			parnt.changeScore();
			var end:wrong = new wrong();
			addChild(end);
			end.x = 0.5 * swid;
			end.y = 0.5 * shit;
			addOnEndButton(end);			
			//anim.from(end, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
		}
		function addOnEndButton(end:MovieClip) {
			var bak:backPuzle = new backPuzle();
			end.addChild(bak);
			bak.x = -80;
			bak.y = 70;
			bak.addEventListener(MouseEvent.CLICK, function() { parnt.createButtons(); });
			var res:restartPuz = new restartPuz();
			end.addChild(res);
			res.x = 0;
			res.y = 70;
			res..addEventListener(MouseEvent.CLICK, function() { parnt.removePuzzle(); parnt.createPuzzle(prof); });
			var nxt:backPuzle = new backPuzle();
			end.addChild(nxt);
			nxt.x = 80;
			nxt.y = 70;
			nxt.scaleX = -1;
			nxt..addEventListener(MouseEvent.CLICK, function() { parnt.removePuzzle(); parnt.createPuzzle(prof); });
			anim.from(bak, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});	
			anim.from(res, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});	
			anim.from(nxt, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});	
		}
	}
}
