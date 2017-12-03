package;

import openfl.Assets;
import openfl.display.Tilemap;
import openfl.display.Tileset;
import openfl.geom.Rectangle;

/**
 * ...
 * @author mightymarcus
 */
class SpriteSheetProducts
{
	public var tilemap:Tilemap;
	public var tilemapSequence:Tilemap;

	public function new()
	{
		var bmp = Assets.getBitmapData('img/products.png');
		var tileset = new Tileset(bmp);
		// Bananen
		tileset.addRect(new Rectangle(0, 0, 16, 16));
		// Klopapier
		tileset.addRect(new Rectangle(16, 0, 16, 16));
		// Apple
		tileset.addRect(new Rectangle(32, 0, 16, 16));
		// Wine
		tileset.addRect(new Rectangle(48, 0, 16, 16));	
		// Sugar
		tileset.addRect(new Rectangle(64, 0, 16, 16));
		// Meat
		tileset.addRect(new Rectangle(80, 0, 16, 16));
		// Chips
		tileset.addRect(new Rectangle(96, 0, 16, 16));
		// Melon
		tileset.addRect(new Rectangle(112, 0, 16, 16));
		// Soap
		tileset.addRect(new Rectangle(0, 16, 16, 16));
		// Lubbers
		tileset.addRect(new Rectangle(16, 16, 16, 16));
		//  Noodles
		tileset.addRect(new Rectangle(32, 16, 16, 16));
		// Milk
		tileset.addRect(new Rectangle(48, 16, 16, 16));
		// Chocolate
		tileset.addRect(new Rectangle(64, 16, 16, 16));		
		// Chocolate
		tileset.addRect(new Rectangle(80, 16, 16, 16));
		// Blue Candle
		tileset.addRect(new Rectangle(96, 16, 16, 16));
		// Bad Plant
		tileset.addRect(new Rectangle(112, 16, 16, 16));		
		
		
		// Pfeil links
		tileset.addRect(new Rectangle(0, 96, 16, 16));
		// Pfeil rechts
		tileset.addRect(new Rectangle(16, 96, 16, 16));
		// Pfeil oben
		tileset.addRect(new Rectangle(32, 96, 16, 16));
		// Pfeil unten
		tileset.addRect(new Rectangle(48, 96, 16, 16));		
		
		tilemap = new Tilemap(Main.NOMINAL_WIDTH, Main.NOMINAL_HEIGHT, tileset, false);
		tilemapSequence = new Tilemap(50, 50, tileset, false);
	}
	
}