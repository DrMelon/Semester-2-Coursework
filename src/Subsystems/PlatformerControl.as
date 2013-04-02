package Subsystems 
{
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author J.Brown
	 */
	public class PlatformerControl extends KeyboardListener
	{
		// Given that this involved keyboard control, it's a subclass of the keyboard listener.
		// Allows the player to push keys and make the object move around the screen.
		
		
		// NOTE TO SELF: For proper platforming control, this must be given a reference to a CollisionManager!
		
		
		public function PlatformerControl(_parent:GameObject) 
		{
			super(_parent);
		}
		
		override public function Init():void
		{
			// Add event listeners
			parentObject.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			parentObject.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			parentObject.maxXSpeed = 3.5;
		}
		
		override public function onKeyDown(e:KeyboardEvent):void
		{
			// Going Left
			if (e.keyCode == Keyboard.LEFT)
				parentObject.xAccel = -1.2;
			// Going Right
			if (e.keyCode == Keyboard.RIGHT)
				parentObject.xAccel = 1.2;
			// Jump!
			if (e.keyCode == Keyboard.Z)
			{
				parentObject.ySpeed -= 15;
			}
		}
		
		override public function onKeyUp(e:KeyboardEvent):void
		{
			// Not going Left
			if (e.keyCode == Keyboard.LEFT)
				parentObject.xAccel = 0;
			// Not going Right
			if (e.keyCode == Keyboard.RIGHT)
				parentObject.xAccel = 0;
		}
		
		
		
	}

}