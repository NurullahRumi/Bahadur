package {
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.utils.Timer;
	import flash.media.SoundTransform;

	public class sound_controll {
		var bg_snd: Sound;
		var am_snd: Sound;
		var soundChannel: SoundChannel;
		var soundChannel1: SoundChannel;
		var vad1:SoundTransform = new SoundTransform();
		var vad2:SoundTransform = new SoundTransform();
		var repi: Timer;
		var bkisp: Boolean = false;
		private static var isOkayToCreate: Boolean = false;
		var cnum:String = null;
		
		var snd_ip:Boolean = false;
		var audCnl:SoundChannel;

		public function sound_controll(num:String=null) {
			// constructor code
			cnum = num;
			initateTheObject();
		}
		/*
		public function stopTheInfoSound() {			
			if(snd_ip) {
				audCnl.stop();
				audCnl.removeEventListener(Event.SOUND_COMPLETE, handleSoundComplete);
				audCnl = null;
				snd_ip = false;
			}
		}*/
		public function playSpecificSound(str:String) {
			var sund:Sound;
			if(str=="bmet") sund = new snd_bmet();
			if(str=="ngo") sund = new snd_ngo();
			if(str=="uic") sund = new snd_uic();
			if(str=="demo") sund = new snd_demo();
			if(str=="migr") sund = new migration_pep();
			if(str=="sill") sund = new skill_voic();
			if(str=="pass") sund = new pass_voic();
			if(str=="d_4") sund = new dal_4();
			if(str=="d_5") sund = new dal_5();
			if(str=="d_6") sund = new dal_6();
			if(str=="d_7") sund = new dal_7();
			audCnl = sund.play();
			snd_ip = true;
			audCnl.addEventListener(Event.SOUND_COMPLETE, handleSoundComplete);
		}
		function handleSoundComplete(ev:Event) {
			snd_ip = false;
		}
		function stopAudCnlOnBack() {			
			if(snd_ip) {
				audCnl.stop();
				audCnl.removeEventListener(Event.SOUND_COMPLETE, handleSoundComplete);
				audCnl = null;
				snd_ip = false;
			}
		}
		function allBackGroundSound() {
			
		}
		public function initateTheObject() {
			if(cnum==null)
				bg_snd  = new backS();
			else if(cnum=="1")
				bg_snd = new vill();
			else if(cnum=="2")
				bg_snd = null;
			//am_snd = new vill();
			//trace("i am here");
			//repi = new Timer(144000);
			//repi.addEventListener(TimerEvent.TIMER, completeHandler);
			//repi.start();
			bkisp = true;
			if(bg_snd!=null) {
				playMusic();
				NativeApplication.nativeApplication.addEventListener(Event.DEACTIVATE, handleDeactivate, false, 0, true);
				NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE, handleActivate, false, 0, false);
			}
		}
		function playMusic() {			
			//trace("hello its sound");
			if (soundChannel != null) soundChannel.stop();
			if (soundChannel1 != null) soundChannel1.stop();
			soundChannel = null;
			soundChannel = bg_snd.play();
			soundChannel.addEventListener(Event.SOUND_COMPLETE, completeHandler);
			//soundChannel1 = null;
			//soundChannel1 = am_snd.play();
			vad1.volume = 0.75;
			soundChannel.soundTransform = vad1;
			vad2.volume = 1.0;
			//soundChannel1.soundTransform = vad2;
		}
		
		function incVo(vad:SoundTransform) {
			if(vad.volume<1.0) vad.volume += 0.1;
		}
		
		function decVo(vad:SoundTransform) {
			if(vad.volume>0.0) vad.volume  -= 0.1;
		}
		function mute_bg_sund() {
			vad1.volume = 0.15;
			soundChannel.soundTransform = vad1;
		}
		function unmute_bg_sund() {
			vad1.volume = 0.75;
			soundChannel.soundTransform = vad1;
		}
		function mute_vo_sund() {
			vad1.volume = 0.15;
			if (audCnl != null) audCnl.soundTransform = vad1;
		}
		function unmute_vo_sund() {
			vad1.volume = 1.0;
			if (audCnl != null) audCnl.soundTransform = vad1;
		}


		function handleActivate(event: Event): void {
			//the app is now losing focus			
			//playMusic();
			bkisp = true;
		}
		function handleDeactivate(e: Event=null): void {
			//the app is now losing focus
			soundChannel.stop();
			//soundChannel1.stop();
			soundChannel.removeEventListener(Event.SOUND_COMPLETE, completeHandler);
			//soundChannel = null;
			//soundChannel1 = null;
			bkisp = false;
		}
		function completeHandler(e: Event) {
			playMusic();
			bkisp = true;
		}
		public function pause() {
			if (soundChannel != null) soundChannel.stop();
			if (audCnl != null) audCnl.stop();
			//soundChannel1.stop();
			bkisp = false;
		}
		function resume() {
			if (!bkisp) {
				playMusic();
				bkisp = true;
			}
		}
	}

}