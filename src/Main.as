package 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import Subsystems.*;
	
	/**
	 * ...
	 * @author J. Brown
	 */
	[SWF(backgroundColor="0xFFFFFF" , width="320" , height="240")]
	public class Main extends Sprite 
	{
		
		// Image Manager
		private var g_ImageManager:ImageManager = new ImageManager();
		
		// List of game objects
		private var gameObjects:Array = new Array();
		
		private var scrollingBack:ScrollingBackground;

		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, Update);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point

			
			// Set up stage scaling
			stage.scaleMode = StageScaleMode.EXACT_FIT;

			// Load Graphics into Image Manager
			g_ImageManager.Load();
			
			// Add scrolling background
			scrollingBack = new ScrollingBackground();
			addChild(scrollingBack);
			
			// Define a Bullet, Weapon, and Weaponslot for the player
			var mustardBullet:Bullet = new Bullet("MustardSplot.png", 3, 0, g_ImageManager);
			var mustardWeapon:Weapon = new Weapon(mustardBullet, 10, 0);
			addChild(mustardWeapon);
			var thePlayer:GameObject = new GameObject("Ship.png", g_ImageManager);
			var mustardSlot:WeaponSlot = new WeaponSlot(thePlayer, mustardWeapon, true, 8, 0);
			mustardSlot.Ammo = 50;
			mustardSlot.MaxAmmo = 50;
			var PlayerWeapons:Array = new Array;
			PlayerWeapons.push(mustardSlot);
			thePlayer.Init();
			thePlayer.x = 320/2 - 32;
			thePlayer.y = 240-64;
			addChild(thePlayer);
			gameObjects.push(thePlayer);
			

			
			// Add Subsystems
			var mv:Movement = new Movement(thePlayer);
			mv.constrained = true;
			mv.topConstraint = 120;
			mv.botConstraint = 240 - 28;
			mv.leftConstraint = 8;
			mv.rightConstraint = 320 - 8 - thePlayer.width;
			
			var sc:ShmupControl = new ShmupControl(thePlayer, PlayerWeapons);
			
			
			thePlayer.Init();
			
			
			
			// Set up HUD
			var theHUD:HUD = new HUD();
			theHUD.y = 240 - 26;
			addChild(theHUD);
			theHUD.AddNewStatusBar(50, 50, 0xFF0000);
			theHUD.AddNewStatusBar(50, 50, 0x00FF00);
			theHUD.AddNewStatusBar(50, 50, 0x0000FF);
			theHUD.Draw();
			
		}
		
		private function Update(e:Event = null):void
		{
			// Every object in master object list, update
			for (var i:int = 0; i < gameObjects.length; i++)
			{
				gameObjects[i].Update(e);
			}
			
			// Update background
			scrollingBack.Update();
		}
		
	}
	
}