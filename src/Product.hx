package;
import openfl.display.Tile;
import openfl.ui.Keyboard;

/**
 * ...
 * @author mightymarcus
 */
class Product extends Tile
{
	
	public static var sequences:Array<Array<Int>> =
	[
		// Bananen
		[Keyboard.LEFT],
		// Klopapier
		[Keyboard.LEFT, Keyboard.RIGHT],
		//Apfel
		[Keyboard.UP, Keyboard.UP],
		//Wine
		[Keyboard.DOWN, Keyboard.DOWN],
		//Sugar
		[Keyboard.DOWN, Keyboard.UP, Keyboard.UP],
		// Meat
		[Keyboard.UP, Keyboard.UP, Keyboard.UP],
		// Chips
		[Keyboard.UP, Keyboard.DOWN],
		// Melon
		[Keyboard.UP, Keyboard.DOWN, Keyboard.RIGHT],
		// Soap
		[Keyboard.RIGHT],
		// Lubber
		[Keyboard.DOWN],
		// Noodles
		[Keyboard.UP],
		//  Milk
		[Keyboard.LEFT, Keyboard.LEFT],
		// Chocolate
		[Keyboard.RIGHT, Keyboard.LEFT],
		// Toothbrush
		[Keyboard.LEFT, Keyboard.DOWN],
		// Blue Candle
		[Keyboard.UP, Keyboard.DOWN, Keyboard.UP],
		// Bad Plant
		[Keyboard.RIGHT, Keyboard.DOWN, Keyboard.UP]		
		
		
		
	];
	
	public static var names:Array<String> =
	[
		"Bananas",
		"Toilet Paper",
		"Apple",
		"Wine",
		"Sugar",
		"Meat",
		"Chips",
		"Melon",
		"Soap",
		"Lubbers",
		"Noodles",
		"Milk",
		"Chocolate",
		"Toothbrush",
		"Blue Candle",
		"Bad Plant"
	];
	
	public var waitforscan:Bool = false;
	
	public function new() 
	{
		var id = Std.random(16);
		super(id);
		this.y = 140 + Std.random(10);
		this.scaleX = this.scaleY = 1;
	}	
}