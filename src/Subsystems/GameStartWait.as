package Subsystems 
{
	import flash.display.Stage;
	import flash.ui.Keyboard;
	
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author ...
	 */
	public class GameStartWait extends ObjectSubsystem 
	{
		// The keyboard listener provides keyboard functionality for subsystems.
		private var myStage:Stage;
		public function GameStartWait(_parent:GameObject, theStage:Stage) 
		{
			super(_parent);
			myStage = theStage;
		}
		
		
		override public function Init():void
		{
			// Add event listeners
			myStage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			myStage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			
		}
		
		public function onKeyDown(e:KeyboardEvent):void
		{
			// Perform keypress logic here.
			if (e.keyCode == Keyboard.Z)
			{
				Globals.vars.beginGame = true;
			}
		}
		
		public function onKeyUp(e:KeyboardEvent):void
		{
			// Perform keypress logic here.
		}		
		
	}

}