package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class ScrollingBackground extends Sprite 
	{
		[Embed(source = "../img/Tablecloth.png")]
		private var gfx_Background1:Class;
		
		[Embed(source = "../img/TableGap.png")]
		private var gfx_Background2:Class;
		
		public var scrollingSpeed:Number = 1; // This is public so that we can use turbo powerups to scroll faster.
		
		private var _background1:Bitmap;
		private var _background2:Bitmap;
		private var _background3:Bitmap;
		
		public function ScrollingBackground() 
		{
			// The Scrolling Background class loads the background images I have and scrolls them vertically.
			_background1 = new gfx_Background1();
			_background2 = new gfx_Background1();
			_background3 = new gfx_Background2();
			
			addChild(_background1);
			addChild(_background2);
			addChild(_background3);
			
			//Set up positions.
			_background1.y = 0;
			_background2.y = _background1.height + _background1.y;
			_background3.y = _background2.height + _background2.y;
			
			
			
		}
		
		public function Update():void
		{
			_background1.y += scrollingSpeed;
			_background2.y += scrollingSpeed;
			_background3.y += scrollingSpeed;
			
			if (_background1.y > 240)
			{
				_background1.y = _background2.y - _background1.height;
			}
			
			if (_background2.y > 240)
			{
				_background2.y = _background3.y - _background2.height;
			}
			
			if (_background3.y > 240)
			{
				_background3.y = _background1.y - _background3.height;
			}
		}
		
	}

}