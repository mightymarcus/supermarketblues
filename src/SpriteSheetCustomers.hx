package;

import openfl.Assets;
import openfl.display.Tilemap;
import openfl.display.Tileset;
import openfl.geom.Rectangle;

/**
 * ...
 * @author mightymarcus
 */
class SpriteSheetCustomers
{
	public var tilemap:Tilemap;
	public var tilemapCashier:Tilemap;

	public function new()
	{
		var bmp = Assets.getBitmapData('img/customers.png');
		var tileset = new Tileset(bmp);
		// Kassierer A
		tileset.addRect(new Rectangle(0, 96, 32, 32));
		// Kassierer B
		tileset.addRect(new Rectangle(32, 96, 32, 32));
		// customer A Stand
		tileset.addRect(new Rectangle(0, 0, 32, 32));
		// customer A Walk 1
		tileset.addRect(new Rectangle(32, 0, 32, 32));
		// customer A Walk 2
		tileset.addRect(new Rectangle(64, 0, 32, 32));
		// customer A Walk 3
		tileset.addRect(new Rectangle(96, 0, 32, 32));
		// customer A Walk 4
		tileset.addRect(new Rectangle(0, 32, 32, 32));
		// customer A Walk 5
		tileset.addRect(new Rectangle(32, 32, 32, 32));
		// customer A Walk 6
		tileset.addRect(new Rectangle(64, 32, 32, 32));
		// customer A Walk 7
		tileset.addRect(new Rectangle(96, 32, 32, 32));
		
		// customer A Head 1.1
		tileset.addRect(new Rectangle(0, 64, 24, 16));
		// customer A Head 1.2
		tileset.addRect(new Rectangle(32, 64, 24, 16));
		// customer A Head 1.3
		tileset.addRect(new Rectangle(64, 64, 24, 16));
		// customer A Head 1.4
		tileset.addRect(new Rectangle(96, 64, 24, 16));
		
		// customer A Head 2.1
		tileset.addRect(new Rectangle(0, 64 + 16, 24, 16));
		// customer A Head 2.2
		tileset.addRect(new Rectangle(32, 64 + 16, 24, 16));
		// customer A Head 2.3
		tileset.addRect(new Rectangle(64, 64 + 16, 24, 16));
		// customer A Head 2.4
		tileset.addRect(new Rectangle(96, 64 + 16, 24, 16));		
		
		// customer B Stand
		tileset.addRect(new Rectangle(128, 0, 32, 32));
		// customer B Walk 1
		tileset.addRect(new Rectangle(32 + 128, 0, 32, 32));
		// customer B Walk 2
		tileset.addRect(new Rectangle(64 + 128, 0, 32, 32));
		// customer B Walk 3
		tileset.addRect(new Rectangle(96 + 128, 0, 32, 32));
		// customer B Walk 4
		tileset.addRect(new Rectangle(128, 32, 32, 32));
		// customer B Walk 5
		tileset.addRect(new Rectangle(32 + 128, 32, 32, 32));
		// customer B Walk 6
		tileset.addRect(new Rectangle(64 + 128, 32, 32, 32));
		// customer B Walk 7
		tileset.addRect(new Rectangle(96 + 128, 32, 32, 32));
		
		// customer B Head 1.1
		tileset.addRect(new Rectangle(128, 64, 24, 16));
		// customer B Head 1.2
		tileset.addRect(new Rectangle(32 + 128, 64, 24, 16));
		// customer B Head 1.3
		tileset.addRect(new Rectangle(64 + 128, 64, 24, 16));
		// customer B Head 1.4
		tileset.addRect(new Rectangle(96 + 128, 64, 24, 16));
		
		// customer B Head 2.1
		tileset.addRect(new Rectangle(128, 64, 24 + 16, 16));
		// customer B Head 2.2
		tileset.addRect(new Rectangle(32 + 128, 64 + 16, 24, 16));
		// customer B Head 2.3
		tileset.addRect(new Rectangle(64 + 128, 64 + 16, 24, 16));
		// customer B Head 2.4
		tileset.addRect(new Rectangle(96 + 128, 64 + 16, 24, 16));		
		
		
		tilemap = new Tilemap(Main.NOMINAL_WIDTH, Main.NOMINAL_HEIGHT, tileset, false);
		tilemapCashier = new Tilemap(Main.NOMINAL_WIDTH, Main.NOMINAL_HEIGHT, tileset, false);
	}
	
}