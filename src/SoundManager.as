package  
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	/**
	 * ...
	 * @author ...
	 */
	public class SoundManager //The ImageManager handles all the bitmap data for image files in use by GameObjects.
	{
		
		private var soundDataList:Array = new Array(); // Holds the Bitmap Data Loaded from the Embedded Images
		private var soundKeywords:Array = new Array();  // Used to hold the keywords that other classes can use to load images. Usually the same as the image's filename.
		private var soundTransform:SoundTransform = new SoundTransform();
		private var soundChannel:SoundChannel = new SoundChannel();
		private var musicChannel:SoundChannel = new SoundChannel();
		// Embedding Images - Thankfully this only happens once.
		// Note - Most of these images will be spritesheets. Animated GameObjects also have a reference to an AnimationManager where all the animations
		// from the spritesheets are defined. The AnimationManager manages frame timings etc.
		
		// Weapon Firing Noises
		[Embed(source="../snd/mp3/fire_mustard.mp3")]
		private var snd_Mustard:Class;
		[Embed(source = "../snd/mp3/fire_ketchup.mp3")]
		private var snd_Ketchup:Class;
		// Regen Ammo Noise
		[Embed(source = "../snd/mp3/regen_ammo.mp3")]
		private var snd_Regen:Class;
		
		// Powerups
		[Embed(source = "../snd/mp3/pickup_powerup.mp3")]
		private var snd_Powerup:Class;
		
		// Shooting Sounds and Enemy Death Sounds
		[Embed(source = "../snd/mp3/shot_connect.mp3")]
		private var snd_ShotConnect:Class;
		
		[Embed(source="../snd/mp3/enemyship_blowup.mp3")]
		private var snd_EnemyDeath:Class;
		
		
		// Music
		[Embed(source = "../snd/mp3/music.mp3")]
		private var snd_Music:Class;
		
		
		public function SoundManager() 
		{
			Load();
		}
		
		public function Load():void
		{
			// Fill arrays with sounds and keywords.
			var sndDat:Sound;
			
			sndDat = (new snd_Mustard() as Sound); // Add Sound Data
			soundDataList.push(sndDat);
			soundKeywords.push("fire_mustard.mp3");
			
			sndDat = (new snd_Ketchup() as Sound); // Add Sound Data
			soundDataList.push(sndDat);
			soundKeywords.push("fire_ketchup.mp3");
			
			sndDat = (new snd_Regen() as Sound); // Add Sound Data
			soundDataList.push(sndDat);
			soundKeywords.push("regen_ammo.mp3");
			
			sndDat = (new snd_Powerup() as Sound); 
			soundDataList.push(sndDat);
			soundKeywords.push("pickup_powerup.mp3");
			
			sndDat = (new snd_ShotConnect() as Sound); 
			soundDataList.push(sndDat);
			soundKeywords.push("shot_connect.mp3");
			
			sndDat = (new snd_EnemyDeath() as Sound); 
			soundDataList.push(sndDat);
			soundKeywords.push("enemyship_blowup.mp3");			
			
			sndDat = (new snd_Music() as Sound);
			soundDataList.push(sndDat);
			soundKeywords.push("music.mp3");
			
			soundChannel.soundTransform = soundTransform;
		}
		
		public function PlaySoundByKeyword(keyword:String):void
		{
			if (soundKeywords.indexOf(keyword) != -1)
			{
				if (keyword != "music.mp3")
				{
					soundTransform.volume = 0.2;
					trace("Quieter.");
					soundChannel = soundDataList[soundKeywords.indexOf(keyword)].play();
					if (soundChannel != null)
					{
						soundChannel.soundTransform = soundTransform;
					}
				}
				else
				{
					//musicChannel = soundDataList[soundKeywords.indexOf(keyword)].play();
				}
			}
			else
			{
				trace("Couldn't find '" + keyword + "'!");
				
			}
			
		}
		
	}

}