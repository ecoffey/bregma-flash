package  
{
	import org.flixel.*;
	
	public class CaptionChain extends FlxCore
	{	
		private var _captions :	Array;
		private var _currentCaption : uint = 0;
		private var _state : String = 'display';
		
		public function CaptionChain(captions : Array) 
		{
			_captions = captions;
			
			for (var i:int = 0; i < _captions.length; i++) 
			{
				FlxG.state.add(_captions[i]);
			}
		}	
		
		public function get state() : String
		{
			return _state;
		}
		
		override public function update() : void 
		{
			super.update();
			
			if (_currentCaption >= _captions.length) {
				_state = 'done';
				return;
			}
			
			var caption : Caption = Caption(_captions[_currentCaption]);
			
			if (caption.state == 'display') {
				caption.active = true;
			} else if (caption.state == 'done') {
				_currentCaption++;
			}
		}
	}
}