package  
{
	import org.flixel.*;
	
	public class Caption
	{	
		private var _textSurface : FlxText;
		private var _life : Number;
		private var _state : String = 'display';
		
		public function Caption(text : String, x : uint, y : uint, life : Number) 
		{	
			_life = life;
			_textSurface = new FlxText(x, y, text.length * 20, text);
		}
		
		public function get text() : FlxText
		{
			return _textSurface;
		}
		
		public function get state() : String
		{
			return _state;
		}
		
		public function on_update() : void
		{
			trace(FlxG.elapsed);
			
			_life -= FlxG.elapsed;
			
			if (_life <= 0) {
				_state = 'done';
			}
		}
	}
}