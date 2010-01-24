package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Ian
	 */
	public class WaterParticle extends FlxSprite
	{
		[Embed(source = "../content/sprites/rain.png", mimeType = "image/png")] public static var WATER_IMAGE:Class;
		public var life:Number = 0; 
		public var initial_life:Number = 0;
		private var hose : Hose;
		
		public function WaterParticle(hose:Hose) 
		{
			super(hose.x, hose.y, WATER_IMAGE); 
			remake();
		}
		
		override public function reset(X:Number, Y:Number):void 
		{
			super.reset(hose.x, hose.y);
			remake();
		}
		
		public function remake ():void 
		{
			this.active = true;
			this.visible = true;
			
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
				this.active = false;
				this.visible = false;
				
			}
		}
		
	}

}