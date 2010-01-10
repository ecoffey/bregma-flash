package
{
	import org.flixel.*;
	[SWF(width="768", height="480", backgroundColor="#000000")]
	[Frame(factoryClass = "Preloader")]
	
	public class Bregma extends FlxGame
	{
		public function Bregma()
		{
			super(384, 240, MenuState, 2);
		}
	}

}