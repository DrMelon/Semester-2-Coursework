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
	
		
		public function Weapon(_bt:Bullet, _rof:Number, _team:Number) 
		{
			bulletType = _bt;
			rateOfFire = _rof;
			currentFire = 0;
			team = _team;
		}
		
		public function FireBullet(doubleShot:Boolean, w_RenderClip:Sprite):Boolean
		{
			if (currentFire == 0)
			{
				// Shoot a bullet, copying the parameters of the type
				var newBullet:Bullet = new Bullet(bulletType.imageID, bulletType.bulletSpeed, bulletType.bulletTeam, bulletType.managerInstance);
				newBullet.x = x;
				newBullet.y = y;
				
				// Add bullet to renderclip
				w_RenderClip.addChild(newBullet);
				
				newBullet.Init();
				// Add Bullet to objects list
				CurrentBullets.push(newBullet);
				
				if (doubleShot == false)
				{
					currentFire = rateOfFire;
				}
				
				return true;

			}
			
			return false;
		}
		
		public function Update(e:Event = null):void
		{
			for (var i:int = 0; i < CurrentBullets.length; i++)
			{
				CurrentBullets[i].Update(e);
				if (CurrentBullets[i].y > 260 || CurrentBullets[i].y < -40)
				{
					CurrentBullets.splice(i, 1);
					i -= 1;
				}
			}
			if (currentFire > 0)
			{
				currentFire--;
			}
		}
		
	}

}