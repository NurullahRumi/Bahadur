package  {
	import flash.display.MovieClip;
	import flash.utils.getDefinitionByName;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.greensock.TimelineLite;
	import com.greensock.easing.*;
	
	public class multpleChoise extends MovieClip {
		var parnt:MovieClip;
		var swid:Number;
		var shit:Number;
		var objs:Array = new Array();
		var answ:Array = new Array(); // ["paper_Towel"];
		var titl:Array = ["qs_title20", "qs_title21"];
		var puzPices:MovieClip = new MovieClip();
		var result:Array = new Array();
		var doneOnce:Boolean = true;
		var prof:int = 0;
		var anim:TimelineLite = new TimelineLite();

		public function multpleChoise(par:MovieClip, list:Array, num:int, pnum:int) {
			parnt = par;
			swid = par.swid;
			shit = par.shit;
			objs = list.concat();
			prof = pnum;
			answ = randomSelect(list.concat(), num);
			var objAry:Array = randomSelect(objs, 2);
			objAry = randomArray(objAry);
			createTitle();
			createOptions(objAry);
			createPosition(answ);
			//addButton();
		}
		public function createTitle() {
			var titl:MovieClip;
			titl = new qs_title20();
			addChild(titl);
			titl.x = 0.1 * swid;
			titl.y = 0.1 * shit;;
			anim.from(titl, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
		}
		/*
		public function addButton() {	
			var back:button_back = new button_back();
			addChild(back);
			back.x = swid*0.1;
			back.y = swid*0.5;
			back.addEventListener(MouseEvent.CLICK, function() {parnt.createButtons();});
		}*/
		function createOptions(ary:Array) {
			addChild(puzPices);
			var dis:Number = 0.8/ary.length;
			for(var a=0; a<ary.length; a++){
				var type:Class = getDefinitionByName(ary[a]) as Class;
				var inst:MovieClip = new type();
				puzPices.addChild(inst);
				inst.x = swid*(0.1+dis*0.5+dis*a);
				inst.y = shit*0.6;
				inst.name = ""+ary[a];
				inst.addEventListener(MouseEvent.CLICK, checkForAnswer);
				anim.from(inst, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
			}
		}
		function createPosition(ary:Array) {
			var target:MovieClip = new MovieClip();
			addChild(target);
			var dis:Number = 0.8/ary.length;
			for (var a:int = 0; a < ary.length; a++) {
				var nam:String = ary[a] + "_txt";
				var type:Class = getDefinitionByName(nam) as Class;
				var inst:MovieClip = new type();
				inst.name = ary[a];
				target.addChild(inst);
				inst.x = swid*(0.1+dis*0.5+dis*a);
				inst.y = shit*0.3;
				anim.from(inst, 0.5, {scaleX:0, scaleY:0, ease: Elastic.easeOut.config(1, 0.75)});
			}
		}
		function checkForAnswer(e:Event) {
			var done:Boolean = true;
			var clk:String = e.target.name;
			var rect:ractBox = new ractBox();
			puzPices.addChild(rect);
			rect.x = e.target.x;
			rect.y = e.target.y;
			if(answ.indexOf(clk)>-1) {
				for(var a in result) 
					if (result[a][0]==clk) 
						result[a][1] = true;
			}
			else youAreWrong();
			for(var b in result) {
				if (result[b][1] == false) done = false;
			}
			if(done) youAreRight();
		}
		
		function randomSelect(targ:Array, siz:int):Array {
			var tarOut:Array = new Array();
			for(var obj in answ) {
				tarOut.push(answ[obj]);
				result.push([answ[obj], false]);
				targ.splice(targ.indexOf(answ[obj]), 1);
			}
			if(targ.length<siz) siz = targ.length;
			for(var a=0; a<siz; a++) {
				var rnd:int = Math.random()*targ.length;
				tarOut.push(targ[rnd]);
				targ.splice(rnd,1);
			}
			return tarOut;
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
