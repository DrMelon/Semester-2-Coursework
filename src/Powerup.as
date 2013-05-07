package  
{
	import flash.events.Event;
	import Subsystems.Movement;
	import Defines.WeaponDef;
	/**
	 * ...
	 * @author J. Brown
	 */
	public class Powerup extends GameObject 
	{
		//Powerups give weapons or bonuses to the player.
		public var powerupType:Number = 0; // 0 - Ketchup Weapon
										   // 1 - Onion Weapon
										   // 2 - Chilli Weapon
										   //
										   
		public var player:GameObject;
		public var weapondef:WeaponDef;
		public var collected:Boolean = false;
		
		public function Powerup(_imageID:String, _managerInstance:ImageManager, _gameObjects:Array, _type:Number, _player:GameObject, _weapondef:WeaponDef) 
		{
			super(_imageID, _managerInstance, _gameObjects);
			powerupType = _type;
			player = _player;
			weapondef = _weapondef;
			
			var mv:Movement = new Movement(this);
			maxYSpeed = 1;
			yAccel = 1;
			ySpeed = 1;
			
			//Random place at top of screen
			x = Math.random() * (240 - 16);
			y = 0;
			
			
			
		}
		
		override public function Update(e:Event = null):void 
		{
			
			// Activate subsystems
			for (var i:int = 0; i < subsystems.length; i++)
			{
				subsystems[i].Update();
			}	
			
			if (collected)
			{
				return;
			}
			// Check for collision with player
			if (hitTestObject(player))
			{
				
				//Give player the powerup.
				switch(powerupType)
				{
					case 0:
						weapondef.ketchupSlot.SetOwner(player);
						weapondef.ketchupSlot.HUDRef.barColour = 0x00FFFF;
						player.Weapons.push(weapondef.ketchupSlot);
						
						
						collected = true;
						visible = false;
						break;
				}
			}
			
			
		}
		
	}

}