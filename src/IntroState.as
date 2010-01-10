package  
{
	import org.flixel.*;
	
	public class IntroState extends FlxState
	{
		private var _captionChain : CaptionChain;
		
		public function IntroState() 
		{
			_captionChain = new CaptionChain(new Array(new Caption("Hello World", 10, 10, 1.5)));
			
			add(_captionChain);
		}
		
		override public function update() : void
		{
			super.update();
			
			if (FlxG.mouse.justPressed()) {
				FlxG.switchState(PlayState);
			}
			
			if (_captionChain.state == 'done') {
				FlxG.switchState(PlayState);
			}
		}
	}
}