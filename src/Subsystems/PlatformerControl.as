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
		
		
		public var myCollisions:HasCollision;
		public var canJump:Boolean = false;
		
		public function PlatformerControl(_parent:GameObject, _collisions:HasCollision) 
		{
			super(_parent);
			myCollisions = _collisions;
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
			if (e.keyCode == Keyboard.LEFT && !myCollisions.isCollidingLeft)
			{
				parentObject.xAccel = -1.2;
				if (parentObject.flipped == false)
				{
					parentObject.flipped = true;
					parentObject.myBitmap.scaleX = -1;
					parentObject.myBitmap.x += 16;
				}
			}
			// Going Right
			if (e.keyCode == Keyboard.RIGHT && !myCollisions.isCollidingRight)
			{
				parentObject.xAccel = 1.2;
				if (parentObject.flipped == true)
				{
					parentObject.flipped = false;
					parentObject.myBitmap.scaleX = 1;
					parentObject.myBitmap.x -= 16;
				}
			}
			// Jump!
			if (e.keyCode == Keyboard.Z && canJump == true)
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
		
		override public function Update(e:Event = null):void
		{
			if (myCollisions.isCollidingBottom)
			{
				canJump = true;
			}
			else
			{
				canJump = false;
			}
		}
		
		
		
	}

}