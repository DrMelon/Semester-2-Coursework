package Defines 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author ...
	 */
	public class AnimDef extends Sprite
	{
		// Animdef basically just initializes a bunch of arrays of bitmapdata.
		
		public var explosion_small:Array = new Array();
		public var explosion_16x16:Array = new Array();
		public var bigexplosion:Array = new Array();
		
		
		public function InitAnims():void
		{
			// Init all Animations
			explosion_small.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("explosion_small_1.png"));
			explosion_small.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("explosion_small_2.png"));
			explosion_small.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("explosion_small_3.png"));
			explosion_small.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("explosion_small_4.png"));
			explosion_small.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("explosion_small_5.png"));
			explosion_small.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("explosion_small_6.png"));
			explosion_small.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("explosion_small_7.png"));
			explosion_small.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("explosion_small_8.png"));
			explosion_small.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("explosion_small_9.png"));
			
			
			explosion_16x16.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("explosion_16x16_1.png"));
			explosion_16x16.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("explosion_16x16_2.png"));
			explosion_16x16.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("explosion_16x16_3.png"));
			explosion_16x16.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("explosion_16x16_4.png"));
			explosion_16x16.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("explosion_16x16_5.png"));
			explosion_16x16.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("explosion_16x16_6.png"));
			explosion_16x16.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("explosion_16x16_7.png"));
			explosion_16x16.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("explosion_16x16_8.png"));
			explosion_16x16.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("explosion_16x16_9.png"));
			explosion_16x16.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("explosion_16x16_10.png"));
			explosion_16x16.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("explosion_16x16_11.png"));
			explosion_16x16.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("explosion_16x16_12.png"));
			
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (1).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (2).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (3).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (4).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (5).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (6).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (7).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (8).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (9).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (10).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (11).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (12).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (13).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (14).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (15).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (16).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (17).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (18).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (19).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (20).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (21).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (22).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (23).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (24).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (25).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (26).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (27).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (28).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (29).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (30).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (31).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (32).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (33).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (34).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (35).gif"));
			bigexplosion.push(Globals.vars.g_ImageManager.FetchBitmapDataByKeyword("bigexplosion (36).gif"));
		}
		
	}

}