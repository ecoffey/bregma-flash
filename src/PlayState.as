package
{
	import flash.net.FileReferenceList;
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		/*[Embed(source = "../content/level0/layer0.txt", mimeType = "application/octet-stream")] public static var data_map:Class;
		[Embed(source = "../content/level0/layer1.txt", mimeType = "application/octet-stream")] public static var data_map2:Class;
		[Embed(source = "../content/level0/sheet.png", mimeType = "image/png")] public static var data_tiles:Class;*/
		
		[Embed(source = "../content/level1/level1.txt", mimeType = "application/octet-stream")] public static var data_map:Class;
		[Embed(source = "../content/level1/collision.txt", mimeType = "application/octet-stream")] public static var collision_map:Class;
		[Embed(source = "../content/level1/sheet.png", mimeType = "image/png")] public static var data_tiles:Class;
		[Embed(source = "../content/level1/collision.png", mimeType = "image/png")] public static var collision_tiles:Class;
		
		
		[Embed(source = "../content/level1/lighting.png", mimeType = "image/png")] public static var lighting_image:Class;
		
		
		public var dynamicLayer:FlxLayer = new FlxLayer();
		public var lighting:FlxSprite;
		public var collisionMap:FlxTilemap;
		public var rain:Array;
		public var pragma : PragmaSprite;
		
		public function PlayState()
		{
			var myMap : FlxTilemap = new FlxTilemap();
			myMap.loadMap(new data_map, data_tiles, 16, 16);
			add(myMap);
			
			collisionMap = new FlxTilemap();
			collisionMap.loadMap(new collision_map, collision_tiles, 16, 16);
			collisionMap.visible = false;
			add(collisionMap);
			
			FlxG.followBounds(0, 0, myMap.width-16, myMap.height-16);
			
			rain = new Array();
			
			lighting = new FlxSprite(0, 0, lighting_image);
			lighting.blend = "multiply";
			
			pragma = new PragmaSprite(0, 0);
			var hose : Hose = new Hose(pragma);
			
			FlxG.follow(pragma);
		
			add(dynamicLayer);
			add(new Rain());
			dynamicLayer.add(pragma);
			dynamicLayer.add(hose);
			
			for (var i:int = 0; i < 20; i++)
			{
				dynamicLayer.add(new Cat(200 * Math.random()+209, 160 * Math.random() + 160));
			}
			
			FlxG.showCursor(Bregma.Cursor);
		}
		
		override public function update():void 
		{
			super.update();
			collisionMap.collideArray(dynamicLayer.children())
			dynamicLayer.children().sortOn("foot_y");
		}
		
		override public function postProcess():void 
		{
			super.postProcess();
			
			screen.draw(lighting, FlxG.scroll.x, FlxG.scroll.y);
		}
		
	}
}

