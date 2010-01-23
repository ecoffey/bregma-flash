package  
{
	import flash.geom.Point;
	import org.flixel.data.FlxAnim;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Ian
	 */
	public class Character extends FlxSprite
	{
		public function Character(x:Number = 0, y:Number = 0, image:Class = null)
		{
			super(x, y, image);
		}
		
		public function get center() : Point {
			return new Point(x+this.width/2, y+this.height/2);
		}
		
		
		public function get foot() : Point {
			return new Point(x+this.width/2, y+this.height);
		}
		
		
		public function get foot_y() : Number {
			return y+this.height;
		}
	}

}