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
		
		
		public function InitAnims(g_ImageManager:ImageManager):void
		{
			// Init all Animations
			explosion_small.push(g_ImageManager.FetchBitmapDataByKeyword("explosion_small_1.png"));
			explosion_small.push(g_ImageManager.FetchBitmapDataByKeyword("explosion_small_2.png"));
			explosion_small.push(g_ImageManager.FetchBitmapDataByKeyword("explosion_small_3.png"));
			explosion_small.push(g_ImageManager.FetchBitmapDataByKeyword("explosion_small_4.png"));
			explosion_small.push(g_ImageManager.FetchBitmapDataByKeyword("explosion_small_5.png"));
			explosion_small.push(g_ImageManager.FetchBitmapDataByKeyword("explosion_small_6.png"));
			explosion_small.push(g_ImageManager.FetchBitmapDataByKeyword("explosion_small_7.png"));
			explosion_small.push(g_ImageManager.FetchBitmapDataByKeyword("explosion_small_8.png"));
			explosion_small.push(g_ImageManager.FetchBitmapDataByKeyword("explosion_small_9.png"));
			
			
			
		}
		
	}

}