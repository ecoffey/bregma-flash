package  
{
	import org.flixel.*;
	import org.flixel.data.FlxAnim;
	
	/**
	 * ...
	 * @author Ian
	 */
	public class Rain extends FlxLayer
	{
		public function Rain() 
		{
			super();
			
			for (var i:int = 0 ; i < 200; i++)
			{
				var spr :FlxSprite = new RainSprite();
				spr.offset.y = 64;
				add(spr);
			}
		}
	}

}