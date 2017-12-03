package;

import openfl.display.Sprite;
import openfl.Lib;
import openfl.events.Event;

/**
 * ...
 * @author mightymarcus
 */
class Main extends Sprite 
{

	public static inline var NOMINAL_WIDTH:Int = 480;
	public static inline var NOMINAL_HEIGHT:Int = 270;	
	var _checkout:Checkout;
	var _frame:Int = -1;
	var _randomizer:Int = 996;
	
	var gameOver:Bool = false;
	
	var _checkFocusFrame:Int = 0;
	
	public function new() 
	{
		super();
		
		SoundPlayer.init();
		
		Lib.current.stage.addEventListener(Event.RESIZE, _resize);
		_checkout = new Checkout(this);
		
		KeyHandler.init();
		
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, _gameLoop);
	}
	
	function _resize(e:Event)
	{
		var canvaswidth = Lib.current.stage.stageWidth;
		var canvasheight = Lib.current.stage.stageHeight;
		var ratioX = canvaswidth / NOMINAL_WIDTH;
		var ratioY = canvasheight / NOMINAL_HEIGHT;
		this.scaleX = ratioX;
		this.scaleY = ratioX;
		this.y = (canvasheight / 2) - (this.height / 2);
		_checkout.resize();
	}
	
	function _gameLoop(e:Event)
	{
		
		_checkFocusFrame++;
		
		if (_checkFocusFrame == 10)
		{
			_checkFocusFrame = 0;
			Lib.current.stage.focus = Lib.current.stage;
		}
		
		if (_checkout.notStarted) return;
		
		if (_checkout.restart)
		{
			gameOver = false;
			_frame = -1;
			_randomizer = 997;
			_checkout.gameOver = false;
			_checkout.restart = false;
			_checkout.earned = 0;
		}
		
		if (gameOver) return;
		
		if (_checkout.gameOver)
		{
			gameOver = true;
			_checkout.showGameOver();
			return;
		}
		
		if (_frame == 1000)
		{
			trace("schneller!");
			
			_frame = 0;
			_randomizer--;
			if (_randomizer < 994)
			{
				_randomizer = 996;				
			}
		}
		
		_checkout.update();
		
		var rnd = Std.random(1000);
		if (rnd > _randomizer || _frame == -1)
		{
			_checkout.addCustomer();
		}
		
		_frame++;		
	}

}
