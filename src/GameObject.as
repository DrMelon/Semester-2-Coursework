package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author J. Brown
	 */
	public class GameObject extends Sprite  // The GameObject class covers all interactive 
	{
		// Each GameObject will use the ImageManager to load bitmap data. 
		// This is so that I don't end up embedding images multiple times.
		
		public var subsystems:Array = new Array(); // Collection of Subsystems (see ObjectSubsystem.as)
		
		private var imageID:String; // Image ID in the ImageManager
		private var managerInstance:ImageManager; // Image Manager Reference
		private var myBitmap:Bitmap = new Bitmap();
		
		// Physical constraints and affectors
		public var xSpeed:Number = 0;
		public var xAccel:Number = 0;
		public var ySpeed:Number = 0;
		public var yAccel:Number = 0;
		
		public var xMomentum:Number = 0.1;
		public var yMomentum:Number = 0.1;
		
		public var maxXSpeed:Number = 1000;
		public var maxYSpeed:Number = 1000;
		
		public function GameObject(_imageID:String, _managerInstance:ImageManager) 
		{
			imageID = _imageID;
			managerInstance = _managerInstance;
		}
		
		public function Init():void
		{
			//Fetch info from manager
			myBitmap.bitmapData = managerInstance.FetchBitmapDataByKeyword(imageID);
			addChild(myBitmap);
			
			// Activate subsystems
			for (var i:int = 0; i < subsystems.length; i++)
			{
				subsystems[i].Init();
			}
		}
		
		public function Update(e:Event = null):void
		{
			// Activate subsystems
			for (var i:int = 0; i < subsystems.length; i++)
			{
				subsystems[i].Update();
			}			
			
			// Update speed and position
			if (Math.abs(xSpeed+xAccel) < Math.abs(maxXSpeed))
			{
				xSpeed += xAccel;
			}
			if (Math.abs(ySpeed+yAccel) < Math.abs(maxYSpeed))
			{
				ySpeed += yAccel;
			}
			
			if (xAccel == 0)
			{
				if(xSpeed > 0.1)
					xSpeed -= xMomentum;
				else if(xSpeed < 0)
					xSpeed += xMomentum;
			}
			
			if (yAccel == 0)
			{
				if(ySpeed > 0.1)
					ySpeed -= xMomentum;
				else if (ySpeed < 0)
					ySpeed += yMomentum;
			}
			
			x += xSpeed;
			y += ySpeed;
			
		}
		
		public function Draw():void
		{
			// Activate subsystems
			for (var i:int = 0; i < subsystems.length; i++)
			{
				subsystems[i].Draw();
			}
			
			
			
		}
		
		
		
	}

}