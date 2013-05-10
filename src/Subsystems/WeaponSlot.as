package Subsystems 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
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
		public var AmmoRefillTime:Number // Refill time (in seconds)
		
		public var IsRefilling:Boolean;
		
		private var RenderClip:Sprite
		private var LastFired:Number;
		
		public var disabled:Boolean = false;
		
		// Reference to HUD Bar to display ammo
		public var HUDRef:StatusBar;
		
		public var name:String; // name to track powerups etc
		
		public function WeaponSlot(_weapon:Weapon, _bar:StatusBar, _maxammo:Number, _ammorefill:Number, _ds:Boolean = false, _pX:Number = 0, _pY:Number = 0 ) 
		{
			super(null);
			
			doubleShot = _ds;
			MaxAmmo = _maxammo;
			Ammo = MaxAmmo;
			AmmoRefillTime = _ammorefill * 60;
			LastFired = AmmoRefillTime;
			
		
			
			if (doubleShot == true)
			{
				positionX = _pX;
				positionY = _pY;
			}
			
			WeaponRef = _weapon;
			HUDRef = _bar;
			
			if (HUDRef != null)
			{
				HUDRef.maxValue = MaxAmmo;
				HUDRef.value = Ammo;
			}
		}
		
		public function SetOwner(_parent:GameObject):void
		{
			parentObject = _parent;
			parentObject.subsystems.push(this);
		}
		
		public function FireWeapon():void
		{
			if (disabled)
			{
				return;
			}
			if (Ammo > 0)
			{
				var fired:Boolean = false;
				if (doubleShot)
				{
					
					WeaponRef.y = parentObject.y + positionY;
					WeaponRef.x = parentObject.x + (parentObject.myBitmap.width / 2) - (4) - positionX;
					WeaponRef.FireBullet(true);
					WeaponRef.x = parentObject.x + (parentObject.myBitmap.width / 2) - (4) + positionX;
					fired = WeaponRef.FireBullet(false);
				}
				else
				{
					
					WeaponRef.x = parentObject.x + (parentObject.myBitmap.width / 2) - (4);
					WeaponRef.y = parentObject.y;
					fired = WeaponRef.FireBullet(false);
				}
				if (fired == true)
				{
					Ammo--;
					LastFired = AmmoRefillTime;
					IsRefilling = false;
				}
				
			}
			
				
		}
		
		override public function Update(e:Event = null):void
		{
			if (disabled)
			{
				return;
			}
			if (LastFired == 0)
			{
				if (Ammo < MaxAmmo)
				{
					if (IsRefilling == false)
					{
						Globals.vars.g_SoundManager.PlaySoundByKeyword("regen_ammo.mp3");
					}
					Ammo++;
					IsRefilling = true;
				}
			}
			else if(LastFired > 0)
			{
				LastFired--;
			}
			if (HUDRef != null)
			{
				HUDRef.maxValue = MaxAmmo;
				HUDRef.value = Ammo;
			}
			WeaponRef.Update(e);
			
		}
		
	}

}