package  
{
	import org.flixel.*;
	
	public class PragmaSprite extends FlxSprite
	{	
		[Embed(source="../content/sprites/bregmommy_bw.png")]
		protected var PragmaImage: Class;
		
		public function PragmaSprite() 
		{
			super(0, 0, null);
			
			loadGraphic(PragmaImage, true, false, 24, 32, false);
			addAnimation("walk-up", [1, 0, 1, 2], 3, true); 
			addAnimation("walk-right", [4, 3, 4, 5], 3, true);
			addAnimation("walk-down", [7, 6, 7, 8], 3, true);
			addAnimation("walk-left", [10, 9, 10, 11], 3, true);
			
			play("walk-up");
		}	
		
		override public function update():void 
		{
			
			
			super.update();
		}
	}
}