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
		public var lightningCountdown:Number = 10;
		public var screen:FlxSprite;
		public function Rain(scr:FlxSprite) 
		{
			super();
			this.screen = scr;
			for (var i:int = 0 ; i < 200; i++)
			{
				var spr :FlxSprite = new RainSprite();
				spr.offset.y = 64;
				add(spr);
			}
		}
		
		override public function update():void 
		{
			super.update();
			lightningCountdown -= FlxG.elapsed;
			
			if (lightningCountdown <= 0)
			{
				FlxG.play(Music.Thunder, Math.random());
				lightningCountdown = 20 * Math.random();
				
			}
		}
		
		public function postProcess() : void
		{
			/*if (lightningCountdown <= 0.1)
			{
				screen.fill(0xFFFFFFFF);
			}*/
		}
	}

}