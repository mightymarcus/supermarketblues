package;
import openfl.Assets;
import openfl.Lib;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.display.Tile;
import openfl.events.MouseEvent;
import openfl.ui.Keyboard;

/**
 * ...
 * @author mightymarcus
 */
class Checkout
{
	public var earned:Int = 0;
	public var notStarted:Bool = true;	
	public var gameOver:Bool = false;
	public var restart:Bool = false;	
	
	var _bmp:Bitmap;
	var sheetCustomers:SpriteSheetCustomers;
	var sheetProducts:SpriteSheetProducts;
	var sequencePanel:SequencePanel;
	var gameOverPanel:GameOverPanel;
	var _cashier:Cashier;
	
	var _canvas:Sprite;
	
	var startPanel:StartPanel;
	
	public function new(canvas:Sprite) 
	{
		this._canvas = canvas;
		
		var bgimg = Assets.getBitmapData("img/checkout.png");
		_bmp = new Bitmap(bgimg);
		canvas.addChild(_bmp);
		
		sheetCustomers = new SpriteSheetCustomers();
		sheetProducts = new SpriteSheetProducts();
		canvas.addChild(sheetCustomers.tilemapCashier);
		_cashier = new Cashier();
		sheetCustomers.tilemapCashier.addTile(_cashier);		
		canvas.addChild(sheetProducts.tilemap);
		canvas.addChild(sheetCustomers.tilemap);
		
		sequencePanel = new SequencePanel();
		canvas.addChild(sequencePanel);
		sequencePanel.addChild(sheetProducts.tilemapSequence);
		
		gameOverPanel = new GameOverPanel();
		canvas.addChild(gameOverPanel);
		
		gameOverPanel.addEventListener(MouseEvent.CLICK, _restart);
		
		startPanel = new StartPanel();
		canvas.addChild(startPanel);
		startPanel.addEventListener(MouseEvent.CLICK, _start);
	}
	
	function _start(e:MouseEvent)
	{
		notStarted = false;
		_canvas.removeChild(startPanel);
		startPanel.visible = false;
	}
	
	function _restart(e:MouseEvent)
	{
		if (!gameOver) return;
		
		removeGameOver();
		
		for (i in 0 ... Customer.customers.length)
		{
			sheetCustomers.tilemap.removeTiles(0, sheetCustomers.tilemap.numTiles);
			sheetProducts.tilemap.removeTiles(0, sheetProducts.tilemap.numTiles);
			sheetProducts.tilemapSequence.removeTiles(0, sheetProducts.tilemapSequence.numTiles);
			
			var products = Customer.customers[i].products;
			if (products != null)
			{
				for (j in 0 ... products.length)
				{
					products[j] = null;
				}
			}
			
			Customer.customers[i].products = null;
			Customer.customers[i] = null;
		}
		
		Customer.customers = [];
		gameOver = false;
		restart = true;
		sequencePanel.updateText("");
		KeyHandler.clearSequence();
		
	}
	
	public function resize()
	{
		//sequencePanel.x = (Main.NOMINAL_WIDTH / 1.5) - (sequencePanel.width / 2);
		sequencePanel.x = 348;
		sequencePanel.y = 92;
		
		gameOverPanel.x = (Main.NOMINAL_WIDTH / 2) - (gameOverPanel.width / 2);
		gameOverPanel.y = (Main.NOMINAL_HEIGHT / 2) - (gameOverPanel.height / 2);
		
		startPanel.x = (Main.NOMINAL_WIDTH / 2) - (startPanel.width / 2);
		startPanel.y = (Main.NOMINAL_HEIGHT / 2) - (startPanel.height / 2);
	}
	
	public function showGameOver()
	{
		gameOverPanel.visible = true;
		SoundPlayer.playSound("piano");
		
		var euros:String = "" + (earned / 10);
		var ary = euros.split(".");
		var euro:String  = ary[0];
		var cent:String = ary[1] != null ? ary[1] : "";
		var text:String = 'You have earned $euro Euros';
		if (cent != "") text += ' and $cent Cents';
		
		gameOverPanel.setText(text + " ...");
	}
	
