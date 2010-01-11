package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Ian
	 */
	public class Cat extends FlxSprite
	{
		[Embed(source="../content/sprites/kid2_bw.png", mimeType="image/png")]
		public static var CatImage:Class;
		
		protected var DecisionCountdown = 2;
		protected var WalkCountdown = 2;
		protected var Decision;
		protected var vx : Number;
		protected var vy : Number;

		
		public function Cat(x:Number, y:Number)
		{
			super(x, y,  null);
			this.loadGraphic(CatImage, true, false, 24, 32, false);
			this.addAnimation("walk-up", [1, 0, 1, 2], 6, true); 
			this.addAnimation("walk-right", [4, 3, 4, 5], 6, true);
			this.addAnimation("walk-down", [7, 6, 7, 8], 6, true);
			this.addAnimation("walk-left", [10, 9, 10, 11], 6, true);
			this.specificFrame(6);
		}
		
		public override function update() : void
		{
			if (Decision == null)
			{
				switch(Decision)
				{
					case "walk-left":
						this.play("walk-left");
						break;
					case "walk-right":
						this.play("walk-right");
				}
			}
			
		}
		
		
		
	}

}