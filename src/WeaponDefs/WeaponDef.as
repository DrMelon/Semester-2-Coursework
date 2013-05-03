package WeaponDefs
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import Subsystems.*;
	
	/**
	 * ...
	 * @author ...
	 */
	public class WeaponDef extends Sprite
	{
		// The WeaponDefs class allows me to define certain different weapons, weapon slots, and bullets.
		
		
		// Mustard Weapon
		public var mustardBullet:Bullet;
		public var mustardWeapon:Weapon;
		public var mustardSlot:WeaponSlot;
		
		
		
		public function InitWeapons(g_ImageManager:ImageManager, w_RenderClip:Sprite, theHUD:HUD, gameObjectList:Array):void
		{
			mustardBullet = new Bullet("MustardSplot.png", 4, 0, g_ImageManager, gameObjectList);
			mustardWeapon = new Weapon(mustardBullet, 10, 0);
			mustardWeapon.gameObjectList = gameObjectList;
			
			
			w_RenderClip.addChild(mustardWeapon);
			
			mustardSlot = new WeaponSlot(w_RenderClip, mustardWeapon, theHUD.statusBars[1], 50, 2, true, 20, 0);
		}
		
			
			
			
			
			

		
	}

}