package Subsystems 
{
	
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author ...
	 */
	public class KeyboardListener extends ObjectSubsystem 
	{
		// The keyboard listener provides keyboard functionality for subsystems.
		
		public function KeyboardListener(_parent:GameObject) 
		{
			super(_parent);
		}
		
		override public function Init():void
		{
			// Add event listeners
			parentObject.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			parentObject.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			
		}
		
		public function onKeyDown(e:KeyboardEvent):void
		{
			// Perform keypress logic here.
		}
		
		public function onKeyUp(e:KeyboardEvent):void
		{
			// Perform keypress logic here.
		}		
		
	}

}