package  
{
	import flash.display.Bitmap;
	import flash.events.Event;
	import Subsystems.DamageHandler;
	import Subsystems.Movement;
	import Defines.AnimDef;
	/**
	 * ...
	 * @author ...
	 */
	public class Bullet extends GameObject 
	{ 
		// Bullets use the DamageController subsystem to deal contact damage to things not on their team.
		public var bulletSpeed:Number;
		public var bulletTeam:Number;
		public var bulletDamage:Number;
		public var damHandler:DamageHandler;
		// Team determines bullet direction. Enemies come from the top, so anything on the enemy team comes down the screen.
		
		
		
		
		public function Bullet(_img:String, _spd:Number, _team:Number, _dam:Number, _managerInstance:ImageManager, _gameObjects:Array) 
		{
			super(_img, _managerInstance, _gameObjects);
			
			bulletSpeed = _spd;
			bulletTeam = _team;
			bulletDamage = _dam;
			
			maxXSpeed = bulletSpeed;
			maxYSpeed = bulletSpeed;
			
			var mv:Movement = new Movement(this); // add movement subsystem.
			var anims:AnimDef = new AnimDef(); // animations
			anims.InitAnims(managerInstance);
			damHandler = new DamageHandler(this, true, false, 0, bulletDamage, bulletTeam); // add damage handler
			damHandler.DeathAnimation = anims.explosion_small;
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
		
		override public function Update(e:Event = null):void
		{
			// Activate subsystems
			for (var i:int = 0; i < subsystems.length; i++)
			{
				subsystems[i].Update();
			}			
			

			
		}
		
		
	}

}