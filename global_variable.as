package  {
	import flash.net.SharedObject;
	
	public class global_variable {
		var saveMe: SharedObject = SharedObject.getLocal("IOMGControllerVariable");
		var scores: SharedObject = SharedObject.getLocal("IOMGScores");
		var usrInf: SharedObject = SharedObject.getLocal("UserInformation");
		var target_cunt:Array = ["cun_hko", "cun_ita", "cun_kor", "cun_ma", "cun_omn", "cun_qtr", "cun_sau", "cun_uk", "cun_uae", "cun_bahrain", "cun_singa"];

		public function global_variable() {
			// constructor code
			saveMe.data.targetScore = [111, 3000, 50000, 130000, 2000, 10000, 100000];			
			saveMe.data.targetScore_targ = [84000, 84000, 61000, 35000, 84000, 84000, 165000, 84000, 84000, 84000, 84000];
			saveMe.data.target_level = new Array();
			if (scores.data.ptimes>=0) scores.data.ptimes++;
			else scores.data.ptimes = 0;
			if (scores.data.topScor!=null) manageHiestScore(45);
			else scores.data.topScor = new Array();
			//trace("Number of Times Played: " + usrInf.data.name);
		}
		public function manageHiestScore(scr:Number) {
			//trace("Its in the array");
			var arr:Array = scores.data.topScor;
			for (var a:int; a < arr.length; a++) {
				var tmp:Number = arr[a];
				if (tmp < scr) {
					//var nw:Number = tmp;
					arr[a] = scr;
					scr = tmp;
				}
			}
			if (arr.length < 10) arr.push(scr);
			scores.data.topScor = arr;
			trace(arr);
		}
		public function getTargetValue(level:int) {
			return saveMe.data.targetScore[level];
		}
		public function getCurrentCountryIndex(cunt:String) {
			for(var a:int = 0; a<target_cunt.length; a++) {
				//trace(target_cunt[a]);
				if(target_cunt[a]==cunt) return a;
			}
			return null;
		}
		public function getGameTargetValue(cunt:String) {
			var a:int = getCurrentCountryIndex(cunt);
			//trace(cunt+", "+a+", "+saveMe.data.targetScore_targ[a]);
			return saveMe.data.targetScore_targ[a];
		}
		public function getLevelTargetValue(cunt:int) {
			trace("its going to save value "+saveMe.data.target_level[cunt]);
			switch(cunt) {
				case 0: return saveMe.data.target_level_0;
					break;
				case 1: return saveMe.data.target_level_1;
					break;
				case 2: return saveMe.data.target_level_2;
					break;
				case 3: return saveMe.data.target_level_3;
					break;
				case 4: return saveMe.data.target_level_4;
					break;
				case 5: return saveMe.data.target_level_5;
					break;
			}
			return saveMe.data.target_level;
		}
		public function setLevelTargetValue(cunt:int, val:String) {
			switch(cunt) {
				case 0: saveMe.data.target_level_0 = 'yes';
					break;
				case 1: saveMe.data.target_level_1 = 'yes';
					break;
				case 2: saveMe.data.target_level_2 = 'yes';
					break;
				case 3: saveMe.data.target_level_3 = 'yes';
					break;
				case 4: saveMe.data.target_level_4 = 'yes';
					break;
				case 5: saveMe.data.target_level_5 = 'yes';
					break;
			}
		}
		public function submitUserInfo(nam:String, phn:String, dis:String) {
			usrInf.data.name = nam;
			usrInf.data.phone = phn;
			usrInf.data.district = dis;
		}
		public function saveEducation(edu:String) {
			usrInf.data.education = edu;
		}
		public function saveCountry(cun:String) {
			usrInf.data.country = cun;
		}
		public function saveGender(gen:String) {
			usrInf.data.gender = gen;
		}
		public function retrundVal(typ:String):String {
			if (typ == "gen") return usrInf.data.gender;
			if (typ == "cun") return usrInf.data.country;
			if (typ == "edu") return usrInf.data.education;
			if (typ == "nam") return usrInf.data.name;
			if (typ == "phn") return usrInf.data.phone;
			if (typ == "dit") return usrInf.data.district;
			return null;
		}
		public function getScores():Array {
			return scores.data.topScor;
		}
		public function saveCurentScore(scor:int) {
			scores.data.curentScore = scor;
		}
		public function loadCurentScore() {
			return scores.data.curentScore;
		}
		public function saveCurrentLevel(level:int) {			
			saveMe.data.lavelComplete = level;
		}
		public function loadCurrentLevel() {			
			return saveMe.data.lavelComplete;
		}
		public function saveCurrentChoise(level:String) {			
			saveMe.data.lavelChoise = level;
		}
		public function loadCurrentChoise() {			
			return saveMe.data.lavelChoise;
		}
	}
	
}
