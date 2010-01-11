﻿package  
{
	import flash.display.Shape;
	import flash.geom.Point;
	import org.flixel.*;
	
	import Math;
	
	public class Hose extends FlxCore
	{	
		private var _node_distance : Number = 10;
		private var _start_x : Number = -1000;
		private var _start_y : Number = 300;
		
		private var _pragma : PragmaSprite;
		private var _points : Array;
		
		public function Hose(pragma : PragmaSprite) 
		{
			_pragma = pragma;
			
			_points = new Array();
			for (var i:int = _start_x; i < 300; i += _node_distance) 
			{
				_points.push(new Point(i, _start_y));
			}
		}
		
		override public function update() : void 
		{
			var mx : Number = FlxG.mouse.x;
			var my : Number = FlxG.mouse.y;
			
			var mdx : Number = mx - _pragma.x;
			var mdy : Number = my - _pragma.y;
			
			var d : Number = Math.sqrt(Math.pow(mdx, 2) + Math.pow(mdy, 2));
			
			var mnx : Number = (mdx / d) * _node_distance;
			var mny : Number = (mdy / d) * _node_distance;
			
			_points[0] = new Point(_start_x, _start_y);
			_points[_points.length - 1] = new Point(_pragma.x + mnx, _pragma.y + mny);
			_points[_points.length - 2] = new Point(_pragma.x, _pragma.y);
			
			for (var i:int = 1; i < _points.length - 1; i++) 
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
			
			super.update();
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
			
			super.render();
		}
		
		private function draw_line(x1 : Number, y1 : Number, x2 : Number, y2 : Number) : void
		{
			var line : Shape = new Shape();
            
			line.graphics.lineStyle(1, 0x000099);
            line.graphics.moveTo(x1, y1);
            line.graphics.lineTo(x2, y2);
			
            FlxG.buffer.draw(line);
		}
	}
}