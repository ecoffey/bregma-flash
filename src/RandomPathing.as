package
{
	import flash.geom.Point;
	import org.flixel.*;
	
	public class RandomPathing implements IBehavior
	{
		protected var decisionCountdown : Number = 3;
		protected var walkCountdown : Number = 1.5;
		protected var decision : String;
		
		public function RandomPathing() 
		{
			
		}
		
		public function Update(character : Character) : void
		{
			decisionCountdown -= FlxG.elapsed;
			walkCountdown -= FlxG.elapsed;
			if (decisionCountdown <= 0 )
			{
				decisionCountdown = 3*Math.random();
				walkCountdown = 1.5*Math.random();
				character.velocity = new Point(0, 0);
				var i : int = int(Math.random() * 4);
				if (i == 0)
				{
					character.facing = FlxSprite.LEFT;
					character.velocity.x = -20;
					character.play("walk-left");
				}
				else if (i == 1)
				{
					character.facing = FlxSprite.RIGHT;
					character.velocity.x = 20;
					character.play("walk-right");
				}
				else if (i == 2)
				{
					character.velocity.y = 20;
					character.play("walk-down");
					character.facing = FlxSprite.DOWN;
				}
				else
				{
					character.velocity.y = -20;
					character.play("walk-up");
					character.facing = FlxSprite.UP;
				}
			}
			if (walkCountdown < 0)
			{
				character.velocity = new Point(0, 0);
				character.specificFrame(4);
			}
		}
		
	}

}