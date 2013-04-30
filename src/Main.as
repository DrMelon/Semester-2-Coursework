package 
{
	import flash.display.MovieClip;
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
	[SWF(backgroundColor="0xFFFFFF" , width="640" , height="480")]
	public class Main extends Sprite 
	{

		// Image Manager
		private var g_ImageManager:ImageManager = new ImageManager();
		private var theHUD:HUD = new HUD();
		
		// Movie clip things are added to for rendering.
		private var w_RenderClip:Sprite;
		
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
			stage.frameRate = 60;
			// entry point
			
			w_RenderClip = new Sprite();
			
			
			// Set up stage scaling
			stage.scaleMode = StageScaleMode.EXACT_FIT;
			

			// Load Graphics into Image Manager
			g_ImageManager.Load();
			
			// Add scrolling background
			scrollingBack = new ScrollingBackground();
			w_RenderClip.addChild(scrollingBack);
			
			// Set up HUD
			theHUD.y = 240 - 26;
			theHUD.AddNewStatusBar(50, 50, 0xFF0000);
			theHUD.AddNewStatusBar(50, 50, 0x00FF00);
			theHUD.AddNewStatusBar(50, 50, 0x0000FF);
				
			
			// Define a Bullet, Weapon, and Weaponslot for the player
			var mustardBullet:Bullet = new Bullet("MustardSplot.png", 4, 0, g_ImageManager);
			var mustardWeapon:Weapon = new Weapon(mustardBullet, 10, 0);
			w_RenderClip.addChild(mustardWeapon);
			var thePlayer:GameObject = new GameObject("Ship.png", g_ImageManager);
			var mustardSlot:WeaponSlot = new WeaponSlot(thePlayer, w_RenderClip, mustardWeapon, theHUD.statusBars[1], 50, 2, true, 20, 0);
			var PlayerWeapons:Array = new Array;
			PlayerWeapons.push(mustardSlot);
			thePlayer.Init();
			thePlayer.x = 320/2 - 32;
			thePlayer.y = 240-64;
			w_RenderClip.addChild(thePlayer);
			gameObjects.push(thePlayer);
			

			
			// Add Subsystems
			var mv:Movement = new Movement(thePlayer);
			mv.constrained = true;
			mv.topConstraint = 120;
			mv.botConstraint = 240 - 28;
			mv.leftConstraint = 8;
			mv.rightConstraint = 320 - 8 - thePlayer.width;
			
			var sc:ShmupControl = new ShmupControl(thePlayer, PlayerWeapons, stage);
			
			
			thePlayer.Init();
			
			w_RenderClip.addChild(theHUD);
			theHUD.Draw();		
			
			trace("Thing");
			
			
			// Render at 2x Size
			w_RenderClip.scaleX = 2;
			w_RenderClip.scaleY = 2;
			
			addChild(w_RenderClip);

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
			// And hud
			theHUD.Update();
		}
		
	}
	
}