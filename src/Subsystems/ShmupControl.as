package Subsystems 
{
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author  J. Brown
	 */
	public class ShmupControl extends KeyboardListener 
	{
		// Given that this involved keyboard control, it's a subclass of the keyboard listener.
		// Allows the player to push keys and fly the ship around.
		public var weaponSlots:Array = new Array;
		
		public function ShmupControl(_parent:GameObject, _weaponSlots:Array) 
		{
			super(_parent);
			weaponSlots = _weaponSlots;
		}
		
		override public function Init():void
		{
			// Add event listeners
			parentObject.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			parentObject.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			
			// Set up player's movement variables
			parentObject.maxXSpeed = 2.5;
			parentObject.maxYSpeed = 2.5;
			
			parentObject.drag = 0.3;
			
		}		
		
		override public function onKeyDown(e:KeyboardEvent):void
		{
			// Going Left
			if (e.keyCode == Keyboard.LEFT )
			{
				parentObject.xAccel = -1.2;
			}
			// Going Right
			if (e.keyCode == Keyboard.RIGHT )
			{
				parentObject.xAccel = 1.2;
			}
			// Going Up
			if (e.keyCode == Keyboard.UP )
			{
				parentObject.yAccel = -0.8;
			}
			// Going Down
			if (e.keyCode == Keyboard.DOWN )
			{
				parentObject.yAccel = 0.8;
			}
			
			
			// Shoot! Needs reference to weapon handler
			if (e.keyCode == Keyboard.Z)
			{
				// FIRE ALL WEAPONS
				for (var i:int = 0; i < weaponSlots.length; i++)
				{
					weaponSlots[i].FireWeapon();
				}
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
			// Not going Up
			if (e.keyCode == Keyboard.UP)
				parentObject.yAccel = 0;
			// Not going Down
			if (e.keyCode == Keyboard.DOWN)
				parentObject.yAccel = 0;				
		}		
		
	}

}