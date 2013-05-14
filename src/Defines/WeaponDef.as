package Defines
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import Subsystems.*;
	import Defines.*;
	
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
		
		// Ketchup Weapon
		public var ketchupBullet:Bullet;
		public var ketchupWeapon:Weapon;
		public var ketchupSlot:WeaponSlot;
		
		// Chilli Flamethrower
		public var chilliBullet:Bullet;
		public var chilliWeapon:Weapon;
		public var chilliSlot:WeaponSlot;
		
		public var enemyPumpkinBullet:Bullet;
		public var enemyPumpkinWeapon:Weapon;
		public var enemyPumpkinSlot:WeaponSlot;
		
		public var danmakuCannonBullet:Bullet;
		public var danmakuCannonWeapon:Weapon;
		public var danmakuCannonSlot:WeaponSlot;
		
		
		public function InitWeapons(theHUD:HUD):void
		{
			mustardBullet = new Bullet("MustardSplot.png", 4, 0, 5);
			mustardWeapon = new Weapon(mustardBullet, 10, 0, "fire_mustard.mp3");
			
			
			ketchupBullet = new Bullet("KetchupSplot.png", 6, 0, 2);
			ketchupWeapon = new Weapon(ketchupBullet, 4, 0, "fire_ketchup.mp3");
			
			chilliBullet = new Bullet("FlameParticle.png", 8, 0, 1);
			chilliWeapon = new Weapon(chilliBullet, 0.4, 0, "flame.mp3");
		
			enemyPumpkinBullet = new Bullet("PumpkinSeed.png", 3, 1, 20);
			enemyPumpkinWeapon = new Weapon(enemyPumpkinBullet, 15, 1, "fire_ketchup.mp3");
			
			danmakuCannonBullet = new Bullet("Danmaku.png", 3, 1, 5);
			danmakuCannonBullet.sine = true;
			danmakuCannonWeapon = new Weapon(danmakuCannonBullet, 12, 1, "fire_mustard.mp3");
			
			mustardSlot = new WeaponSlot(mustardWeapon, theHUD.statusBars[1], 50, 2, true, 20, 0);
			ketchupSlot = new WeaponSlot(ketchupWeapon, theHUD.statusBars[2], 200, 4, false, 0, 0);
			chilliSlot = new WeaponSlot(chilliWeapon, theHUD.statusBars[2], 200, 3, false, 0, 0);
			enemyPumpkinSlot = new WeaponSlot(enemyPumpkinWeapon, null, 999, 999, false, 0, 0);
			danmakuCannonSlot = new WeaponSlot(danmakuCannonWeapon, null, 999, 999, false, 0, 0);
			
			mustardSlot.name = "Mustard";
			ketchupSlot.name = "Ketchup Lv1";
			chilliSlot.name = "Chilli Lv1";
	
		
		}
		
			
			
			
			
			

		
	}

}