	public function removeGameOver()
	{
		gameOverPanel.visible = false;
	}

	public function addCustomer()
	{
		var customer = new Customer();
		
		if (Customer.customers.length > 0)
		{
			var newestX = Customer.customers[Customer.customers.length - 1].x;
			if (newestX < 0)
			{
				customer.x = newestX - 100;
			}
		}
		
		sheetCustomers.tilemap.addTile(customer);
		sheetCustomers.tilemap.addTile(customer.head);
		Customer.customers.push(customer);		
		
		for (i in 0 ... customer.products.length)
		{
			sheetProducts.tilemap.addTile(customer.products[i]);
			customer.products[i].x = customer.x;
			customer.x -= 12;
		}
		
		customer.x -= 30;
	}
	
	public function update()
	{
		if (KeyHandler.SEQ_KEY_PRESSED)
		{
			_cashier.changeAnim(1);
		}
		else
		{
			_cashier.changeAnim(0);
		}
		
		var removeCustomer:Bool = false;
		
		for (i in 0 ... Customer.customers.length)
		{
			var customer = Customer.customers[i];
			customer.update(i);
			
			if (customer.products.length == 0)
			{
				customer.angryMeter = 0;
			}
			
			if (customer.angryMeter == 2700)
			{
				gameOver = true;
			}
			
			
			if (customer.x > 500)
			{
				removeCustomer = true;
				customer.gone = true;
			}			
		}
		
		var nextCostumer:Customer = null;
		
		if (Customer.customers[0] != null && Customer.customers[0].products != null && Customer.customers[0].products.length > 0)
		{
			nextCostumer = Customer.customers[0];
		}
		else
		{
			nextCostumer = Customer.customers.length > 1 ? Customer.customers[1] : null;
		}
				
		if (nextCostumer == null) return;
		
		var nextProduct = nextCostumer.products[0];
		if (nextProduct != null && nextProduct.waitforscan)
		{
			if (KeyHandler.sequence == null)
			{
				var seq = Product.sequences[nextProduct.id];
				KeyHandler.feedSequence(seq);
				sequencePanel.visible = true;
				sequencePanel.updateText(Product.names[nextProduct.id]);
				sheetProducts.tilemapSequence.addTile(new Tile(nextProduct.id, ( sequencePanel.width / 2) - ((16 * 1) / 2) - 6, 6, 1, 1));
				var arrowsW:Int = Std.int( (seq.length-1) * (18 / 2));
				var startX:Int = Std.int((sequencePanel.width / 2) - ((16 * 1) / 2)) - Std.int(arrowsW / 2);
				var arrowID:Int = 16;
				
				for (key in Product.sequences[nextProduct.id])
				{
					switch (key)
					{
						case Keyboard.LEFT:
							arrowID = 16;
							
						case Keyboard.RIGHT:
							arrowID = 17;
							
						case Keyboard.UP:
							arrowID = 18;
							
						case Keyboard.DOWN:
							arrowID = 19;
							
						default:
					}
					
					sheetProducts.tilemapSequence.addTile(new Tile(arrowID, startX - 6, 20, 1, 1));
					startX += 9;
				}
			}
			else if (KeyHandler.sequenceSuccess)
			{
				SoundPlayer.playSound("scanner");
				
				earned++;
				
				sequencePanel.visible = false;
				sheetProducts.tilemapSequence.removeTiles(0, sheetProducts.tilemapSequence.numTiles);
				KeyHandler.clearSequence();
				
				var remTile = nextCostumer.products.shift();
				if (nextCostumer.products.length == 0)
				{
					SoundPlayer.playSound("beep");
				}
				sheetProducts.tilemap.removeTile(remTile);
				remTile = null;				
			}			
		}
		
		if (removeCustomer)
		{
			var remCustomer = Customer.customers.shift();
			sheetCustomers.tilemap.removeTile(remCustomer.head);
			sheetCustomers.tilemap.removeTile(remCustomer);
			remCustomer = null;	
		}
	}
}