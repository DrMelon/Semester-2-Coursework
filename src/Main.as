package
{
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Point;
	import Subsystems.*;
	import Defines.*;
	
	/**
	 * ...
	 * @author J. Brown
	 */
	[SWF(backgroundColor="0xFFFFFF",width="640",height="480")]
	
	public class Main extends Sprite
	{
		
		// Image Manager
		private var g_ImageManager:ImageManager = new ImageManager();
		
		// Sound Manager
		private var g_SoundManager:SoundManager = new SoundManager();
		
		// HUD
		private var theHUD:HUD = new HUD();
		
		
		// Movie clip things are added to for rendering.
		private var w_RenderClip:Sprite;
		
		// List of game objects
		private var gameObjects:Array = new Array();
		
		private var scrollingBack:ScrollingBackground;
		
		private var AllWeapons:WeaponDef = new WeaponDef();
		private var Animations:AnimDef = new AnimDef();
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
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
			
			// Set up HUD
			theHUD.y = 240 - 26;
			theHUD.AddNewStatusBar(50, 50, 0xFF0000);
			theHUD.AddNewStatusBar(50, 50, 0x00FF00);
			theHUD.AddNewStatusBar(50, 50, 0x0000FF);
			
			// Load Animations
			Animations.InitAnims(g_ImageManager);
			// Initialize Weapons
			AllWeapons.InitWeapons(g_ImageManager, g_SoundManager, w_RenderClip, theHUD, gameObjects);			
			
			// Add scrolling background
			scrollingBack = new ScrollingBackground();
			w_RenderClip.addChild(scrollingBack);
			

			
			var thePlayer:GameObject = new GameObject("Ship.png", g_ImageManager, gameObjects);
			var PlayerWeapons:Array = new Array;
			
			thePlayer.Init();
			thePlayer.x = 320 / 2 - 32;
			thePlayer.y = 240 - 64;
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
			var dh:DamageHandler = new DamageHandler(thePlayer, false, true, 100, 0, 0, 30);
			dh.theHUDBar = theHUD.statusBars[0]; // set to health bar
			
			// Test Enemy
			var theEnemy:GameObject = new GameObject("Carrot.png", g_ImageManager, gameObjects);
			theEnemy.Init();
			theEnemy.x = 320 / 2 - 16;
			theEnemy.y = 48;
			w_RenderClip.addChild(theEnemy);
			gameObjects.push(theEnemy);
			
			var emv:Movement = new Movement(theEnemy);
			var mp:FollowPattern = new FollowPattern(theEnemy, 3);
			var enemyPattern:Array = new Array;
			enemyPattern.push(new Point(0,0));
			enemyPattern.push(new Point(320, 240));
			mp.PatternCoordinates = enemyPattern;
			
			var edh:DamageHandler = new DamageHandler(theEnemy, true, true, 20, 10, 1);
			edh.DeathAnimation = Animations.explosion_small;
			
			theEnemy.Init();
			
			// Add Weapons
			AllWeapons.mustardSlot.SetOwner(thePlayer);
			PlayerWeapons.push(AllWeapons.mustardSlot);
			
			thePlayer.Init();
			
			w_RenderClip.addChild(theHUD);
			theHUD.Draw();
			
			
			
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
				
				if (gameObjects[i].y < -48 || gameObjects[i].y > 240+48)
				{
					// if something strays too far off screen, kill it.
					w_RenderClip.removeChild(gameObjects[i]);
					gameObjects.splice(i, 1);
					i--;
				}
			}
			
			// Update background
			scrollingBack.Update();
			// And hud
			theHUD.Update();
		}
	
	}

}