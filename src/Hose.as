package  
{
	import adobe.utils.CustomActions;
	import flash.display.Shape;
	import flash.geom.Point;
	import org.flixel.*;
	
	import Math;
	
	public class Hose extends Character
	{	
		
		[Embed(source = "../content/sprites/rain.png", mimeType = "image/png")] public static var PARTICLE_IMAGE:Class;
		[Embed(source = "../content/sounds/hose_w.mp3", mimeType = "audio/mpeg")] public static var HOSE_SOUND:Class;
		
		private var _node_distance : Number = 5;
		private var _start_x : Number = 0;
		private var _start_y : Number = 275;
		
		private var _pragma : PragmaSprite;
		private var _points : Array;
		
		private var _particles : FlxEmitter = new FlxEmitter(0, 0, 0.1);
		
		private var _sound : FlxSound;
		private var _spraying : Boolean = false;
		
		public const OFFSET_Y : Number = -2;
		
		public function Hose(pragma : PragmaSprite, layer:FlxLayer) 
		{
			_pragma = pragma;
			
			_points = new Array();
			for (var i:int = _start_x; i <pragma.x; i += _node_distance) 
			{
				_points.push(new Point(i, _start_y));
			}
			
			//_particles.createSprites(PARTICLE_IMAGE, 200, true);
			var sprites:Array = new Array();
			for (var j:int = 0; j < 200; j++)
			{
				var p:FlxSprite = new WaterParticle(this);
				layer.add(p);
				sprites.push(p);
			}
			trace(sprites);
			_particles.loadSprites(sprites);
		}
		
		override public function update() : void 
		{
			var mx : Number = FlxG.mouse.x// - FlxG.scroll.x;
			var my : Number = FlxG.mouse.y //- FlxG.scroll.y;
			
			var mdx : Number = mx - _pragma.center.x;
			var mdy : Number = my - _pragma.center.y-OFFSET_Y;
			
			var d : Number = Math.sqrt(Math.pow(mdx, 2) + Math.pow(mdy, 2));
			
			var mnx : Number = (mdx / d) * _node_distance;
			var mny : Number = (mdy / d) * _node_distance;
			
			_points[_points.length - 1] = new Point(_pragma.center.x + mnx, _pragma.center.y-OFFSET_Y + mny);
			_points[_points.length - 2] = new Point(_pragma.center.x, _pragma.center.y-OFFSET_Y);
			
			for (var i:int = 0; i < _points.length - 1; i++) 
			{
				var p1 : Point = Point(_points[i]);
				var p2 : Point = Point(_points[i + 1]);
				
				var dx : Number = p2.x - p1.x;
				var dy : Number = p2.y - p1.y;
				var distance : Number = Math.sqrt(Math.pow(dx, 2) + Math.pow(dy, 2));
				
				distance = (distance == 0) ? .01 : distance;
				
				var nx : Number = dx / distance;
				var ny : Number = dy / distance;
				
				var correction : Number = -(_node_distance - distance);
				var new_distance : Number = distance + correction;
				
				_points[i] = new Point(p1.x + nx * correction, p1.y + ny * correction);
			}
			
			_particles.x = _points[_points.length - 1].x;
			_particles.y = _points[_points.length - 1].y;
			_particles.gravity = 1;
			_particles.delay = 0.05;
			_particles.setSize(2, 2);
			_particles.setXVelocity(mnx * 40, mnx * 50);
			_particles.setYVelocity(mny * 40, mny * 50);
			
			if (FlxG.mouse.pressed())
			{
				spray();
				_pragma.knockBack = new Point( -mnx * 10, -mny * 10);
				if(this._sound == null)
					this._sound = FlxG.play(HOSE_SOUND, 0.5, true);
			}
			else
			{
				if (this._sound != null)
					this._sound.stop();
				this._sound = null;
			}
			
			super.update();
		}
		
		public function get tip():Point
		{
			return _points[_points.length - 1];
		}
		
		public function spray():void
		{
			_particles.emit();
		
		}
		
		override public function render() : void 
		{
			var prev : Point = Point(_points[0]);
			
			for (var i:int = 1; i < _points.length; i++) 
			{
				var point : Point = _points[i];
				
				draw_line(prev.x, prev.y, point.x, point.y);
				
				prev = point;
			}
			
		}
		
		private function draw_line(x1 : Number, y1 : Number, x2 : Number, y2 : Number) : void
		{
			var line : Shape = new Shape();
			var ox:Number = 0;
			var oy:Number = 0;
			
			if (FlxG.followTarget)
			{
				ox = FlxG.scroll.x;
				oy = FlxG.scroll.y;
			}
            
			line.graphics.lineStyle(1, 0x00AA11);
            line.graphics.moveTo(x1+ox, y1+oy);
            line.graphics.lineTo(x2+ox, y2+oy);
			
            FlxG.buffer.draw(line);
		}
	}
}