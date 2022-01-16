package  {
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.TimerEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.utils.Timer;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequestMethod;
	
	public class datatransfar {
		var g_var:global_variable = new global_variable();
		var checkTimer:Timer = new Timer(4000);
		var checkLoader:URLLoader = new URLLoader();
		var connected:Boolean = false;
		var divi:Array = new Array();
		var cunt:Array = new Array();

		public function datatransfar() {
			// constructor code
			divi["dist_1"] = "Barisal";
			divi["dist_2"] = "Chittagong";
			divi["dist_3"] = "Dhaka";
			divi["dist_4"] = "Khulna";
			divi["dist_5"] = "Mymensingh";
			divi["dist_6"] = "Rajshahi";
			divi["dist_7"] = "Rangpur";
			divi["dist_8"] = "Sylhet";
			//["cun_hko", "cun_ita", "cun_kor", "cun_ma", "cun_omn", "cun_qtr", "cun_sau", "cun_uk", "cun_uae", "cun_bahrain", "cun_singa"];
			cunt['cun_hko'] = 'Hong Kong';
			cunt['cun_ita'] = 'Italy';
			cunt['cun_kor'] = 'Korea';
			cunt['cun_ma'] = 'Malaysia';
			cunt['cun_omn'] = 'Oman';
			cunt['cun_qtr'] = 'Qatar';
			cunt['cun_sau'] = 'Saudi Arabia';
			cunt['cun_uk'] = 'United Kingdom';
			cunt['cun_uae'] = 'United Arab Emirates';
			cunt['cun_bahrain'] = 'Bahrain';
			cunt['cun_singa'] = 'Singapore';
			detectIntConnection();
		}
		function detectIntConnection():Boolean {
			checkLoader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			//checkURL();
			checkTimer.addEventListener(TimerEvent.TIMER, checkURLc);
			checkTimer.start();

			return false;
		}		

		function saveUserInfos():void
		{
			var cURL:URLRequest = new URLRequest("http://spuritem.com/iom/savedata.php");
			checkLoader.dataFormat = URLLoaderDataFormat.TEXT;
			checkLoader.addEventListener(Event.COMPLETE, handleResults);
			cURL.method = URLRequestMethod.POST;
			var vari:URLVariables = new URLVariables();
			var edu = g_var.retrundVal('edu');
			var tedu = "No Education";
			if(edu=="edu_5") tedu = "Secondary Education";
			if(edu=="edu_hs") tedu = "Higher Education";
			var nam:String = g_var.retrundVal('nam');
			var pho:String = g_var.retrundVal('phn');
			var dis:String = g_var.retrundVal('dit');
			var sx = g_var.retrundVal('gen');
			var cun = g_var.retrundVal('cun');
			var sex = 'Female';
			if(sx=='M') sex = 'Male';
			
			vari.name = nam;
			vari.phone = pho;
			vari.division = divi[dis];
			vari.educat = tedu;
			vari.cuntry = cunt[cun];
			vari.sex = sex;
			cURL.data = vari;
			if(nam!='' && pho!='') {
				checkLoader.load(cURL);
				//trace("Hello world it may saved");
			}
			//else
				//trace("not saved");
		}		

		function checkURLc(e:TimerEvent):void
		{
			var cURL:URLRequest = new URLRequest("http://spuritem.com/iom/testcon.php");
			checkLoader.dataFormat = URLLoaderDataFormat.TEXT;
			checkLoader.addEventListener(Event.COMPLETE, setUserData);
			checkLoader.load(cURL)		
		}
		function setUserData(evt:Event):void
		{
			var response:String = evt.target.data as String;
			if (response) connected = true;
			else connected = false;
			//trace("response: "+response);
		}
		function handleResults(evt:Event):void
		{
			var response:String = evt.target.data as String;
			//trace("response: "+response);
		}

		function onIOError(e:IOErrorEvent):void
		{
		  //down
		}
	}	
}
