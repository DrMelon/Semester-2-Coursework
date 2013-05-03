package  
{
	import flash.events.Event;
	/**
	 * ...
	 * @author J.Brown
	 */
	public class ObjectSubsystem 
	{
		// The ObjectSubsystem class allows any gameobject to have behaviours without creating specific classes for the objects themselves:
		// I'm using Composition over Inheritance-Based object managment.
		// Basically, all base objects are the same, except that they have a list of subsystems that are run each frame or alter behaviours.
		// For example, there could be a subsystem HasGravity which causes an object to fall.
		// It'd continue to fall unless it was stopped by a Collides subsystem, which would also be on say, platforms or solid ground.
		// This approach allows greater flexibility in designing objects as it allows one generic class whose behaviours are defined at run-time:
		// Opening up the possibilities of procedurally generated behaviours or properties.
		
		// Every subsystem knows who its parent is.
		public var parentObject:GameObject;
		
		public function ObjectSubsystem(_parent:GameObject ) 
		{
			if (_parent != null)
			{
				parentObject = _parent;
				parentObject.subsystems.push(this); // Add to Parent
			}
			
		}
		
		public function Init():void
		{
			// Any setup a subsystem needs to do is done here.
		}
		
		public function Update(e:Event = null):void
		{
			// Anything a subsystem does during the update loop is done here.
		}
		
		public function Draw():void
		{
			// Anything a subsystem does during the draw loop is done here.
		}
		
		
		
		
	}

}