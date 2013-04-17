package Subsystems 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author ...
	 */
	public class Movement extends ObjectSubsystem 
	{
		// This subsystem lets a gameobject move based on its speed and acceleration values.
		// Not every moving thing is going to collide with stuff, so this doesn't have collision.
		// There will be, however, a MovementCollides subsystem for that.
		public function Movement(_parent:GameObject, _collisions:HasCollision) 
		{
			super(_parent);
			
		}
		
		override public function Update(e:Event = null):void
		{
			// Update speed and position
			if (Math.abs(parentObject.xSpeed+parentObject.xAccel) < Math.abs(parentObject.maxXSpeed))
			{
				parentObject.xSpeed += parentObject.xAccel;
			}
			if (Math.abs(parentObject.ySpeed+parentObject.yAccel) < Math.abs(parentObject.maxYSpeed))
			{
				parentObject.ySpeed += parentObject.yAccel;
			}
			
			if (parentObject.xAccel == 0)
			{
				parentObject.xSpeed -= parentObject.drag * parentObject.xSpeed;
			}
			
			if (parentObject.yAccel == 0)
			{
				parentObject.ySpeed -= parentObject.drag * parentObject.ySpeed;
			}
			
			parentObject.x += parentObject.xSpeed;
			parentObject.y += parentObject.ySpeed;
		}
		
	}

}