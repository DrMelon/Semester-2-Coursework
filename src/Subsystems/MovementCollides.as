package Subsystems 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author ...
	 */
	public class MovementCollides extends ObjectSubsystem 
	{
		public var myCollisions:HasCollision;
		
		public function MovementCollides(_parent:GameObject, _collisions:HasCollision) 
		{
			super(_parent);
			myCollisions = _collisions;
		}
		
		override public function Update(e:Event = null):void
		{
			
			// Update speed by accelleration
			if (Math.abs(parentObject.xSpeed+parentObject.xAccel) < Math.abs(parentObject.maxXSpeed))
			{
				parentObject.xSpeed += parentObject.xAccel;
			}
			
			// Drag
			if (parentObject.xAccel == 0)
			{
				parentObject.xSpeed -= parentObject.drag * parentObject.xSpeed;
			}
			
			//If Colliding on Left side, and speed is < 0...
			if (myCollisions.isCollidingLeft && parentObject.xSpeed < 0)
			{
				parentObject.xSpeed = 0;
			}
			
			//On right...
			if (myCollisions.isCollidingRight && parentObject.xSpeed > 0)
			{
				parentObject.xSpeed = 0;
			}
			
			// Update position
			parentObject.x += parentObject.xSpeed;

			
			
			// On the Y Axis, the same follows:
			
			if (Math.abs(parentObject.ySpeed+parentObject.yAccel) < Math.abs(parentObject.maxYSpeed))
			{
				parentObject.ySpeed += parentObject.yAccel;
			}
			
			if (parentObject.yAccel == 0)
			{
				parentObject.ySpeed -= parentObject.drag * parentObject.ySpeed;
			}			
			
			if (myCollisions.isCollidingTop && parentObject.ySpeed < 0)
			{
				parentObject.ySpeed = 0;
			}

			if (myCollisions.isCollidingBottom && parentObject.ySpeed > 0)
			{
				parentObject.ySpeed = 0;
			}
			
			parentObject.y += parentObject.ySpeed;
			
		}
		
	}

}