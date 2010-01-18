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
		[Embed(source = "../content/level1/sheet.png", mimeType = "image/png")] public static var data_tiles:Class;
		
		
		[Embed(source = "../content/level1/lighting.png", mimeType = "image/png")] public static var lighting_image:Class;
		
		
		public var dynamicLayer:FlxLayer = new FlxLayer();
		public var lighting:FlxSprite;
		
		public var rain:Array;
		
		public function PlayState()
		{
			var myMap : FlxTilemap = new FlxTilemap();
			myMap.loadMap(new data_map, data_tiles, 16, 16);
			add(myMap);
			//var myMap2 : FlxTilemap = new FlxTilemap();
			//myMap2.loadMap(new data_map2, data_tiles, 20, 20);
			//add(myMap2);
						
			rain = new Array();
			
			
			lighting = new FlxSprite(0, 0, lighting_image);
			lighting.blend = "multiply";
			
			var pragma : PragmaSprite = new PragmaSprite(50, 50);
			var hose : Hose = new Hose(pragma);
		
			add(dynamicLayer);
			add(new Rain());
			dynamicLayer.add(pragma);
			dynamicLayer.add(hose);
			
			for (var i:int = 0; i < 5; i++)
			{
				dynamicLayer.add(new Cat(FlxG.width * Math.random(), FlxG.height * Math.random()));
			}
			
			FlxG.showCursor(Bregma.Cursor);
		}
		
		override public function update():void 
		{
			super.update();
			dynamicLayer.children().sortOn("y");
		}
		
		override public function postProcess():void 
		{
			super.postProcess();
			screen.draw(lighting, 0, 0);
		}
		
	}
}

