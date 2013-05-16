package  
{
	import Defines.AnimDef;
	import Defines.WeaponDef;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.media.Sound;
	import Subsystems.AutoFireWeapon;
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
		
		
		
		public var SetToGenerate:Number = 0;
		public var SetList:Array = new Array(0, 1, 1, 0, 2, 2, 3, 1, 4, 4, 2, 1, 3, 0, 2, 3, 2, 2, 4, 1, 4, 2, 4, 3, 0, 1, 0, 2, 3, 4, 2, 1, 0, 2, 4, 2, 4, 2, 1, 5, 0);
		public var SetCounter:Number;
		public var EnemiesInCurrentSet:Array = new Array();
		public var SetDead:Boolean = false;
		public var TimeBetweenSets:Number = 75;
		public var CurrentTimeBetweenSets:Number = 0;
		public var TimeToSpawn:Number = 15; // delay between 
		public var NumOfEnemiesInSet:Number = 5; //
		public var SpawnTimer:Number;
		
		
		public function EnemySpawner() 
		{
			
			
			SpawnTimer = TimeToSpawn;
		
			CurrentTimeBetweenSets = TimeBetweenSets;
			SetCounter = 0;
			
		}
		
		public function Update(e:Event = null):void
		{
			if (SetCounter < SetList.length - 1)
			{
				SetToGenerate = SetList[SetCounter];
				if (CurrentTimeBetweenSets == 0)
				{
					if (SpawnTimer == 0)
					{
						SpawnTimer = TimeToSpawn;
						switch(SetToGenerate)
						{
							case 0:
								// Carrot Ships, Moving down, then right, then down again.
								if (NumOfEnemiesInSet > 0)
								{
									NumOfEnemiesInSet--;
									AddEnemyOnPath(0, 0);							
								}
								if (NumOfEnemiesInSet == 0)
								{
									//Clear Current Set
									SetCounter++;
									EnemiesInCurrentSet = new Array();
									NumOfEnemiesInSet = 5;
									CurrentTimeBetweenSets = TimeBetweenSets;
								}
								break;
							case 1: // Carrot Ships, Going Down-Left-Down
								if (NumOfEnemiesInSet > 0)
								{
									NumOfEnemiesInSet--;
									AddEnemyOnPath(0, 1);							
								}
								if (NumOfEnemiesInSet == 0)
								{
									//Clear Current Set
									SetCounter++;
									EnemiesInCurrentSet = new Array();
									NumOfEnemiesInSet = 5;
									CurrentTimeBetweenSets = TimeBetweenSets;
								}		
								break;
							case 2: // V-Shape of Lettuces
								if (NumOfEnemiesInSet > 0)
								{
									NumOfEnemiesInSet--;
									if(NumOfEnemiesInSet == 2)
									{
										AddEnemy(1, 160-64, -16);
										AddEnemy(1, 160+64, -16);
									}
									else if (NumOfEnemiesInSet == 3)
									{
										AddEnemy(1, 160-32, -16);
										AddEnemy(1, 160+32, -16);
									}
									else if (NumOfEnemiesInSet == 4)
									{
										AddEnemy(1, 160, -16);
									}
									
								}
								if (NumOfEnemiesInSet == 0)
								{
									//Clear Current Set
									SetCounter++;
									EnemiesInCurrentSet = new Array();
									NumOfEnemiesInSet = 5;
									CurrentTimeBetweenSets = TimeBetweenSets;
								}		
								break;
							case 3: // Corner-Visiting Lettuces
								if (NumOfEnemiesInSet > 0)
								{
									NumOfEnemiesInSet--;
									AddEnemyOnPath(1, 2);
								}
								if (NumOfEnemiesInSet == 0)
								{
									//Clear Current Set
									SetCounter++; 
									EnemiesInCurrentSet = new Array();
									NumOfEnemiesInSet = 5;
									CurrentTimeBetweenSets = TimeBetweenSets;
								}		
								break;		
							case 4: // Pumpkin Ships Ivading!
								if (NumOfEnemiesInSet > 0)
								{
									NumOfEnemiesInSet--;
									if (NumOfEnemiesInSet < 1)
									{
										// Random pathing
										AddEnemyOnPath(2, (Math.round(Math.random()*2)));
									}
								}
								if (NumOfEnemiesInSet == 0)
								{
									//Clear Current Set
									SetCounter++;
									EnemiesInCurrentSet = new Array();
									NumOfEnemiesInSet = 5;
									CurrentTimeBetweenSets = TimeBetweenSets;
								}		
								break;	
							case 5: // IT'S THE BOSS!
								if (NumOfEnemiesInSet > 0)
								{
									NumOfEnemiesInSet--;
									if (NumOfEnemiesInSet == 1)
									{
										// BOSS TIME! 
										AddEnemy(3, 0, 0);
									}	
								}
								if (NumOfEnemiesInSet == 0)
								{
									SetCounter++;
									EnemiesInCurrentSet = new Array();
									NumOfEnemiesInSet = 5;
									CurrentTimeBetweenSets = TimeBetweenSets;
								}
								break;
								
						}
					}
					SpawnTimer--;
				}
				if (CurrentTimeBetweenSets > 0)
				{
					CurrentTimeBetweenSets--;
				}
				
			}
		}
		
		public function AddEnemy(enemyType:int, xPos:int, yPos:int):void
		{
			var thisEnemy:GameObject;
			switch(enemyType)
			{
				case 0: // Carrot Ship
					thisEnemy = new GameObject("Carrot.png");
					var dc:DamageHandler = new DamageHandler(thisEnemy, true, true, 15, 10, 1, 0);
					dc.DeathAnimation = Globals.vars.Animations.explosion_16x16;
					dc.DeathSound = "enemyship_blowup.mp3";
					dc.Score = 50;
					var mv:Movement = new Movement(thisEnemy);		
					thisEnemy.ySpeed = 3;
					thisEnemy.maxYSpeed = 3;
					thisEnemy.yAccel = 1;
					break;
				case 1: // Lettuce
					thisEnemy = new GameObject("Lettuce.png");
					var dc:DamageHandler = new DamageHandler(thisEnemy, true, true, 25, 5, 1, 0);
					dc.DeathAnimation = Globals.vars.Animations.explosion_16x16;
					dc.DeathSound = "enemyship_blowup.mp3";
					dc.Score = 100;
					var mv:Movement = new Movement(thisEnemy);
					thisEnemy.ySpeed = 0;
					thisEnemy.maxYSpeed = 2;
					thisEnemy.yAccel = 0.04;
					break;
				case 2: // Pumpkin Ship
					thisEnemy = new GameObject("PumpkinShip.png");
					var dc:DamageHandler = new DamageHandler(thisEnemy, true, true, 50, 10, 1, 0);
					dc.DeathAnimation = Globals.vars.Animations.explosion_16x16; //want bigger explosion
					dc.DeathSound = "enemyship_blowup.mp3";
					dc.Score = 350;
					var mv:Movement = new Movement(thisEnemy);
					thisEnemy.ySpeed = 0;
					thisEnemy.maxYSpeed = 0.6;
					thisEnemy.yAccel = 0.04;
				case 3: // Pizza Boss
					thisEnemy = new GameObject("Pizza.png");
					var dc:DamageHandler = new DamageHandler(thisEnemy, true, true, 1500, 10, 1, 0);
					//Death Animation & Death Sound
					dc.Score = 15000;
					// Add Healthbar to HUD
					Globals.vars.theHUD.AddNewStatusBar(1500, 1500, 0xFF0077);
					Globals.vars.theHUD.statusBars[3].x = 150;
					Globals.vars.theHUD.statusBars[3].y = Globals.vars.theHUD.statusBars[2].y;
					Globals.vars.w_RenderClip.addChild(Globals.vars.theHUD.statusBars[3]);
					dc.theHUDBar = Globals.vars.theHUD.statusBars[3];
					dc.Boss = true;
					var af:AutoFireWeapon = new AutoFireWeapon(thisEnemy, Globals.vars.Weapons.danmakuCannonSlot);
					
					//shock pause & warning display
					var warnCard:GameObject = new GameObject("Warning.png");
					warnCard.x = (320 / 2) - warnCard.myBitmap.width;
					warnCard.y = (240 / 2) - warnCard.myBitmap.height;
					var mv:Movement = new Movement(warnCard);
					var pt:FollowPattern = new FollowPattern(warnCard, 5);
					var p1:Point = new Point(500, (240 / 2) - warnCard.myBitmap.height);
					var pth:Array = new Array;
					pth.push(p1);
					pt.PatternCoordinates = pth;
					warnCard.Init();
					Globals.vars.w_RenderClip.addChild(warnCard);
					Globals.vars.gameObjects.push(warnCard);
					Globals.vars.ShockPause = 50;
					
					
					
					
					
			}
			// Add to lists and update position.
			
			thisEnemy.x = xPos;
			thisEnemy.y = yPos;
			thisEnemy.Init();
			Globals.vars.w_RenderClip.addChild(thisEnemy);
			EnemiesInCurrentSet.push(thisEnemy);
			Globals.vars.gameObjects.push(thisEnemy);			
		}
		
		public function AddEnemyOnPath(enemyType:int, pathNumber:int):void
		{
			var thisEnemy:GameObject;
			switch(enemyType)
			{
				case 0: // Carrot Ship
					thisEnemy = new GameObject("Carrot.png");
					var dc:DamageHandler = new DamageHandler(thisEnemy, true, true, 15, 10, 1, 0);
					dc.DeathAnimation = Globals.vars.Animations.explosion_16x16;
					dc.DeathSound = "enemyship_blowup.mp3";
					dc.Score = 50;
					var mv:Movement = new Movement(thisEnemy);							
					break;
				case 1: // Lettuce
					thisEnemy = new GameObject("Lettuce.png");
					var dc:DamageHandler = new DamageHandler(thisEnemy, true, true, 25, 5, 1, 0);
					dc.DeathAnimation = Globals.vars.Animations.explosion_16x16;
					dc.DeathSound = "enemyship_blowup.mp3";
					dc.Score = 100;
					var mv:Movement = new Movement(thisEnemy);		
					break;
				case 2: // Pumpkin Ship
					thisEnemy = new GameObject("PumpkinShip.png");
					var dc:DamageHandler = new DamageHandler(thisEnemy, true, true, 50, 10, 1, 0);
					dc.DeathAnimation = Globals.vars.Animations.explosion_16x16; //want bigger explosion
					dc.DeathSound = "enemyship_blowup.mp3";
					dc.Score = 350;
					var mv:Movement = new Movement(thisEnemy);
					var af:AutoFireWeapon = new AutoFireWeapon(thisEnemy, Globals.vars.Weapons.enemyPumpkinSlot);
					break;
				}
		
			// Add path
			var path:Array = new Array();
			var pc:FollowPattern = new FollowPattern(thisEnemy, 4);
			switch(pathNumber)
			{
				case 0:
					//Down, Right, Down
					thisEnemy.x = 16;
					thisEnemy.y = -16;
					var p1:Point = new Point(16, 110);
					var p2:Point = new Point(260, 110);
					var p3:Point = new Point(260, 400);		
					path.push(p1, p2, p3);				
					break;
				case 1:
					//Down, Left, Down
					thisEnemy.x = 260;
					thisEnemy.y = -16;
					var p1:Point = new Point(260, 110);
					var p2:Point = new Point(16, 110);
					var p3:Point = new Point(16, 400);		
					path.push(p1, p2, p3);
					break;
				case 2:
					//Down, Up Right, Down, Up Left, repeat
					thisEnemy.x = 16;
					thisEnemy.y = -16;
					var p1:Point = new Point(16, 216);
					var p2:Point = new Point(260, 16);
					var p3:Point = new Point(260, 216);
					var p4:Point = new Point(16, 16);
					path.push(p1, p2, p3, p4);
					pc.Looping = true;
					break;
		
											
			}
			
			pc.PatternCoordinates = path;	
			
			
			thisEnemy.Init();
			Globals.vars.w_RenderClip.addChild(thisEnemy);
			EnemiesInCurrentSet.push(thisEnemy);
			Globals.vars.gameObjects.push(thisEnemy);		
			
			
			
			
		}
		
	}

}