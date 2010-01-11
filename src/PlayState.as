package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		[Embed(source = "../content/level0/layer0.txt", mimeType = "application/octet-stream")] public static var data_map:Class;
		[Embed(source = "../content/level0/layer1.txt", mimeType = "application/octet-stream")] public static var data_map2:Class;
		[Embed(source = "../content/level0/sheet.png", mimeType = "image/png")] public static var data_tiles:Class;
		
		public function PlayState()
		{
			add(new FlxText(0, 0, 100, "INSERT GAME HERE"));
			var myMap : FlxTilemap = new FlxTilemap();
			myMap.loadMap(new data_map, data_tiles, 20, 20);
			add(myMap);
			var myMap2 : FlxTilemap = new FlxTilemap();
			myMap2.loadMap(new data_map2, data_tiles, 20, 20);
			add(myMap2);
			
			var cat : Cat = new Cat(FlxG.width / 2, FlxG.height / 2);
			add(cat);
			
			var pragma : PragmaSprite = new PragmaSprite();
			add(pragma);
		}
	}
}

