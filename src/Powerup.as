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
		public var collected:Boolean = false;
		
		
		public function Powerup(_imageID:String, _type:Number, _player:GameObject) 
		{
			super(_imageID);
			powerupType = _type;
			player = _player;
			
			
			
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
				Globals.vars.score += 500;
				
				//Give player the powerup.
				switch(powerupType)
				{
					case 0: // Ketchup Gun
						for (var i:int = 0; i < player.Weapons.length; i++)
						{
							//if we already have ketchup shots, first upgrade to doubleshot, then to faster firing, then to ammo.
							if (player.Weapons[i].name == "Ketchup Lv1")
							{
								player.Weapons[i].disabled = false;
								haveAlready = true;
								player.Weapons[i].doubleShot = true;
								player.Weapons[i].positionX = 4;
								player.Weapons[i].positionY = 0;
								player.Weapons[i].name = "Ketchup Lv2"
							}
							else if (player.Weapons[i].name == "Ketchup Lv2")
							{
								player.Weapons[i].disabled = false;
								haveAlready = true;
								player.Weapons[i].WeaponRef.rateOfFire--;
								player.Weapons[i].name = "Ketchup Lv3";
							}
							else if (player.Weapons[i].name == "Ketchup Lv3")
							{
								player.Weapons[i].disabled = false;
								haveAlready = true;
								player.Weapons[i].HUDRef.maxValue = 500;
								player.Weapons[i].MaxAmmo = 500;
								player.Weapons[i].Ammo = 500;
							}
							else if (player.Weapons[i].name == "Mustard")
							{
								// Do Nothing
							}
							else
							{
								// Must be other weapon, kill it.
								player.Weapons[i].disabled = true;
							}
							
							
						}
						if(haveAlready == false)
						{
							Globals.vars.Weapons.ketchupSlot.SetOwner(player);
							
							player.Weapons.push(Globals.vars.Weapons.ketchupSlot);
							player.Weapons[1].WeaponRef.currentFire = player.Weapons[1].WeaponRef.rateOfFire;
						}
						Globals.vars.Weapons.ketchupSlot.HUDRef.barColour = 0x00FFFF;
						
						collected = true;
						visible = false;
						break;
						
						
					case 1: // Flamethrower
						for (var i:int = 0; i < player.Weapons.length; i++)
						{
							//if we already have chilli shots, we want to upgrade its firerate twice
							if (player.Weapons[i].name == "Chilli Lv1")
							{
								player.Weapons[i].disabled = false;
								haveAlready = true;
								player.Weapons[i].WeaponRef.rateOfFire = 0.5;
								player.Weapons[i].name = "Chilli Lv2"
							}
							else if (player.Weapons[i].name == "Chilli Lv2")
							{
								player.Weapons[i].disabled = false;
								haveAlready = true;
								player.Weapons[i].WeaponRef.rateOfFire = 0.1;
								player.Weapons[i].name = "Chilli Lv3";
							}
							else if (player.Weapons[i].name == "Chilli Lv3")
							{
								player.Weapons[i].disabled = false;
								haveAlready = true;
								player.Weapons[i].HUDRef.maxValue = 200;
								player.Weapons[i].MaxAmmo = 200;
								player.Weapons[i].Ammo = 200;
							}
							else if (player.Weapons[i].name == "Mustard")
							{
								// Do Nothing
							}
							else
							{
								// Must be other weapon, kill it.
								player.Weapons[i].disabled = true;
							}
							
						}
						if(haveAlready == false)
						{
							Globals.vars.Weapons.chilliSlot.SetOwner(player);
							
							player.Weapons.push(Globals.vars.Weapons.chilliSlot);
						}
						
						Globals.vars.Weapons.chilliSlot.HUDRef.barColour = 0xFF7700;
						
						collected = true;
						visible = false;
						break;
				}
			}
			
			
		}
		
	}

}
