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
		
		// Instructions & intro card
		[Embed(source = "../img/Briefing.png")]
		private var gfx_Briefing:Class;
		[Embed(source = "../img/controls.png")]
		private var gfx_Controls:Class;
		[Embed(source = "../img/Warning.png")]
		private var gfx_Warning:Class;
		
		
		// Player's Spaceship
		[Embed(source = "../img/Ship.png")]
		private var gfx_Ship:Class;
		
		// Player's Bullets
		[Embed(source = "../img/MustardSplot.png")]
		private var gfx_Mustard:Class;
		[Embed(source = "../img/KetchupSplot.png")]
		private var gfx_Ketchup:Class;		
		[Embed(source = "../img/FlameParticle.png")]
		private var gfx_FlameParticle:Class;
		[Embed(source = "../img/PumpkinSeed.png")]
		private var gfx_PumpkinSeed:Class;
		[Embed(source = "../img/danmaku.png")]
		private var gfx_Danmaku:Class;
		
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
		[Embed(source = "../img/Broccoli.png")]
		private var gfx_BroccoliEnemy:Class;
		[Embed(source = "../img/PumpkinShip.png")]
		private var gfx_PumpkinEnemy:Class;
		[Embed(source = "../img/Pizza.png")]
		private var gfx_Pizza:Class;
		
		// Animations
		
		// explosion_small
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
		
		// explosion_16x16
		[Embed(source="../img/animated/explosion_16x16/explosion_16x16_1.png")]
		private var gfx_Explosion16x16_1:Class;
		[Embed(source="../img/animated/explosion_16x16/explosion_16x16_2.png")]
		private var gfx_Explosion16x16_2:Class;
		[Embed(source="../img/animated/explosion_16x16/explosion_16x16_3.png")]
		private var gfx_Explosion16x16_3:Class;
		[Embed(source="../img/animated/explosion_16x16/explosion_16x16_4.png")]
		private var gfx_Explosion16x16_4:Class;
		[Embed(source="../img/animated/explosion_16x16/explosion_16x16_5.png")]
		private var gfx_Explosion16x16_5:Class;
		[Embed(source="../img/animated/explosion_16x16/explosion_16x16_6.png")]
		private var gfx_Explosion16x16_6:Class;
		[Embed(source="../img/animated/explosion_16x16/explosion_16x16_7.png")]
		private var gfx_Explosion16x16_7:Class;
		[Embed(source="../img/animated/explosion_16x16/explosion_16x16_8.png")]
		private var gfx_Explosion16x16_8:Class;
		[Embed(source="../img/animated/explosion_16x16/explosion_16x16_9.png")]
		private var gfx_Explosion16x16_9:Class;
		[Embed(source="../img/animated/explosion_16x16/explosion_16x16_10.png")]
		private var gfx_Explosion16x16_10:Class;
		[Embed(source="../img/animated/explosion_16x16/explosion_16x16_11.png")]
		private var gfx_Explosion16x16_11:Class;
		[Embed(source="../img/animated/explosion_16x16/explosion_16x16_12.png")]
		private var gfx_Explosion16x16_12:Class;
		
		//BigExplosion
		[Embed(source = "../img/bigexplosion/bigexplosion (1).gif")]
		private var gfx_BigExplosion_1:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (2).gif")]
		private var gfx_BigExplosion_2:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (3).gif")]
		private var gfx_BigExplosion_3:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (4).gif")]
		private var gfx_BigExplosion_4:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (5).gif")]
		private var gfx_BigExplosion_5:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (6).gif")]
		private var gfx_BigExplosion_6:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (7).gif")]
		private var gfx_BigExplosion_7:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (8).gif")]
		private var gfx_BigExplosion_8:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (9).gif")]
		private var gfx_BigExplosion_9:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (10).gif")]
		private var gfx_BigExplosion_10:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (11).gif")]
		private var gfx_BigExplosion_11:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (12).gif")]
		private var gfx_BigExplosion_12:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (13).gif")]
		private var gfx_BigExplosion_13:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (14).gif")]
		private var gfx_BigExplosion_14:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (15).gif")]
		private var gfx_BigExplosion_15:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (16).gif")]
		private var gfx_BigExplosion_16:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (17).gif")]
		private var gfx_BigExplosion_17:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (18).gif")]
		private var gfx_BigExplosion_18:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (19).gif")]
		private var gfx_BigExplosion_19:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (20).gif")]
		private var gfx_BigExplosion_20:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (21).gif")]
		private var gfx_BigExplosion_21:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (22).gif")]
		private var gfx_BigExplosion_22:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (23).gif")]
		private var gfx_BigExplosion_23:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (24).gif")]
		private var gfx_BigExplosion_24:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (25).gif")]
		private var gfx_BigExplosion_25:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (26).gif")]
		private var gfx_BigExplosion_26:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (27).gif")]
		private var gfx_BigExplosion_27:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (28).gif")]
		private var gfx_BigExplosion_28:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (29).gif")]
		private var gfx_BigExplosion_29:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (30).gif")]
		private var gfx_BigExplosion_30:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (31).gif")]
		private var gfx_BigExplosion_31:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (32).gif")]
		private var gfx_BigExplosion_32:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (33).gif")]
		private var gfx_BigExplosion_33:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (34).gif")]
		private var gfx_BigExplosion_34:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (35).gif")]
		private var gfx_BigExplosion_35:Class;
		[Embed(source = "../img/bigexplosion/bigexplosion (36).gif")]
		private var gfx_BigExplosion_36:Class;

		
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
			
			bmpDat = (new gfx_Briefing() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("Briefing.png");
			bmpDat = (new gfx_Controls() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("Controls.png");
			bmpDat = (new gfx_Warning() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("Warning.png");
			
			//Bullets
			bmpDat = (new gfx_Mustard() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("MustardSplot.png");
			bmpDat = (new gfx_Ketchup() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("KetchupSplot.png");			
			bmpDat = (new gfx_FlameParticle() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("FlameParticle.png");						
			bmpDat = (new gfx_PumpkinSeed() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("PumpkinSeed.png");	
			bmpDat = (new gfx_Danmaku() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("Danmaku.png");
			
			
			// Powerups
			bmpDat = (new gfx_KetchupPowerup() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("KetchupPowerup.png");
			
			bmpDat = (new gfx_ChilliPowerup() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("ChilliPowerup.png");
			
			bmpDat = (new gfx_HeartPowerup() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("HeartPowerup.png");
			
			
			
			// Enemies
			bmpDat = (new gfx_CarrotEnemy() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("Carrot.png");
			bmpDat = (new gfx_LettuceEnemy() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("Lettuce.png");
			bmpDat = (new gfx_PumpkinEnemy() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("PumpkinShip.png");
			
			bmpDat = (new gfx_Pizza() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("Pizza.png");
			
			// Animations
			
			//explosion_small
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
			
			//explosion_16x16
			bmpDat = (new gfx_Explosion16x16_1() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("explosion_16x16_1.png");			
			bmpDat = (new gfx_Explosion16x16_2() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("explosion_16x16_2.png");			
			bmpDat = (new gfx_Explosion16x16_3() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("explosion_16x16_3.png");			
			bmpDat = (new gfx_Explosion16x16_4() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("explosion_16x16_4.png");
			bmpDat = (new gfx_Explosion16x16_5() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("explosion_16x16_5.png");
			bmpDat = (new gfx_Explosion16x16_6() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("explosion_16x16_6.png");
			bmpDat = (new gfx_Explosion16x16_7() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("explosion_16x16_7.png");
			bmpDat = (new gfx_Explosion16x16_8() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("explosion_16x16_8.png");
			bmpDat = (new gfx_Explosion16x16_9() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("explosion_16x16_9.png");	
			bmpDat = (new gfx_Explosion16x16_10() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("explosion_16x16_10.png");	
			bmpDat = (new gfx_Explosion16x16_11() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("explosion_16x16_11.png");	
			bmpDat = (new gfx_Explosion16x16_12() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("explosion_16x16_12.png");	
			
			// Big Explosion
			bmpDat = (new gfx_BigExplosion_1() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (1).gif");

			bmpDat = (new gfx_BigExplosion_2() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (2).gif");

			bmpDat = (new gfx_BigExplosion_3() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (3).gif");

			bmpDat = (new gfx_BigExplosion_4() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (4).gif");

			bmpDat = (new gfx_BigExplosion_5() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (5).gif");

			bmpDat = (new gfx_BigExplosion_6() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (6).gif");

			bmpDat = (new gfx_BigExplosion_7() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (7).gif");

			bmpDat = (new gfx_BigExplosion_8() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (8).gif");

			bmpDat = (new gfx_BigExplosion_9() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (9).gif");

			bmpDat = (new gfx_BigExplosion_10() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (10).gif");

			bmpDat = (new gfx_BigExplosion_11() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (11).gif");

			bmpDat = (new gfx_BigExplosion_12() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (12).gif");

			bmpDat = (new gfx_BigExplosion_13() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (13).gif");

			bmpDat = (new gfx_BigExplosion_14() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (14).gif");

			bmpDat = (new gfx_BigExplosion_15() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (15).gif");

			bmpDat = (new gfx_BigExplosion_16() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (16).gif");

			bmpDat = (new gfx_BigExplosion_17() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (17).gif");

			bmpDat = (new gfx_BigExplosion_18() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (18).gif");

			bmpDat = (new gfx_BigExplosion_19() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (19).gif");

			bmpDat = (new gfx_BigExplosion_20() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (20).gif");

			bmpDat = (new gfx_BigExplosion_21() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (21).gif");

			bmpDat = (new gfx_BigExplosion_22() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (22).gif");

			bmpDat = (new gfx_BigExplosion_23() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (23).gif");

			bmpDat = (new gfx_BigExplosion_24() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (24).gif");

			bmpDat = (new gfx_BigExplosion_25() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (25).gif");

			bmpDat = (new gfx_BigExplosion_26() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (26).gif");

			bmpDat = (new gfx_BigExplosion_27() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (27).gif");

			bmpDat = (new gfx_BigExplosion_28() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (28).gif");

			bmpDat = (new gfx_BigExplosion_29() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (29).gif");

			bmpDat = (new gfx_BigExplosion_30() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (30).gif");

			bmpDat = (new gfx_BigExplosion_31() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (31).gif");

			bmpDat = (new gfx_BigExplosion_32() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (32).gif");

			bmpDat = (new gfx_BigExplosion_33() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (33).gif");

			bmpDat = (new gfx_BigExplosion_34() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (34).gif");

			bmpDat = (new gfx_BigExplosion_35() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (35).gif");

			bmpDat = (new gfx_BigExplosion_36() as Bitmap).bitmapData;
			bitmapDataList.push(bmpDat);
			imageKeywords.push("bigexplosion (36).gif");
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