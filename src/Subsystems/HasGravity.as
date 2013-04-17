package Subsystems 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author ...
	 */
	public class HasGravity extends ObjectSubsystem 
	{
		public var myCollisions:HasCollision;
		public function HasGravity(_parent:GameObject, _collisions:HasCollision) 
		{
			super(_parent);
			myCollisions = _collisions;
		}
		
		override public function Init():void
		{
			parentObject.yAccel = 0.98;
			parentObject.maxYSpeed = 25;
		}
		
		
		override public function Update(e:Event = null):void
		{
			if (myCollisions.isCollidingBottom)
			{
				parentObject.yAccel = 0;
				return;
			}
			else
			{
				parentObject.yAccel = 0.98;
			}
		}
				
		
	}

}