package Subsystems 
{
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;
	import Defines.*;
	/**
	 * ...
	 * @author ...
	 */
	public class DamageHandler extends ObjectSubsystem 
	{
		// The DamageHandler class contains vital information for objects that can cause and recieve damage.
		// For example, enemies can both cause and recieve damage - they cause damage to the player when they are touched, and they can be blown up by the player.
		// Bullets only ever cause damage, and the player only ever recieves damage.
		
		public var CausesDamage:Boolean;
		public var RecievesDamage:Boolean;
		public var MaxHealth:Number;
		public var Health:Number;
		public var Damage:Number;
		public var theHUDBar:StatusBar = null; // for player's HUD, maybe also boss indicator.
		public var InvincibilityFrames:Number; // How many frames of invincibility the object has; if this is > 0, the object will blink on and off
		public var CurrentInvincibility:Number;
		public var HasBeenHit:Boolean;
		public var Team:Number; // which team it's on - enemies shouldn't damage enemies
		public var DeathAnimation:Array = new Array(); // death anim
		public var Dead:Boolean;

		
		public function DamageHandler(_parent:GameObject, _CausesDamage:Boolean, _RecievesDamage:Boolean, _MaxHealth:Number, _Damage:Number, _Team:Number, _Invincibility:Number = 0) 
		{
			super(_parent);
			CausesDamage = _CausesDamage;
			RecievesDamage = _RecievesDamage;
			MaxHealth = _MaxHealth;
			Health = MaxHealth;
			Damage = _Damage;
			Team = _Team;
			InvincibilityFrames = _Invincibility;
			CurrentInvincibility = _Invincibility;
			Dead = false;
			
			
		}
		
		public function TakeDamage(activator:DamageHandler):Boolean
		{
			if (Dead)
			{
				return false;
			}
			//Can only take damage from another damagehandler
			if (RecievesDamage && activator.CausesDamage && activator.Damage > 0 && activator.Team != this.Team && HasBeenHit == false)
			{
				if (Health > 0)
				{
					Health -= activator.Damage;
					HasBeenHit = true;
					if (Health <= 0)
					{
						Health = 0;
						Die();
					}
				}
				return true;
			}
			return false;
		}
		
		public function Die():void
		{
			trace(this + " died!");
			if (DeathAnimation.length > 0)
			{
				// Show an explosion!
				var sa:ShowAnimation = new ShowAnimation(parentObject, DeathAnimation, 2, false);
				// Remove any movement subsystem.
				for (var i:int = 0; i < parentObject.subsystems.length; i++)
				{
					if (getQualifiedClassName(parentObject.subsystems[i]) == "Subsystems::Movement")
					{
						parentObject.subsystems.splice(i, 1)
						i--;
					}
				}
			}
			Dead = true;
			
		}
		
		public function CauseDamage(target:GameObject):void
		{
			if (Dead)
			{
				return;
			}
			//See if the target gameobject has a damagehandler, and if so, make it take damage.
			for (var i:int = 0; i < target.subsystems.length; i++)
			{
				if (getQualifiedClassName(target.subsystems[i]) == "Subsystems::DamageHandler")
				{
					if (target.subsystems[i].TakeDamage(this))
					{
						if (Health == 0)
						{
							// If we have no health, we're likely to be a bullet. So we die.
							Die();
						}
					}
				}
			}

		}
		
		override public function Update(e:Event = null):void
		{
			//Check for collisions against other objects.
			for (var i:int = 0; i < parentObject.gameObjects.length; i++)
			{
				if (parentObject != parentObject.gameObjects[i])
				{
					if (parentObject.hitTestObject(parentObject.gameObjects[i]))
					{
						this.CauseDamage(parentObject.gameObjects[i]);
						
					}
				}
			}
			
			
			if (InvincibilityFrames > 0)
			{
				if (HasBeenHit == true) // if we've been hit and we have invincibility frames
				{
					if (CurrentInvincibility > 0)
					{
						CurrentInvincibility--;
						if ( (CurrentInvincibility % 4) == 0)
						{
							parentObject.visible = !parentObject.visible; // blink on and off
						}
					}
					else
					{
						CurrentInvincibility = InvincibilityFrames;
						HasBeenHit = false;
					}
				}
			}
			else
			{
				HasBeenHit = false;
				parentObject.visible = true; //prevent blink being permanently off
			}
			
			
			if (Health > MaxHealth)
			{
				Health = MaxHealth;
			}
			
			if (theHUDBar != null)
			{
				theHUDBar.maxValue = MaxHealth;
				theHUDBar.value = Health;
			}
		}
		
	}

}