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
			
			if (Math.abs(parentObject.ySpeed+parentObject.yAccel) < Math.abs(parentObject.maxYSpeed))
			{
				parentObject.ySpeed += parentObject.yAccel;
			}
			
			if (parentObject.yAccel == 0)
			{
				parentObject.ySpeed -= parentObject.drag * parentObject.ySpeed;
			}
			
			
			myCollisions.CheckCollision();
			
			//If Colliding on Left side, and speed is < 0...
			if (myCollisions.isCollidingLeft && parentObject.xSpeed < 0)
			{
				parentObject.xSpeed = myCollisions.collidePointLeftDistance; 
				// Clipping the speed by the distance between us and the object.
				// To get the distance between us and the object, I need to get two points on the target object
				// on the top edge, the top left and top right 
				// i then project the current speed vector onto the line containing those points
				// then i measure the distance from the collisionpoint to the point on the line:
				
				//        x-O-x
				//          |
				//          |
				//   x------o-------------------x
			}
			
			//On right...
			if (myCollisions.isCollidingRight && parentObject.xSpeed > 0)
			{
				parentObject.xSpeed = myCollisions.collidePointRightDistance; 
			}
			
			// etc			
			if (myCollisions.isCollidingTop && parentObject.ySpeed < 0)
			{
				parentObject.ySpeed = myCollisions.collidePointTopDistance; 
			}

			if (myCollisions.isCollidingBottom)
			{
				parentObject.ySpeed += myCollisions.collidePointBottomDistance; 
			}
			
			
			// Update position
			parentObject.x += parentObject.xSpeed;
			parentObject.y += parentObject.ySpeed;
			
		}
		
	}

}