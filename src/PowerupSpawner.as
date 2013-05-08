package  
{
	import Defines.AnimDef;
	import Defines.WeaponDef;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.media.Sound;
	import Subsystems.DamageHandler;
	import Subsystems.FollowPattern;
	import Subsystems.Movement;
	/**
	 * ...
	 * @author ...
	 */
	public class PowerupSpawner 
	{
		// There is a single instance of this class, which constantly generates random powerups on a timer.
		
		public var w_RenderClip:Sprite;
		public var AnimDefs:AnimDef;
		public var WeaponDefs:WeaponDef;
		public var gameObjects:Array;
		public var thePlayer:GameObject;
		public var playersHUD:HUD;
		
		public var PowerupToGenerate:Number = 0;
		public var TimeBetweenPowerups:Number = 600;
		public var CurrentTime:Number;
		
		
		public function PowerupSpawner(_rc:Sprite, anidef:AnimDef, wepdef:WeaponDef, _gameObjects:Array, _player:GameObject, _playershud:HUD) 
		{
			w_RenderClip = _rc;
			AnimDefs = anidef;
			WeaponDefs = wepdef;
			gameObjects = _gameObjects;
			thePlayer = _player;
			playersHUD = _playershud;
			
			WeaponDefs.InitWeapons(w_RenderClip, playersHUD, gameObjects);
			
			CurrentTime = 0;
		}
		
		public function Update(e:Event = null):void
		{
			if (CurrentTime == 0)
			{
				CurrentTime = TimeBetweenPowerups;
				
				switch(PowerupToGenerate)
				{
					case 0:
						//Ketchup
						var thePowerup:Powerup = new Powerup("KetchupPowerup.png", gameObjects, PowerupToGenerate, thePlayer, WeaponDefs);
						thePowerup.Init();
						gameObjects.push(thePowerup);
						w_RenderClip.addChild(thePowerup);
						break;
				}
				
			
			}
			CurrentTime--;
			
		}
		
		
	}

}