package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Ian
	 */
	public class RainSprite extends FlxSprite
	{
		[Embed(source = "../content/sprites/rainstrike.png", mimeType = "image/png")] public static var rain_img:Class;
		public var life:Number = 0; 
		public var initial_life:Number = 0;
		
		public function RainSprite() 
		{
			super(0, 0, rain_img);
			offset.y = 64; 
			remake();
		}
		
		public function remake ():void 
		{
			x = Math.random() * FlxG.width;
			y = Math.random() * FlxG.height;
			
			x -= FlxG.scroll.x ;
			y -= FlxG.scroll.y ;
			
			life = Math.random();
			initial_life = life;
		}
		
		override public function update():void 
		{
			super.update();
			this.alpha = (life / initial_life);
			this.life -= FlxG.elapsed;
			
			if (this.life <= 0)
			{
				remake();
			}
		}
		
	}

}