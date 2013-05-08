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
			
			
		}
		
	}

}