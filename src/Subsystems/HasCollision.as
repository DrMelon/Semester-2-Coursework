package Subsystems 
{
	import flash.events.Event;
	import flash.geom.Point;
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
			CheckCollision();			
		}
		
		public function CheckCollision():void
		{
			// Reset Booleans
			isCollidingLeft = false;
			isCollidingRight = false;
			isCollidingTop = false;
			isCollidingBottom = false;
			
			
			// Check Collision against all items in collision list (except self)
			for (var i:int = 0; i < listOfColliders.length; i++)
			{
				if (this == listOfColliders[i] || isStatic == true)
				{
					continue; // ignore self, or if it's static
				}
				else
				{ 
					// Test against the current object VS our collision points using HitTestPoint.
					if (listOfColliders[i].parentObject.hitTestPoint(this.parentObject.x + this.collidePointLeft.x, this.parentObject.y + this.collidePointLeft.y, true))
					{
						// Colliding on Left Side.
						isCollidingLeft = true;
					}

					if (listOfColliders[i].parentObject.hitTestPoint(this.parentObject.x + this.collidePointRight.x, this.parentObject.y + this.collidePointRight.y, true))
					{
						// Colliding on Right Side.
						isCollidingRight = true;
					}
					
					if (listOfColliders[i].parentObject.hitTestPoint(this.parentObject.x + this.collidePointTop.x, this.parentObject.y + this.collidePointTop.y, true))
					{
						// Colliding on Top
						isCollidingTop = true;
					}
					
					if (listOfColliders[i].parentObject.hitTestPoint(this.parentObject.x + this.collidePointBottom.x, this.parentObject.y + this.collidePointBottom.y, true))
					{
						// Colliding on Bottom.
						isCollidingBottom = true;
						this.parentObject.y = listOfColliders[i].parentObject.y - this.parentObject.height; //"bump" it up a teeny bit
					}					
					
					
					
				
					
				}
			}
		}
		
	}

}