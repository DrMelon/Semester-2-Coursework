package
{
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import Subsystems.*;
	import Defines.*;
	
	/**
	 * ...
	 * @author J. Brown
	 */
	[SWF(backgroundColor="0xFFFFFF",width="640",height="480")]
	
	public class Main extends Sprite
	{
				
		// HUD
		
		private var theHUD:HUD = new HUD();
		
		// Set up font and score counter.
		[Embed(source = "../fnt/Press-Start-K.ttf", 
				fontName = "Press Start K",
                mimeType = "application/x-font", 
                fontWeight="normal", 
                fontStyle="normal", 
                unicodeRange="U+0020-U+007E", 
                advancedAntiAliasing="true", 
                embedAsCFF="false")]
		private var scoreFont:Class;
		private var formatter:TextFormat = new TextFormat("Press Start K");
		
		
		private var scoreCounter:TextField = new TextField();
		
		
		
		// List of game objects
		private var enemySpawner:EnemySpawner;
		private var powerupSpawner:PowerupSpawner;
		
		
		private var scrollingBack:ScrollingBackground;
		private var thePlayer:GameObject;
		private var playerDamage:DamageHandler;
		
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
			Globals.vars.score = 0;
			Globals.vars.g_ImageManager = new ImageManager();
			Globals.vars.g_SoundManager = new SoundManager();
			Globals.vars.Animations = new AnimDef();
			Globals.vars.Weapons = new WeaponDef();
			Globals.vars.w_RenderClip = new Sprite(); // Everything renders onto this sprite so I can do 2x scaling
			Globals.vars.gameObjects = new Array();
			
			// Set up stage scaling
			stage.scaleMode = StageScaleMode.EXACT_FIT;
			
			// Load Graphics into Image Manager
			Globals.vars.g_ImageManager.Load();
			
			// Set up HUD
			theHUD.y = 240 - 26;
			theHUD.AddNewStatusBar(50, 50, 0xFF0000);
			theHUD.AddNewStatusBar(50, 50, 0x00FF00);
			theHUD.AddNewStatusBar(50, 50, 0x111111);
			formatter.color = 0xFFFFFF;
			formatter.size = 8;
			scoreCounter.embedFonts = true;
			scoreCounter.defaultTextFormat = formatter;
			scoreCounter.textColor = 0xFFFFFF;
			scoreCounter.x = 320 - 112;
			scoreCounter.y = 240 - 12;
			scoreCounter.text = "Score: 0";
			
			
			// Load Animations
			Globals.vars.Animations.InitAnims();
			// Initialize Weapons
			Globals.vars.Weapons.InitWeapons(theHUD);			
			
			// Add scrolling background
			scrollingBack = new ScrollingBackground();
			Globals.vars.w_RenderClip.addChild(scrollingBack);
			

			
			thePlayer = new GameObject("Ship.png");

			thePlayer.Init();
			thePlayer.x = 320 / 2 - 32;
			thePlayer.y = 240 - 64;
			Globals.vars.w_RenderClip.addChild(thePlayer);
			Globals.vars.gameObjects.push(thePlayer);
			

			
			// Add Subsystems
			var mv:Movement = new Movement(thePlayer);
			mv.constrained = true;
			mv.topConstraint = 60;
			mv.botConstraint = 240 - 28;
			mv.leftConstraint = 8;
			mv.rightConstraint = 320 - 8 - thePlayer.width;
			
			var sc:ShmupControl = new ShmupControl(thePlayer, stage);
			playerDamage = new DamageHandler(thePlayer, false, true, 100, 0, 0, 30);
			playerDamage.theHUDBar = theHUD.statusBars[0]; // set to health bar
			
			
			
			//Enemy Spawner
			enemySpawner = new EnemySpawner();
			
			//Powerup spawner
			powerupSpawner = new PowerupSpawner(thePlayer, theHUD);
			
			
			
			// Add Weapons
			Globals.vars.Weapons.mustardSlot.SetOwner(thePlayer);
			thePlayer.Weapons.push(Globals.vars.Weapons.mustardSlot);
			thePlayer.Init();
			
			
			Globals.vars.w_RenderClip.addChild(theHUD);
			theHUD.Draw();
			
			
			
			// Render at 2x Size
			Globals.vars.w_RenderClip.scaleX = 2;
			Globals.vars.w_RenderClip.scaleY = 2;
			
			Globals.vars.w_RenderClip.addChild(scoreCounter);
			addChild(Globals.vars.w_RenderClip);
			
			
			// Start Playing Music
			Globals.vars.g_SoundManager.PlaySoundByKeyword("music.mp3");
		
		}
		
		private function Update(e:Event = null):void
		{
			
			// Check for player death.
			if (playerDamage.Dead)
			{
				//Show game over screen, push button to retry.
				scoreCounter.text = "GAME OVER";
				scoreCounter.textColor = 0x0000FF;
				scoreCounter.x = 60;
				scoreCounter.y = 120 - 32;
				scoreCounter.scaleX = 3;
				scoreCounter.scaleY = 3;
			}
			else
			{
				// Every object in master object list, update
				for (var i:int = 0; i < Globals.vars.gameObjects.length; i++)
				{
					Globals.vars.gameObjects[i].Update(e);
					
					if (Globals.vars.gameObjects[i].y < -48 || Globals.vars.gameObjects[i].y > 240+48)
					{
						// if something strays too far off screen, kill it.
						Globals.vars.w_RenderClip.removeChild(Globals.vars.gameObjects[i]);
						Globals.vars.gameObjects.splice(i, 1);
						i--;
						if (i > Globals.vars.gameObjects.length - 1) // off-by-one catching
						{
							i = Globals.vars.gameObjects.length - 1;
						}
					}
				}
				// Update enemy spawner
				enemySpawner.Update(e);
				// And powerups
				powerupSpawner.Update(e);
				// Update background
				scrollingBack.Update();
				// And hud
				scoreCounter.text = "Score: " + Globals.vars.score;
				theHUD.Update();
				
			}
			
			
		}
	

	}

}