﻿package  
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
			var animation : String = "walk-" + look_direction();
			
			trace(animation);
			
			play(animation);
			
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