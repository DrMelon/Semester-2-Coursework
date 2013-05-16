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
		
	
		public var thePlayer:GameObject;
		public var playersHUD:HUD;
		
		public var PowerupToGenerate:Number = 0;
		public var TimeBetweenPowerups:Number = 600;
		public var CurrentTime:Number;
		
		
		public function PowerupSpawner(_player:GameObject, _playershud:HUD) 
		{

			thePlayer = _player;
			playersHUD = _playershud;
			
		
			
			CurrentTime = TimeBetweenPowerups;
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
						var thePowerup:Powerup = new Powerup("KetchupPowerup.png", PowerupToGenerate, thePlayer);
						thePowerup.Init();
						Globals.vars.gameObjects.push(thePowerup);
						Globals.vars.w_RenderClip.addChild(thePowerup);
						break;
					case 1:
						//Ketchup
						var thePowerup:Powerup = new Powerup("ChilliPowerup.png", PowerupToGenerate, thePlayer);
						thePowerup.Init();
						Globals.vars.gameObjects.push(thePowerup);
						Globals.vars.w_RenderClip.addChild(thePowerup);
						break;		
					case 2:
						var thePowerup:Powerup = new Powerup("HeartPowerup.png", PowerupToGenerate, thePlayer);
						thePowerup.Init();
						Globals.vars.gameObjects.push(thePowerup);
						Globals.vars.w_RenderClip.addChild(thePowerup);
						break;								
				}
				
				PowerupToGenerate = Math.round(Math.random()*2);
				trace(PowerupToGenerate);
				
			
			}
			CurrentTime--;
			
		}
		
		
	}

}