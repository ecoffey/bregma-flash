package  
{
	import flash.geom.Point;
	import org.flixel.*;
	
	import Math;
	
	public class PragmaSprite extends Character
	{	
		protected static var SPEED : Number = 60;
		protected static var ANIMATION_SPEED : Number = 12;
		
		[Embed(source="../content/sprites/pragma_smal.png")]
		protected var PragmaImage: Class;
		
		public function PragmaSprite(x : Number, y : Number) 
		{
			super(x, y, null);
			
			loadGraphic(PragmaImage, true, false, 16, 16, false);
			
			addAnimation("walk-up", [1, 0, 1, 2], ANIMATION_SPEED, true); 
			addAnimation("walk-right", [4, 3, 4, 5], ANIMATION_SPEED, true);
			addAnimation("walk-down", [7, 6, 7, 8], ANIMATION_SPEED, true);
			addAnimation("walk-left", [10, 9, 10, 11], ANIMATION_SPEED, true);
		
			addAnimation("idle-up", [1], 1, false);
			addAnimation("idle-right", [4], 1, false);
			addAnimation("idle-down", [7], 1, false);
			addAnimation("idle-left", [10], 1, false);
		}	
		
		
		override public function update():void 
		{
			var action : String = "idle";
			var direction : String = look_direction();
			
			velocity = new Point(0, 0);
			
			if (FlxG.keys.pressed('W')) {
				velocity.y -= SPEED;
				action = "walk";
			} 
			if (FlxG.keys.pressed('S')) {
				velocity.y += SPEED;
				action = "walk";
			} 
			if (FlxG.keys.pressed('A')) {
				velocity.x -= SPEED;
				action = "walk";
			} 
			if (FlxG.keys.pressed('D')) {
				velocity.x += SPEED;
				action = "walk";
			}
			
			play(action + "-" + direction);
			
			super.update();
		}
		
		private function look_direction() : String
		{
			var dx : Number = FlxG.mouse.x - this.x;
			var dy : Number = FlxG.mouse.y - this.y;
			
			var l : Number = Math.sqrt(Math.pow(dx, 2) + Math.pow(dy, 2));
			
			var nx : Number = dx / l;
			var ny : Number = dy / l;
			
			if (Math.abs(nx) > Math.abs(ny)) {
				return (nx > 0) ? 'right' : 'left';
			} else {
				return (ny > 0) ? 'down' : 'up';
			}
		}
	}
}