package  
{
	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import Subsystems.ShowAnimation;
	
	/**
	 * ...
	 * @author ...
	 */
	public class LoadsOfExplosions extends GameObject 
	{
		//L, O, D, S, OF, S, P, L, O, SHUNS!
		// WHAT'S THAT SPELL? LOADS OF EXPLOSIONS, PROB'LY.
		public var ExplosionTimer:Number = 0;
		public var MaxTime:Number = 5000;
		
		public function LoadsOfExplosions() 
		{
			super("explosion_small_1.png");
			//stop the music
			Globals.vars.g_SoundManager.musicChannel.stop();
			trace("BANG.");
		}
		
		override public function Update(e:Event = null):void
		{
			
			ExplosionTimer++;
			if (ExplosionTimer >= MaxTime)
			{
				return;
			}
			// Pick a random place and explosion, increasing the number of explosions per frame depending on how close we are to the max time
			var numOfExplosions:int;
			numOfExplosions = (ExplosionTimer / MaxTime) * 25;
			if (numOfExplosions < 1)
			{
				numOfExplosions = 1;
			}
			
			for (var i:int = 0; i < numOfExplosions; i++)
			{
				var thisExplosion:GameObject = new GameObject("explosion_small_1.png");
				var explosionToUse:int = Math.random() * 2;
				var anim:ShowAnimation = new ShowAnimation(thisExplosion, Globals.vars.Animations.explosion_small, 2, false);
				switch(Math.abs(explosionToUse))
				{
					case 0:
						anim.AnimFrames = Globals.vars.Animations.explosion_small;
						break;
					case 1:
						anim.AnimFrames = Globals.vars.Animations.explosion_16x16;
						break;		
				}
				
				// Random position
				thisExplosion.x = Math.random() * 320;
				thisExplosion.y = Math.random() * 16;
				Globals.vars.w_RenderClip.addChild(thisExplosion);
				Globals.vars.gameObjects.push(thisExplosion);
				thisExplosion.Init();
				
				
			}
			
			// Play sound
			if (ExplosionTimer < 500)
			{
				trace("Single");
				Globals.vars.g_SoundManager.PlaySoundByKeyword("boss_explode_startfreq.mp3");
			}
			else if (ExplosionTimer < 1500)
			{
				Globals.vars.g_SoundManager.PlaySoundByKeyword("boss_explode_frequent.mp3");
			}
			else if (ExplosionTimer < 3500)
			{
				Globals.vars.g_SoundManager.PlaySoundByKeyword("boss_explode_med.mp3");
			}
			else if (ExplosionTimer == MaxTime - 1)
			{
				Globals.vars.g_SoundManager.PlaySoundByKeyword("boss_explode_end.mp3");
			}
			
			
			
		}
		
	}

}