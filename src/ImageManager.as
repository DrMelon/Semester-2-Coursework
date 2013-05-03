package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	/**
	 * ...
	 * @author ...
	 */
	public class ImageManager //The ImageManager handles all the bitmap data for image files in use by GameObjects.
	{
		
		private var bitmapDataList:Array = new Array(); // Holds the Bitmap Data Loaded from the Embedded Images
		private var imageKeywords:Array = new Array();  // Used to hold the keywords that other classes can use to load images. Usually the same as the image's filename.
		
		// Embedding Images - Thankfully this only happens once.
		// Note - Most of these images will be spritesheets. Animated GameObjects also have a reference to an AnimationManager where all the animations
		// from the spritesheets are defined. The AnimationManager manages frame timings etc.
		
		// Player's Spaceship
		[Embed(source = "../img/Ship.png")]
		private var gfx_Ship:Class;
		
		// Player's Bullets
		[Embed(source = "../img/MustardSplot.png")]
		private var gfx_Mustard:Class;
		[Embed(source = "../img/KetchupSplot.png")]
		private var gfx_Ketchup:Class;		
		
		// Powerups
		[Embed(source = "../img/ChilliPowerupIcon.png")]
		private var gfx_ChilliPowerup:Class;
		[Embed(source = "../img/HeartPowerup.png")]
		private var gfx_HeartPowerup:Class;
		[Embed(source = "../img/KetchupPowerup.png")]
		private var gfx_KetchupPowerup:Class;
		[Embed(source = "../img/MultiplierPowerup.png")]
		private var gfx_MultiplierPowerup:Class;
		[Embed(source = "../img/OnionRingPowerup.png")]
		private var gfx_OnionRingPowerup:Class;
		[Embed(source="../img/SpeedPowerup.png")]
		private var gfx_SpeedPowerup:Class;
	
		// Enemies
		[Embed(source = "../img/Carrot.png")]
		private var gfx_CarrotEnemy:Class;
		[Embed(source = "../img/Lettuce.png")]
		private var gfx_LettuceEnemy:Class;
		
		
		public function ImageManager() 
		{
			Load();
		}
		
		public function Load():void
		{
			// Fill arrays with images and keywords.
			var bmpDat:BitmapData;
			
			bmpDat = (new gfx_Ship() as Bitmap).bitmapData; // Add Image Data
			
			// Player's Ship
			bitmapDataList.push(bmpDat); // Put Image Data onto List
			imageKeywords.push("Ship.png"); // Put Keyword in List
			
			//Bullets
			bmpDat = (new gfx_Mustard() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat)
			imageKeywords.push("MustardSplot.png");
			
			// Powerups
			
			// Enemies
			bmpDat = (new gfx_CarrotEnemy() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("Carrot.png");
			

			
		}
		
		public function FetchBitmapDataByKeyword(keyword:String):BitmapData
		{
			if (imageKeywords.indexOf(keyword) != -1)
			{
				return bitmapDataList[imageKeywords.indexOf(keyword)];
			}
			else
			{
				trace("Couldn't find '" + keyword + "'!");
				return null as BitmapData
			}
			
		}
		
	}

}