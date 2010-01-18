﻿package  
{
	import org.flixel.*;
	
	public class IntroState extends FlxState
	{
		private var _captionChain : CaptionChain;
		
		public function IntroState() 
		{
			_captionChain = new CaptionChain([
				new Caption("\"Bregma\"", FlxG.width/2-50, FlxG.height/2-10, 1.0, 1.5, 1.0),
				new Caption("A Tradgedy in Two Acts", FlxG.width/2-50,  FlxG.height/2 - 10, 1.0, 1.5, 1.0)
			]);
			
			add(_captionChain);
			FlxG.playMusic(Music.Prelude);
		}
		
		override public function update() : void
		{
			super.update();
			
			if (FlxG.mouse.justPressed() ||
				_captionChain.state == 'done') {
				FlxG.switchState(PlayState);
			}
		}
	}
}