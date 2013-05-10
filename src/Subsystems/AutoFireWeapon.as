package Subsystems 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author ...
	 */
	public class AutoFireWeapon extends ObjectSubsystem 
	{
		public var weaponSlot:WeaponSlot;
		//Allows AI ships to automatically fire.
		public function AutoFireWeapon(_parent:GameObject, _weaponSlot:WeaponSlot)
		{
			super(_parent);
			weaponSlot = _weaponSlot;
			
			weaponSlot.SetOwner(_parent);
			
		}
		
		override public function Update(e:Event = null):void
		{
			weaponSlot.FireWeapon();
		}
		
	}

}