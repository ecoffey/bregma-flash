package
{
	import org.flixel.*;
	[SWF(width="768", height="480", backgroundColor="#000000")]
	[Frame(factoryClass = "Preloader")]
	
	public class Bregma extends FlxGame
	{
		[Embed(source = "../content/ui/cursor.png", mimeType = "image/png")] public static var Cursor:Class;
		public function Bregma()
		{
			super(384, 240, MenuState, 2);
			this.showLogo = false;
			this.useDefaultHotKeys = true;
		}
	}

}