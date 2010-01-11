package  
{
	import org.flixel.*;
	
	import Math;
	
	public class PragmaSprite extends FlxSprite
	{	
		[Embed(source="../content/sprites/bregmommy_bw.png")]
		protected var PragmaImage: Class;
		
		public function PragmaSprite(x : Number, y : Number) 
		{
			super(x, y, null);
			
			loadGraphic(PragmaImage, true, false, 24, 32, false);
			addAnimation("walk-up", [1, 0, 1, 2], 3, true); 
			addAnimation("walk-right", [4, 3, 4, 5], 3, true);
			addAnimation("walk-down", [7, 6, 7, 8], 3, true);
			addAnimation("walk-left", [10, 9, 10, 11], 3, true);
		}	
		
		override public function update():void 
		{
			play("walk-" + look_direction());
			
			super.update();
		}
		
		private function look_direction() : String
		{
			var dx : Number = FlxG.mouse.x - this.x;
			var dy : Number = FlxG.mouse.y - this.y;
			
			var l : Number = Math.sqrt(Math.pow(dx, 2) + Math.pow(dy, 2));
			
			var nx : Number = dx / l;
			var ny : Number = dy / l;
			
			var theta : Number = (Math.atan2(ny, nx) * 180.0) / Math.PI;
			var index : int = int(((theta + 45.0) / 90.0) % 4)
			
			switch (index) 
			{
				case 0: return "right"; break;
				case 1: return "down"; break;
				case 2: return "left"; break;
				case 3: return "up"; break;
			}
			
			return "";
		}
	}
}