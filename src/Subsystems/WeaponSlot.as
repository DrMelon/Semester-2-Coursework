package Subsystems 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author ...
	 */
	public class WeaponSlot extends ObjectSubsystem
	{
		// The weaponslot class holds a Weapon object and manages things like where it's positioned and firing and if it's double shot or not.
		
		public var doubleShot:Boolean = false;
		// The position only really counts if it's double-shot. Otherwise it's dead center.
		public var positionX:Number;
		public var positionY:Number;
		
		public var WeaponRef:Weapon; // The weapon in question
		
		public var Ammo:Number; // Ammunition for this weapon
		public var MaxAmmo:Number; // Maximum Ammo it can have
		
		// Reference to HUD Bar to display ammo
		//public var 
		
		public function WeaponSlot(_parent:GameObject, _weapon:Weapon, _ds:Boolean = false, _pX:Number = 0, _pY:Number = 0 ) 
		{
			super(_parent);
			
			doubleShot = _ds;
			
			if (doubleShot == true)
			{
				positionX = _pX;
				positionY = _pY;
			}
			
			WeaponRef = _weapon;
			
		}
		
		public function FireWeapon():void
		{
			if (Ammo > 0)
			{
				if (doubleShot)
				{
					WeaponRef.y = parentObject.y + positionY;
					WeaponRef.x = parentObject.x + (parentObject.width / 2) - positionX;
					WeaponRef.FireBullet();
					WeaponRef.x = parentObject.x + (parentObject.width / 2) + positionX;
					WeaponRef.FireBullet();
				}
				else
				{
					WeaponRef.x = parentObject.x + parentObject.width / 2;
					WeaponRef.y = parentObject.y;
					WeaponRef.FireBullet();
				}
				Ammo--;
			}
				
		}
		
		override public function Update(e:Event = null):void
		{
			WeaponRef.Update(e);
		}
		
	}

}