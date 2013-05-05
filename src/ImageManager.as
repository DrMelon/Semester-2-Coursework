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
		
		
		// Animations
		[Embed(source = "../img/animated/explosion_small/explosion_small_1.png")]
		private var gfx_ExplosionSmall1:Class;
		[Embed(source = "../img/animated/explosion_small/explosion_small_2.png")]
		private var gfx_ExplosionSmall2:Class;
		[Embed(source = "../img/animated/explosion_small/explosion_small_3.png")]
		private var gfx_ExplosionSmall3:Class;	
		[Embed(source = "../img/animated/explosion_small/explosion_small_4.png")]
		private var gfx_ExplosionSmall4:Class;	
		[Embed(source = "../img/animated/explosion_small/explosion_small_5.png")]
		private var gfx_ExplosionSmall5:Class;	
		[Embed(source = "../img/animated/explosion_small/explosion_small_6.png")]
		private var gfx_ExplosionSmall6:Class;	
		[Embed(source = "../img/animated/explosion_small/explosion_small_7.png")]
		private var gfx_ExplosionSmall7:Class;	
		[Embed(source = "../img/animated/explosion_small/explosion_small_8.png")]
		private var gfx_ExplosionSmall8:Class;	
		[Embed(source = "../img/animated/explosion_small/explosion_small_9.png")]
		private var gfx_ExplosionSmall9:Class;	
		
		
		
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
			
			
			// Animations
			bmpDat = (new gfx_ExplosionSmall1() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("explosion_small_1.png");
			
			bmpDat = (new gfx_ExplosionSmall2() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("explosion_small_2.png");
			
			bmpDat = (new gfx_ExplosionSmall3() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("explosion_small_3.png");
			
			bmpDat = (new gfx_ExplosionSmall4() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("explosion_small_4.png");
			
			bmpDat = (new gfx_ExplosionSmall5() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("explosion_small_5.png");
			
			bmpDat = (new gfx_ExplosionSmall6() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("explosion_small_6.png");
			
			bmpDat = (new gfx_ExplosionSmall7() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("explosion_small_7.png");
			
			bmpDat = (new gfx_ExplosionSmall8() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("explosion_small_8.png");
			
			bmpDat = (new gfx_ExplosionSmall9() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("explosion_small_9.png");
			
			
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