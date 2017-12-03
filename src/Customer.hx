package;
import openfl.display.Tile;

/**
 * ...
 * @author mightymarcus
 */
class Customer extends Tile
{
	public static var customers:Array<Customer> = [];
	
	public var products:Array<Product> = [];
	public var angryMeter:Int = 0;
	public var gone:Bool = false;
	public var head:Tile = null;
	
	var _frames:Int = 0;
	var _addTiles:Int = 0;
	var _addTilesHead:Int = 0;
	
	public function new()
	{
		
		_addTiles = Std.random(2) == 1 ? 0 : 12 + 4;
		
		//_addTilesHead = Std.random(2) == 1 ? 0 : 4;
		
		super(2 + _addTiles);		
		this.scaleX = 2;
		this.scaleY = 2;
		this.x = -100;
		this.y = 135;
		
		head = new Tile(10 + _addTiles + _addTilesHead);
		head.scaleX = head.scaleY = this.scaleX;
		head.x = this.x;
		head.y = this.y;
		
		_generateProducts();
	}
	
	
	function _generateProducts()
	{
		var rand1 = Std.random(25) + 1;
		
		var lenproducts = Std.random(rand1) + 1;
		for (i in 0 ... lenproducts)
		{
			var product = new Product();
			this.products.push(product);
		}
	}
	
	public function update(id:Int)
	{
		if (this.x > -200)	angryMeter++;
		
		var prevCustomer = customers[id - 1];
		var blocked = false;
		
		
		if (products.length > 0 && products[0] != null && products[0].x > 400)
		{
			blocked = true;
			
			if (!products[0].waitforscan)
			{
				
			}
			
			products[0].waitforscan = true;
		}
		
		if (prevCustomer != null)
		{
			if (products[0] != null && products[0].x >= prevCustomer.x - 5)
			{
				blocked = true;
			}
		}
		
		if (!blocked)
		{
			this.x += 1;
			for (i in 0 ... products.length)
			{
				products[i].x += 1;
			}
			
			if (this.id + _addTiles == 2 + _addTiles)
			{
				_frames = 9;
			}
		}
		
		_frames++;
		
		if (_frames == 10)
		{
			if (blocked)
			{
				_frames = 9;
				this.id = 2 + _addTiles;
			}
			else
			{
				_frames = 0;
				this.id++;
				if (this.id > 8 + _addTiles) this.id = 3 + _addTiles;				
			}
		}		
		
		head.x = this.x;
		head.y = this.id == 4 + _addTiles || this.id == 7 + _addTiles ? this.y + 1 : this.y;
		
		if (angryMeter > 800) head.id = 11 + _addTiles + _addTilesHead;
		if (angryMeter > 1400) head.id = 12 + _addTiles + _addTilesHead;
		if (angryMeter == 1401) SoundPlayer.playSound( Std.random(2) == 1 ? "jammer1" : "jammer2");
		if (angryMeter > 2000) head.id = 13 + _addTiles + _addTilesHead;
		if (angryMeter == 2001) SoundPlayer.playSound( Std.random(2) == 1 ? "jammer3" : "jammer4");		
	}
	
}