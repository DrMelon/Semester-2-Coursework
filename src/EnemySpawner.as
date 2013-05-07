package  
{
	import Defines.AnimDef;
	import Defines.WeaponDef;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.media.Sound;
	import Subsystems.DamageHandler;
	import Subsystems.FollowPattern;
	import Subsystems.Movement;
	/**
	 * ...
	 * @author ...
	 */
	public class EnemySpawner 
	{
		// There is a single instance of this class, which constantly generates sets of enemies.
		
		public var w_RenderClip:Sprite;
		public var g_ImageManager:ImageManager;
		public var g_SoundManager:SoundManager;
		public var AnimDefs:AnimDef;
		public var WeaponDefs:WeaponDef;
		public var gameObjects:Array;
		
		public var SetToGenerate:Number = 0;
		public var SetList:Array = new Array();
		public var EnemiesInCurrentSet:Array = new Array();
		public var SetDead:Boolean = false;
		public var TimeToSpawn:Number = 15; // delay between 
		public var NumOfEnemiesInSet:Number = 5; //
		public var SpawnTimer:Number;
		
		
		public function EnemySpawner(_rc:Sprite, imageman:ImageManager, soundman:SoundManager, anidef:AnimDef, wepdef:WeaponDef, _gameObjects:Array) 
		{
			w_RenderClip = _rc;
			g_ImageManager = imageman;
			g_SoundManager = soundman;
			AnimDefs = anidef;
			WeaponDefs = wepdef;
			gameObjects = _gameObjects;
			SpawnTimer = TimeToSpawn;
			AnimDefs.InitAnims(g_ImageManager);
			
		}
		
		public function Update(e:Event = null):void
		{
			if (SpawnTimer == 0)
			{
				SpawnTimer = TimeToSpawn;
				switch(SetToGenerate)
				{
					case 0:
						// 5 Carrot Enemies, Moving down, then right, then down again.
						if (NumOfEnemiesInSet > 0)
						{
							NumOfEnemiesInSet--;
							var thisEnemy:GameObject = new GameObject("Carrot.png", g_ImageManager, gameObjects);
							thisEnemy.x = 16;
							thisEnemy.y = -16;
							
							var dc:DamageHandler = new DamageHandler(thisEnemy, true, true, 15, 10, 1, 0);
							var mv:Movement = new Movement(thisEnemy);
							// Path
							var path:Array = new Array();
							var p1:Point = new Point(16, 110);
							var p2:Point = new Point(260, 110);
							var p3:Point = new Point(260, 400);		
							path.push(p1, p2, p3);
							var pc:FollowPattern = new FollowPattern(thisEnemy, 4);
							pc.Looping = false;
							pc.PatternCoordinates = path;
							dc.DeathAnimation = AnimDefs.explosion_16x16;
							thisEnemy.Init();
							w_RenderClip.addChild(thisEnemy);
							EnemiesInCurrentSet.push(thisEnemy);
							gameObjects.push(thisEnemy);
						}
						else
						{
							//Clear Current Set, change to set 1.
							EnemiesInCurrentSet = new Array();
							NumOfEnemiesInSet = 5;
							SetToGenerate = 0;
						}
				}
			}
			
			SpawnTimer--;
		}
		
	}

}