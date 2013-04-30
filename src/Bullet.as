package  
{
	import flash.display.Bitmap;
	import flash.events.Event;
	import Subsystems.Movement;
	/**
	 * ...
	 * @author ...
	 */
	public class Bullet extends GameObject 
	{ 
		// Bullets use the DamageController subsystem to deal contact damage to things not on their team.
		public var bulletSpeed:Number;
		public var bulletTeam:Number;
		
		// Team determines bullet direction. Enemies come from the top, so anything on the enemy team comes down the screen.
		
		
		public function Bullet(_img:String, _spd:Number, _team:Number, _managerInstance:ImageManager) 
		{
			super(_img, _managerInstance);
			
			bulletSpeed = _spd;
			bulletTeam = _team;
			
			maxXSpeed = bulletSpeed;
			maxYSpeed = bulletSpeed;
			
			var mv:Movement = new Movement(this); // add movement subsystem.
		}
		
		override public function Init():void
		{
			if (bulletTeam == 0) // Player
			{
				ySpeed = -bulletSpeed;
				yAccel = -bulletSpeed;
			}
			if (bulletTeam == 1) // Enemy
			{
				ySpeed = bulletSpeed;
				yAccel = bulletSpeed;
			}
			//Fetch info from manager
			myBitmap.bitmapData = managerInstance.FetchBitmapDataByKeyword(imageID);
			addChild(myBitmap);
			
			// Activate subsystems
			for (var i:int = 0; i < subsystems.length; i++)
			{
				subsystems[i].Init();
			}
		}
		
		
	}

}