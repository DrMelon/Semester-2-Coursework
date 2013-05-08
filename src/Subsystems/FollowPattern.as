package Subsystems 
{
	import flash.events.Event;
	import flash.geom.Point;
	/**
	 * ...
	 * @author J. Brown
	 */
	public class FollowPattern extends ObjectSubsystem 
	{
		// This makes an object follow a path. The coordinates are points listed in an array, and there's a MoveTowards function that will move them to the point
		// using a unit vector multiplied by the speed we want them to move.
		
		
		public var PatternCoordinates:Array; 
		private var MoveSpeed:Number;
		private var CurrentPoint:Number;
		public var Looping:Boolean = false;
		
		
		
		public function FollowPattern(_parent:GameObject, _ms:Number)
		{
			super(_parent);
			MoveSpeed = _ms;
			CurrentPoint = 0;
		}
		
		public function CheckIfAtPoint():Boolean
		{
			if (parentObject.x < PatternCoordinates[CurrentPoint].x + 1 && parentObject.x > PatternCoordinates[CurrentPoint] - 1)
			{
				if (parentObject.y < PatternCoordinates[CurrentPoint].y + 1 && parentObject.y > PatternCoordinates[CurrentPoint] - 1)
				{
					return true;
				}
			}
			
			return false;
		}
		
		public function SwitchPoint():void
		{
			if (CurrentPoint < PatternCoordinates.length-1)
			{
				CurrentPoint++;
			}
			else if(Looping == true)
			{
				// Reached the end, loop back
				CurrentPoint = 0;
			}
			else
			{
				CurrentPoint = PatternCoordinates.length - 1;
			}
		}
		
		
		override public function Update(e:Event = null):void
		{
			MoveTowardsNextPoint();
		}
		
		public function MoveTowardsNextPoint():void
		{
			if (CheckIfAtPoint() == true)
			{
				trace("Made it to point " + CurrentPoint);
				SwitchPoint();
			}
			
			
			var vectorToMove:Point = new Point(0, 0);
			
			// Get distance to point.
			vectorToMove.x = parentObject.x - PatternCoordinates[CurrentPoint].x;
			vectorToMove.y = parentObject.y - PatternCoordinates[CurrentPoint].y;
			
			// If distance < 1, we made it.
			if (Math.abs(vectorToMove.x) < 1 && Math.abs(vectorToMove.y) < 1)
			{
				SwitchPoint();
			}
			
			// Make unit vector
			vectorToMove.normalize(1);
			
			vectorToMove.x *= MoveSpeed;
			vectorToMove.y *= MoveSpeed;
			
			// Vector is reversed...
			vectorToMove.x = -vectorToMove.x;
			vectorToMove.y = -vectorToMove.y;
			
			parentObject.xSpeed = vectorToMove.x;
			parentObject.ySpeed = vectorToMove.y;
			
			
			
			//trace(parentObject.xAccel);
			//trace(parentObject.yAccel);
			
			
			
		}
		
		
		
	}

}