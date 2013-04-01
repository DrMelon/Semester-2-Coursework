package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author ...
	 */
	public class HUD extends Sprite
	{
		// The HUD exists to hold status bars and score counters.
		private var statusBars:Array;
			
		[Embed(source = "../img/HUD_Background.png")]
		private var gfx_Backdrop:Class;
		
		public function HUD() 
		{
			statusBars = new Array();
			
			
		}
		
		public function AddNewStatusBar(_value:int, _maxValue:int, _barColour:Number):void
		{
			//Add a new status bar to the array.
			
			var thisBar:StatusBar = new StatusBar(_value, _maxValue, _barColour);
			statusBars.push(thisBar);
		}
		
		public function Draw():void
		{
			// Loop through all status bars and draw them.
			var _background:Bitmap = new gfx_Backdrop();	
			addChild(_background);
			
			var offsetX:int = 0;
			var offsetY:int = 0;
			
			for (var i:int = 0; i < statusBars.length; i++)
			{
				statusBars[i].x = 3 + offsetX;
				statusBars[i].y = 3 + offsetY;
				offsetY += 8;
				if ((i+1 % 4) == 0)
				{
					offsetX += 32; //every 3rd bar, move over 32 pixels and reset to top
					offsetY = 0;
				}
				
				addChild(statusBars[i]);
				statusBars[i].Draw();
			}
		}
		
	}

}