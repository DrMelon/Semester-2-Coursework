package  
{
	import flash.media.Sound;
	/**
	 * ...
	 * @author ...
	 */
	public class SoundManager //The ImageManager handles all the bitmap data for image files in use by GameObjects.
	{
		
		private var soundDataList:Array = new Array(); // Holds the Bitmap Data Loaded from the Embedded Images
		private var soundKeywords:Array = new Array();  // Used to hold the keywords that other classes can use to load images. Usually the same as the image's filename.
		
		// Embedding Images - Thankfully this only happens once.
		// Note - Most of these images will be spritesheets. Animated GameObjects also have a reference to an AnimationManager where all the animations
		// from the spritesheets are defined. The AnimationManager manages frame timings etc.
		
		// Weapon Firing Noises
		[Embed(source="../snd/mp3/fire_mustard.mp3")]
		private var snd_Mustard:Class;
		
		
		
		
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
			
			
			
			
		}
		
		public function PlaySoundByKeyword(keyword:String):void
		{
			if (soundKeywords.indexOf(keyword) != -1)
			{
				
				soundDataList[soundKeywords.indexOf(keyword)].play();
			}
			else
			{
				trace("Couldn't find '" + keyword + "'!");
				
			}
			
		}
		
	}

}