package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Weapon extends Sprite
	{
		// The Weapon class controls various things like type of bullet, rate of fire, and team (player/allies VS enemies)
		// Bullets are in their own class and handle damage, speed and so on.
		
		public var bulletType:Bullet;
		public var rateOfFire:Number;
		public var currentFire:Number;
		public var team:Number;
		
		public var CurrentBullets:Array = new Array;
		
		
		
		public var soundToPlay:String;
		
		public function Weapon(_bt:Bullet, _rof:Number, _team:Number, _soundToPlay:String) 
		{
			bulletType = _bt;
			rateOfFire = _rof;
			currentFire = 0;
			team = _team;
			
			soundToPlay = _soundToPlay;
		}
		
		public function FireBullet(doubleShot:Boolean):Boolean
		{
			
			if (currentFire == 0)
			{
				var numToShoot:Number = 1;
				if (rateOfFire < 1)
				{
					// Shoot multiple bullets in one frame if ROF < 1
					numToShoot = (1 - rateOfFire)*10*2;
					
					
				}
				
				for (var i:int = 0; i < numToShoot; i++)
				{
					// Shoot a bullet, copying the parameters of the type
					var newBullet:Bullet = new Bullet(bulletType.imageID, bulletType.bulletSpeed, bulletType.bulletTeam, bulletType.bulletDamage);
					newBullet.x = x;
					newBullet.y = y;
					if (rateOfFire < 1)
					{
						//add spread to bullets & rotation
						newBullet.bulletSpread = 1 - rateOfFire;
						newBullet.rotation = (Math.random() * 360) - 180;
					}
					
					// Add bullet to renderclip
					Globals.vars.w_RenderClip.addChild(newBullet);
					
					newBullet.Init();
					// Add Bullet to objects list
					Globals.vars.gameObjects.push(newBullet);
					
					if (doubleShot == false)
					{
						currentFire = rateOfFire;
						if (rateOfFire < 1)
						{
							currentFire = 1;
						}
						
					}
					
					//Play Sound
					Globals.vars.g_SoundManager.PlaySoundByKeyword(soundToPlay);
					return true;
				}
				
				
				

			}
			
			return false;
		}
		
		public function Update(e:Event = null):void
		{
			
			if (currentFire > 0)
			{
				currentFire--;
			}
		}
		
	}

}