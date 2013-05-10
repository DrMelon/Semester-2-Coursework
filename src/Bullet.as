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
		public var bulletSpread:Number;
		// Team determines bullet direction. Enemies come from the top, so anything on the enemy team comes down the screen.
		
		
		
		
		public function Bullet(_img:String, _spd:Number, _team:Number, _dam:Number) 
		{
			super(_img);
			
			bulletSpeed = _spd;
			bulletTeam = _team;
			bulletDamage = _dam;
			
			maxXSpeed = bulletSpeed;
			maxYSpeed = bulletSpeed;
			
			var mv:Movement = new Movement(this); // add movement subsystem.
			
			damHandler = new DamageHandler(this, true, false, 0, bulletDamage, bulletTeam); // add damage handler
			damHandler.DeathSound = "shot_connect.mp3";
			damHandler.DeathAnimation = Globals.vars.Animations.explosion_small;
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
			
			if (bulletSpread > 0)
			{
				xAccel = ((Math.random() * bulletSpread * 2) - bulletSpread);
				drag = 1;
			}
			//Fetch info from manager 
			myBitmap.bitmapData = Globals.vars.g_ImageManager.FetchBitmapDataByKeyword(imageID);
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
			if (rotation != 0)
			{
				this.rotation++;
			}
			
			
		}
		
		
	}

}