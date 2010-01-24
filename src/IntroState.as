package  
{
	import org.flixel.*;
	
	public class IntroState extends FlxState
	{
		private var _captionChain : CaptionChain;
		
		public function IntroState() 
		{
			_captionChain = new CaptionChain([
				new Caption("\"Bregma\"", FlxG.width/2-25, FlxG.height/2-10, 1.0, 1.5, 1.0),
				new Caption("Where are you Bregma?", FlxG.width / 2 - 60,  FlxG.height / 2 - 10, 1.0, 1.5, 1.0),
				new Caption("Act One: Spring", FlxG.width/2-40,  FlxG.height/2 - 10, 1.0, 1.5, 1.0)
			]);
			
			add(_captionChain);
			FlxG.playMusic(Music.Prelude);
		}
		
		override public function update() : void
		{
			super.update();
			
			if (FlxG.mouse.justPressed())
			{
				_captionChain.skip();
			}
			
			if(_captionChain.state == 'done') 
			{
					
				FlxG.switchState(PlayState);
			}
		}
	}
}