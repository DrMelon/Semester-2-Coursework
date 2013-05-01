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
	public class WeaponDefs extends Sprite
	{
		// The WeaponDefs class allows me to globally define certain different weapons, weapon slots, and bullets.
		// Define a Bullet, Weapon, and Weaponslot for the player
		
		// 
		public static var mustardBullet:Bullet;
		public static var mustardWeapon:Weapon;
		public static var mustardSlot:WeaponSlot;
		
		
		
		public function InitWeapons(g_ImageManager:ImageManager, w_RenderClip:Sprite, theHUD:HUD)
		{
			mustardBullet = new Bullet("MustardSplot.png", 4, 0, g_ImageManager);
			mustardWeapon = new Weapon(mustardBullet, 10, 0);
			w_RenderClip.addChild(mustardWeapon);
			
			mustardSlot:WeaponSlot = new WeaponSlot(w_RenderClip, mustardWeapon, theHUD.statusBars[1], 50, 2, true, 20, 0);
		}
		
			
			
			
			
			

		
	}

}