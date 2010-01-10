package  
{
	import org.flixel.*;
	
	public class IntroState extends FlxState
	{
		public function IntroState() 
		{
			super();
			
			add(new FlxText(0, 0, 100, "Bregma"));
		}		
	}
}