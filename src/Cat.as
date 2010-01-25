package  
{
	import flash.geom.Point;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Ian
	 */
	public class Cat extends Character
	{
		[Embed(source="../content/sprites/cat.png", mimeType="image/png")]
		public static var CatImage:Class;
		
		protected var decisionCountdown : Number = 3;
		protected var walkCountdown : Number = 1.5;
		protected var decision : String;
		protected var behavior : IBehavior;

		
		public function Cat(x:Number, y:Number, behavior : IBehavior)
		{
			super(x, y,  null);
			this.loadGraphic(CatImage, true, true, 12, 12, false);
			this.addAnimation("walk-up", [7, 6, 7, 8], 6, true); 
			this.addAnimation("walk-right", [1, 0, 1, 2], 6, true);
			this.addAnimation("walk-down", [4, 3, 4, 5], 6, true);
			this.addAnimation("walk-left", [1, 0, 1, 2], 6, true);
			this.specificFrame(7);
			
			this.behavior = behavior;
		}
		
		
		public override function update() : void
		{
			super.update();
		
			behavior.Update(this);
		}
	}

}