package Subsystems 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author ...
	 */
	public class HasGravity extends ObjectSubsystem 
	{
		
		public function HasGravity(_parent:GameObject) 
		{
			super(_parent);
		}
		
		override public function Init():void
		{
			parentObject.yAccel = 0.98;
			parentObject.maxYSpeed = 150;
		}
		
		// DEBUG WARNING WOOP WOOP WARNING DEBUG WOOP
		override public function Update(e:Event = null):void
		{
			if (parentObject.y > 215)
			{
				parentObject.yAccel = 0;
				parentObject.y = 215
				//parentObject.ySpeed = 0;
			}
			else
			{
				parentObject.yAccel = 0.98;
			}
		}
				
		
	}

}