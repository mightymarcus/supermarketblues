package;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author mightymarcus
 */
class StartPanel extends Sprite
{

	var _textField:TextField;
	
	public function new() 
	{
		super();
		
		this.graphics.lineStyle(1, 0x330000);
		this.graphics.beginFill(0x0000ff, 1);
		this.graphics.drawRect(0, 0, 256, 128);
		this.graphics.endFill();
		this.buttonMode = true;
		this.mouseChildren = false;
		
		this.visible = true;
		
		_textField = new TextField();
		var tf = new TextFormat(null, 10, 0xffff00, true);
		tf.align = TextFormatAlign.CENTER;
		_textField.defaultTextFormat = tf;
		_textField.width = 256;
		_textField.height = 128;
		_textField.y = 10;
		_textField.selectable = false;
		
		_textField.text = "Welcome to SUPERMARKET BLUES!\n\n";
		_textField.text += "You are working at the supermarket to pay the bills.\n\n";
		_textField.text += "How to play:\n\n";
		_textField.text += "Look at the displayed arrow-key-sequence and enter it.\n\n";
		_textField.text += "CLICK TO START WORKING!!!";
		
		this.addChild(_textField);
	}	
}