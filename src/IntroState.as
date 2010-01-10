package  
{
	import org.flixel.*;
	
	public class IntroState extends FlxState
	{
		public function IntroState() 
		{
			
		}
		
		override public function update() : void
		{
			super.update();
			
			if (FlxG.mouse.justPressed()) {
				FlxG.switchState(PlayState);
			}
		}
	}
}