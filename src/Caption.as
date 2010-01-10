package  
{
	import org.flixel.*;
	
	public class Caption extends FlxCore
	{	
		private var _textSurface : FlxText;
		private var _fadeInRate : Number;
		private var _life : Number;
		private var _fadeOutRate : Number;
		private var _state : String = 'display';
		private var _internalState : String = 'fadeIn';
		
		public function Caption(text : String, x : uint, y : uint, fadeInRate : Number, life : Number, fadeOutRate : Number) 
		{	
			_fadeInRate = fadeInRate;
			_life = life;
			_fadeOutRate = fadeOutRate;
			
			_textSurface = new FlxText(x, y, text.length * 20, text);
			_textSurface.alpha = 0;
		
			active = false;
			visible = false;
		}
		
		public function get text() : FlxText
		{
			return _textSurface;
		}
		
		public function get state() : String
		{
			return _state;
		}
		
		override public function update() : void 
		{
			super.update();
			
			if (_internalState == 'fadeIn') {
				_textSurface.alpha += FlxG.elapsed * _fadeInRate;
				
				if (_textSurface.alpha >= 1) {
					_internalState = 'live';
				}
			} else if (_internalState == 'live') {
				_life -= FlxG.elapsed;
				
				if (_life <= 0) {
					_internalState = 'fadeOut';
				}
			} else if (_internalState == 'fadeOut') {
				_textSurface.alpha -= FlxG.elapsed * _fadeOutRate;
				
				if (_textSurface.alpha <= 0) {
					_internalState = 'done';
				}
			} else if (_internalState == 'done') {
				_state = 'done';
			}
			
			active = _state == 'display';
			visible = _state == 'display';
		}
		
		override public function render() : void 
		{
			super.render();
		
			_textSurface.render();
		}
	}
}