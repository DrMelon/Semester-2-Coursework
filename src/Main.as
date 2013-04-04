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
		
			
			// Set up stage scaling
			stage.scaleMode = StageScaleMode.EXACT_FIT;

			// Load Graphics into Image Manager
			g_ImageManager.Load();
			
			// DEBUGGING: Testing Object Subsystems
			var theSolidTile:GameObject = new GameObject("Ground.png", g_ImageManager);
			theSolidTile.Init();
			theSolidTile.x = 150;
			theSolidTile.y = 50;
			addChild(theSolidTile);
			
			var shc:HasCollision = new HasCollision(theSolidTile, collisionList); // Collision should be added first.			
			
			var theGroundTile:GameObject = new GameObject("RunAnim.gif", g_ImageManager);
			theGroundTile.Init();
			theGroundTile.x = 50;
			theGroundTile.y = 150;
			addChild(theGroundTile);
			
			var hc:HasCollision = new HasCollision(theGroundTile, collisionList); // Collision should be added first.
			var hg:HasGravity = new HasGravity(theGroundTile, hc);
			var pc:PlatformerControl = new PlatformerControl(theGroundTile, hc); // Linking to collision manager

			trace(collisionList[0].parentObject);
			
			gameObjects.push(theSolidTile);
			gameObjects.push(theGroundTile);
			theGroundTile.Init();
			
			// Set up HUD
			var theHUD:HUD = new HUD();
			addChild(theHUD);
			theHUD.AddNewStatusBar(25, 50, 0xFF0000);
			theHUD.AddNewStatusBar(45, 50, 0x00FF00);
			theHUD.AddNewStatusBar(15, 50, 0x0000FF);
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