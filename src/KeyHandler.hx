package;
import openfl.Lib;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;

/**
 * ...
 * @author mightymarcus
 */
class KeyHandler 
{

	public static var UP:Bool = false;
	public static var DOWN:Bool = false;
	public static var LEFT:Bool = false;
	public static var RIGHT:Bool = false;
	
	public static var sequenceSuccess:Bool = false;
	public static var SEQ_KEY_PRESSED:Bool = false;
	
	public static var sequence:Array<Int> = null;
	static var _actualKeyIndex:Int = 0;
	
	public static function init() 
	{
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, _keyDown);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, _keyUp);
	}
	
	public static function feedSequence(ary:Array<Int>)
	{
		sequence = ary;
	}
	
	public static function clearSequence()
	{
		SEQ_KEY_PRESSED = false;		
		sequence = null;
		_actualKeyIndex = 0;
		sequenceSuccess = false;
	}
		
	static function _keyDown(e:KeyboardEvent)
	{
		if (sequence == null) return;
		var keyToHit = sequence[_actualKeyIndex];
		
		if (e.keyCode == Keyboard.LEFT || e.keyCode == Keyboard.RIGHT || e.keyCode == Keyboard.UP || e.keyCode == Keyboard.DOWN)
		{
			SEQ_KEY_PRESSED = true;
		}
		
		if (e.keyCode == keyToHit)
		{
			_actualKeyIndex++;
			if (_actualKeyIndex == sequence.length)
			{
				sequenceSuccess = true;
			}
		}
		else
		{
			_actualKeyIndex = 0;
			sequenceSuccess = false;
		}
	}
	
	static function _keyUp(e:KeyboardEvent)
	{
		if (e.keyCode == Keyboard.LEFT || e.keyCode == Keyboard.RIGHT || e.keyCode == Keyboard.UP || e.keyCode == Keyboard.DOWN)
		{
			SEQ_KEY_PRESSED = false;
		}
	}
}