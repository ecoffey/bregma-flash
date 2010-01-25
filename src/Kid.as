package  
{
	public class Kid extends Character
	{
		[Embed(source="../content/sprites/kid1.png", mimeType="image/png")]
		public static var KidImage : Class;
		
		private var _behavior : IBehavior;
		
		public function Kid(x : Number, y : Number, behavior : IBehavior)
		{
			super(x, y,  null);
			this.loadGraphic(KidImage, true, true, 24, 32, false);
			addAnimation("walk-up", [1, 0, 1, 2], 6, true); 
			addAnimation("walk-right", [4, 3, 4, 5], 6, true);
			addAnimation("walk-down", [7, 6, 7, 8], 6, true);
			addAnimation("walk-left", [10, 9, 10, 11], 6, true);
			this.specificFrame(7);
			
			_behavior = behavior;
		}	
		
		override public function update():void 
		{
			
			super.update();
			
			_behavior.Update(this);
		}
	}
}