package Subsystems 
{
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	/**
	 * ...
	 * @author ...
	 */
	public class HasCollision extends ObjectSubsystem 
	{
		// Checking Collision in Each Direction
		public var isCollidingLeft:Boolean = false;
		public var isCollidingRight:Boolean = false;		
		public var isCollidingTop:Boolean = false;
		public var isCollidingBottom:Boolean = false;
		
		// Collision Points (initialized during construction)
		private var collidePointLeft:Point;
		private var collidePointRight:Point;
		private var collidePointTop:Point;
		private var collidePointBottom:Point;
		
		// Distance from Collision Points to Object
		public var collidePointLeftDistance:Number;
		public var collidePointRightDistance:Number;
		public var collidePointTopDistance:Number;
		public var collidePointBottomDistance:Number;
		
		public var isStatic:Boolean = false;
		public var listOfColliders:Array;
			
		public function HasCollision(_parent:GameObject, _colliders:Array, _isStatic:Boolean) // Pass in other collision systems, add self to systems
		{
			super(_parent);
			isStatic = _isStatic;
			listOfColliders = _colliders;
			listOfColliders.push(this as ObjectSubsystem);
			
			//Collision Point Setup
			collidePointLeft = new Point(0, parentObject.height / 2); //Halfway down the left hand side
			collidePointRight = new Point(parentObject.width, parentObject.height / 2 ); //Halfway down the right hand side
			collidePointTop = new Point(parentObject.width / 2, 0); // Halfway along the top
			collidePointBottom = new Point(parentObject.width / 2, parentObject.height); //And halfway along the bottom.
		}		
		
		override public function Init():void
		{
			
		}
		
		override public function Update(e:Event = null):void
		{			
		//	CheckCollision();			
		}
		
		
		
		public function CheckCollision():void
		{
			// Reset Booleans
			isCollidingLeft = false;
			isCollidingRight = false;
			isCollidingTop = false;
			isCollidingBottom = false;
			
			
			// Check Collision against all items in collision list (except self) offset by speed.
			for (var i:int = 0; i < listOfColliders.length; i++)
			{
				if (this == listOfColliders[i] || isStatic == true)
				{
					continue; // ignore self, or if it's static
				}
				else
				{ 
					// Test against the current object VS our collision points using HitTestPoint.
					if (listOfColliders[i].parentObject.hitTestPoint(this.parentObject.x + this.parentObject.xSpeed + this.collidePointLeft.x, this.parentObject.y + this.collidePointLeft.y, true))
					{
						// Colliding on Left Side.
						isCollidingLeft = true;
						
						// I want to get distance from Left Point to Line Encompassing Top Right and Bottom Right of Target Object
						// To do this I must project the vector from the top right of the shape to the collision point
						// 
						
						var vectorToCollisionPoint:Vector3D = new Vector3D;
						var vectorOfSurface:Vector3D = new Vector3D;
						var projectedVector:Vector3D = new Vector3D;
						
						var topRightPoint:Point = new Point;
						var bottomRightPoint:Point = new Point;
						
						// Get Points of Target Object
						topRightPoint.x = listOfColliders[i].parentObject.x + listOfColliders[i].parentObject.width;
						topRightPoint.y = listOfColliders[i].parentObject.y;
						bottomRightPoint.x = listOfColliders[i].parentObject.x + listOfColliders[i].parentObject.width;
						bottomRightPoint.y = listOfColliders[i].parentObject.y + listOfColliders[i].parentObject.height;
						
						// Get vectors from those points
						vectorToCollisionPoint.x = (collidePointLeft.x + this.parentObject.x + this.parentObject.xSpeed) - topRightPoint.x;
						vectorToCollisionPoint.y = (collidePointLeft.x + this.parentObject.x + this.parentObject.xSpeed) - topRightPoint.y;
							
						vectorOfSurface.x = topRightPoint.x - bottomRightPoint.x;
						vectorOfSurface.y = topRightPoint.y - bottomRightPoint.y;
					
						
						// Project vector onto surface
						projectedVector.x = (vectorToCollisionPoint.dotProduct(vectorOfSurface) / vectorOfSurface.lengthSquared) * vectorOfSurface.x;
						projectedVector.y = (vectorToCollisionPoint.dotProduct(vectorOfSurface) / vectorOfSurface.lengthSquared) * vectorOfSurface.y;
						
						// Get distance between target point and surface
						collidePointLeftDistance = projectedVector.x - vectorToCollisionPoint.x;	
						
					}

					if (listOfColliders[i].parentObject.hitTestPoint(this.parentObject.x + this.parentObject.xSpeed + this.collidePointRight.x, this.parentObject.y + this.collidePointRight.y, true))
					{
						// Colliding on Right Side.
						isCollidingRight = true;
						
						var vectorToCollisionPoint:Vector3D = new Vector3D;
						var vectorOfSurface:Vector3D = new Vector3D;
						var projectedVector:Vector3D = new Vector3D;
						
						var topLeftPoint:Point = new Point;
						var bottomLeftPoint:Point = new Point;
						
						// Get Points of Target Object
						topLeftPoint.x = listOfColliders[i].parentObject.x;
						topLeftPoint.y = listOfColliders[i].parentObject.y;
						bottomLeftPoint.x = listOfColliders[i].parentObject.x;
						bottomLeftPoint.y = listOfColliders[i].parentObject.y + listOfColliders[i].parentObject.height;
						
						// Get vectors from those points
						vectorToCollisionPoint.x = (collidePointRight.x + this.parentObject.x + this.parentObject.xSpeed) - topLeftPoint.x;
						vectorToCollisionPoint.y = (collidePointRight.x + this.parentObject.x + this.parentObject.xSpeed) - topLeftPoint.y;
							
						vectorOfSurface.x = topLeftPoint.x - bottomLeftPoint.x;
						vectorOfSurface.y = topLeftPoint.y - bottomLeftPoint.y;
					
						
						// Project vector onto surface
						projectedVector.x = (vectorToCollisionPoint.dotProduct(vectorOfSurface) / vectorOfSurface.lengthSquared) * vectorOfSurface.x;
						projectedVector.y = (vectorToCollisionPoint.dotProduct(vectorOfSurface) / vectorOfSurface.lengthSquared) * vectorOfSurface.y;
						
						// Get distance between target point and surface
						collidePointRightDistance = projectedVector.x - vectorToCollisionPoint.x;							
					}
					
					if (listOfColliders[i].parentObject.hitTestPoint(this.parentObject.x + this.parentObject.ySpeed + this.collidePointTop.x, this.parentObject.y + this.collidePointTop.y, true))
					{
						// Colliding on Top
						isCollidingTop = true;
						
						var vectorToCollisionPoint:Vector3D = new Vector3D;
						var vectorOfSurface:Vector3D = new Vector3D;
						var projectedVector:Vector3D = new Vector3D;
						var bottomLeftPoint:Point = new Point;
						var bottomRightPoint:Point = new Point;
						
						
						// Get Points of Target Object
						bottomLeftPoint.x = listOfColliders[i].parentObject.x;
						bottomLeftPoint.y = listOfColliders[i].parentObject.y + listOfColliders[i].parentObject.height;
						bottomRightPoint.x = listOfColliders[i].parentObject.x + listOfColliders[i].parentObject.width;
						bottomRightPoint.y = listOfColliders[i].parentObject.y + listOfColliders[i].parentObject.height;


						
						// Get vectors from those points
						vectorToCollisionPoint.x = (collidePointTop.x + this.parentObject.x + this.parentObject.xSpeed)  - bottomLeftPoint.x;
						vectorToCollisionPoint.y = (collidePointTop.x + this.parentObject.x + this.parentObject.xSpeed)  - bottomLeftPoint.y;
							
						vectorOfSurface.x = bottomLeftPoint.x - bottomRightPoint.x;
						vectorOfSurface.y = bottomLeftPoint.y - bottomRightPoint.y;
					
						
						// Project vector onto surface
						projectedVector.x = (vectorToCollisionPoint.dotProduct(vectorOfSurface) / vectorOfSurface.lengthSquared) * vectorOfSurface.x;
						projectedVector.y = (vectorToCollisionPoint.dotProduct(vectorOfSurface) / vectorOfSurface.lengthSquared) * vectorOfSurface.y;
						
						// Get distance between target point and surface
						collidePointTopDistance = projectedVector.y - vectorToCollisionPoint.y;						
					}
					
					if (listOfColliders[i].parentObject.hitTestPoint(this.parentObject.x + this.parentObject.xSpeed + this.collidePointBottom.x, this.parentObject.y + this.collidePointBottom.y, true))
					{
						// Colliding on Bottom.
						isCollidingBottom = true;
						
						var vectorToCollisionPoint:Vector3D = new Vector3D;
						var vectorOfSurface:Vector3D = new Vector3D;
						var projectedVector:Vector3D = new Vector3D;
						var topLeftPoint:Point = new Point;
						var topRightPoint:Point = new Point;
						
						// Get Points of Target Object
						topLeftPoint.x = listOfColliders[i].parentObject.x;
						topLeftPoint.y = listOfColliders[i].parentObject.y;
						topRightPoint.x = listOfColliders[i].parentObject.x + listOfColliders[i].parentObject.width;
						topRightPoint.y = listOfColliders[i].parentObject.y;
						
						// Get vectors from those points
						vectorToCollisionPoint.x = (collidePointBottom.x + this.parentObject.x + this.parentObject.xSpeed) - topLeftPoint.x;
						vectorToCollisionPoint.y = (collidePointBottom.y + this.parentObject.y + this.parentObject.ySpeed) - topLeftPoint.y;
							
						vectorOfSurface.x = topLeftPoint.x - topRightPoint.x;
						vectorOfSurface.y = topLeftPoint.y - topRightPoint.y;
					
						
						// Project vector onto surface
						projectedVector.x = (vectorToCollisionPoint.dotProduct(vectorOfSurface) / vectorOfSurface.lengthSquared) * vectorOfSurface.x;
						projectedVector.y = (vectorToCollisionPoint.dotProduct(vectorOfSurface) / vectorOfSurface.lengthSquared) * vectorOfSurface.y;
						
						
											
						
						collidePointBottomDistance = projectedVector.y - vectorToCollisionPoint.y;	
						
						
					}					
					

				}
			}
		}
		
	}

}