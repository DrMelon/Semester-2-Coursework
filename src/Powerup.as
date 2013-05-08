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
		
		
		public function Powerup(_imageID:String, _gameObjects:Array, _type:Number, _player:GameObject, _weapondef:WeaponDef) 
		{
			super(_imageID, _gameObjects);
			powerupType = _type;
			player = _player;
			weapondef = _weapondef;
			
			
			var mv:Movement = new Movement(this);
			maxYSpeed = 2;
			yAccel = 2;
			ySpeed = 2;
			
			//Random place at top of screen
			x = Math.random() * (240 - 16);
			y = 0;
			
			
			
		}
		
		override public function Update(e:Event = null):void 
		{
			var haveAlready:Boolean = false;
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
				// Play sound
				Globals.vars.g_SoundManager.PlaySoundByKeyword("pickup_powerup.mp3");
				
				
				//Give player the powerup.
				switch(powerupType)
				{
					case 0:
						for (var i:int = 0; i < player.Weapons.length; i++)
						{
							//if we already have ketchup shots, first upgrade to doubleshot, then to faster firing, then to ammo.
							if (player.Weapons[i].name == "Ketchup Lv1")
							{
								haveAlready = true;
								player.Weapons[i].doubleShot = true;
								player.Weapons[i].positionX = 4;
								player.Weapons[i].positionY = 0;
								player.Weapons[i].name = "Ketchup Lv2"
							}
							else if (player.Weapons[i].name == "Ketchup Lv2")
							{
								haveAlready = true;
								player.Weapons[i].WeaponRef.rateOfFire--;
								player.Weapons[i].name = "Ketchup Lv3";
							}
							else if (player.Weapons[i].name == "Ketchup Lv3")
							{
								haveAlready = true;
								player.Weapons[i].HUDRef.maxValue = 500;
								player.Weapons[i].MaxAmmo = 500;
								player.Weapons[i].Ammo = 500;
				
							}
							
						}
						if(haveAlready == false)
						{
							weapondef.ketchupSlot.SetOwner(player);
							weapondef.ketchupSlot.HUDRef.barColour = 0x00FFFF;
							player.Weapons.push(weapondef.ketchupSlot);
						}
						
						collected = true;
						visible = false;
						break;
				}
			}
			
			
		}
		
	}

}