package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Ian
	 */
	public class WaterParticle extends FlxSprite
	{
		public var fade:Number = 0; 
		public var initial_life:Number = 0;
		private var hose : Hose;
		
		public function WaterParticle(hose:Hose) 
		{
			super(hose.tip.x, hose.tip.y, null); 
			this.hose = hose;
			this.loadGraphic(Hose.PARTICLE_IMAGE, true);
			this.randomFrame();
			//remake();
		}
		
		override public function onEmit():void 
		{
			super.onEmit();
			//this.x = hose.tip.x;
			//this.y = hose.tip.y;
			remake();
		}
		
		public function remake ():void 
		{	
			fade = Math.random()*1;
			initial_life = fade;
			this.visible = true;
			this.active = true;
			this.dead = false;
		}
		
		override public function update():void 
		{
			super.update();
			this.alpha = (fade / initial_life);
			this.fade -= FlxG.elapsed;
			
			if (this.fade <= 0)
			{
				this.fade = 0;
				this.visible = false;
				this.active  = false;
				this.dead = true;
			}
		}
		
	}

}