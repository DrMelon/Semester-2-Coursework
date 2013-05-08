package Subsystems 
{
	import flash.display.BitmapData;
	import flash.events.Event;
	/**
	 * ...
	 * @author J. Brown
	 */
	public class ShowAnimation extends ObjectSubsystem 
	{
		// The ShowAnimation class takes an array of BitmapDatas and then on update cycles through them at the given rate.
		public var AnimFrames:Array;
		public var FrameRate:Number;
		public var CurrentFrame:Number = 0;
		public var Looping:Boolean;
		public var FrameCounter:Number = 0;
		public function ShowAnimation(_parent:GameObject, _aframes:Array, _rate:Number, _loop:Boolean) 
		{
			super(_parent);
			AnimFrames = _aframes;
			FrameRate = _rate;
			Looping = _loop;
		}
		
		override public function Update(e:Event = null):void
		{
			FrameCounter++;
			parentObject.myBitmap.bitmapData = AnimFrames[CurrentFrame];
			
			if ((FrameCounter % FrameRate) == 0)
			{
				CurrentFrame++;
				if (CurrentFrame > AnimFrames.length - 1)
				{
					if (Looping == true)
					{
						CurrentFrame = 0;
					}
					else
					{
						CurrentFrame = AnimFrames.length - 1;
						for (var i:int = 0; i < parentObject.gameObjects.length; i++)
						{
							if (parentObject.gameObjects[i] == parentObject)
							{
								
								parentObject.y = 500; // move offscreen and kill.
								
								
							}
						}
					}
				}
			}
		}
		
	}

}