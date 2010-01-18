package  
{
	import flash.geom.Point;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Ian
	 */
	public class Cat extends FlxSprite
	{
		[Embed(source="../content/sprites/cat.png", mimeType="image/png")]
		public static var CatImage:Class;
		
		protected var decisionCountdown : Number = 3;
		protected var walkCountdown : Number = 1.5;
		protected var decision : String;

		
		public function Cat(x:Number, y:Number)
		{
			super(x, y,  null);
			this.loadGraphic(CatImage, true, false, 12, 16, false);
			this.addAnimation("walk-up", [1, 0, 1, 2], 6, true); 
			this.addAnimation("walk-right", [4, 3, 4, 5], 6, true);
			this.addAnimation("walk-down", [7, 6, 7, 8], 6, true);
			this.addAnimation("walk-left", [10, 9, 10, 11], 6, true);
			this.offset.x = 12;
			this.offset.y = 16;
			this.specificFrame(7);
		}
		
		public override function update() : void
		{
			super.update();
			
			decisionCountdown -= FlxG.elapsed;
			walkCountdown -= FlxG.elapsed;
			if (decisionCountdown <= 0 )
			{
				decisionCountdown = 3*Math.random();
				walkCountdown = 1.5*Math.random();
				velocity = new Point(0, 0);
				var i : int = int(Math.random() * 4);
				if (i == 0)
				{
					velocity.x = -20;
					this.play("walk-left");
				}
				else if (i == 1)
				{
					velocity.x = 20;
					this.play("walk-right");
				}
				else if (i == 2)
				{
					velocity.y = 20;
					this.play("walk-down");
				}
				else
				{
					velocity.y = -20;
					this.play("walk-up");
				}
			}
			if (walkCountdown < 0)
			{
				velocity = new Point(0, 0);
				this.specificFrame(7);
			}
			
			
		}
		
		
		
	}

}