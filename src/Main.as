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
		
		// List of collisions
		private var collisionList:Array = new Array();

		
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
		
			// Note to Self:
			// For Parallax Scrolling, have a scrolling manager
			// scrolling manager directly alters the x and y of stuff, but has a master controller object
			// the master controller object is a gameobject and the manager reads its xspeed and stuff and offsets things by their layer.
			
			
			
			// Set up stage scaling
			stage.scaleMode = StageScaleMode.EXACT_FIT;

			// Load Graphics into Image Manager
			g_ImageManager.Load();
			
			// DEBUGGING: Testing Object Subsystems
			
			// Add some platforms
			for (var i:int = 0; i < 320/16; i++)
			{
				var theSolidTile:GameObject = new GameObject("Ground.png", g_ImageManager);
				theSolidTile.Init();
				theSolidTile.x = i*16;
				theSolidTile.y = 200-i*4;
				addChild(theSolidTile);
				var shc:HasCollision = new HasCollision(theSolidTile, collisionList, true); // Collision should be added first.	
			}
			
			var thePlayer:GameObject = new GameObject("RunAnim.gif", g_ImageManager);
			thePlayer.Init();
			thePlayer.x = 50;
			thePlayer.y = 150;
			addChild(thePlayer);
			
			var hc:HasCollision = new HasCollision(thePlayer, collisionList, false); // Collision should be added first.
			var hg:HasGravity = new HasGravity(thePlayer, hc);
			var pc:PlatformerControl = new PlatformerControl(thePlayer, hc); // Linking to collision manager
			var mv:MovementCollides = new MovementCollides(thePlayer, hc); 

			trace(collisionList[0].parentObject);
			
			gameObjects.push(theSolidTile);
			gameObjects.push(thePlayer);
			thePlayer.Init();
			
			// Set up HUD
			var theHUD:HUD = new HUD();
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
		}
		
	}
	
}