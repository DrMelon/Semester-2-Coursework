package Subsystems 
{
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
		
		override public function Update():void
		{
			parentObject.y += 1;
		}
		
		
	}

}