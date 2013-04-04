package Subsystems 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author ...
	 */
	public class HasCollision extends ObjectSubsystem 
	{
		public var isColliding:Boolean = false;
		public var listOfColliders:Array;
	
		public function HasCollision(_parent:GameObject, _colliders:Array) // Pass in other collision systems, add self to systems
		{
			super(_parent);
			listOfColliders = _colliders;
			listOfColliders.push(this as ObjectSubsystem);
		}
		
		override public function Init():void
		{
			
		}
		
		override public function Update(e:Event = null):void
		{
			isColliding = false; // reset collision state
			
			
			// Check Collision against Borders of the Screen
			if (parentObject.x + parentObject.xSpeed < 0) // Going Left
			{
				isColliding = true;
				parentObject.xAccel = 0;
				parentObject.xSpeed = 0;
			}
			if (parentObject.x + parentObject.width + parentObject.xSpeed > 320) // Going Right
			{
				isColliding = true;
				parentObject.xSpeed = 0;
				parentObject.xAccel = 0;
			}
			
			CheckCollision();
			
		}
		
		public function CheckCollision():void
		{
			// Check Collision against all items in collision list (except self)
			for (var i:int = 0; i < listOfColliders.length; i++)
			{
				if (this == listOfColliders[i])
				{
					continue; // ignore self
				}
				else
				{
					if (parentObject.x + parentObject.xSpeed >= listOfColliders[i].parentObject.x && parentObject.x + parentObject.xSpeed <= listOfColliders[i].parentObject.x + listOfColliders[i].parentObject.width)
					{
						if (parentObject.y + parentObject.ySpeed >= listOfColliders[i].parentObject.y && parentObject.y + parentObject.ySpeed <= listOfColliders[i].parentObject.y + listOfColliders[i].parentObject.height)
						{
							// Collided in both axes
							trace ("Collision!");
							isColliding = true;
							parentObject.xSpeed = 0;
							parentObject.xAccel = 0;
							parentObject.ySpeed = 0;
							parentObject.yAccel = 0;
						}
					}
				}
			}
		}
		
	}

}