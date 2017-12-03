package;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author mightymarcus
 */
class SequencePanel extends Sprite
{

	var _textField:TextField;
	
	public function new() 
	{
		super();
		
		this.graphics.drawRect(0, 0, 40, 40);
		this.graphics.endFill();
		this.visible = false;
		
		_textField = new TextField();
		var tf = new TextFormat(null, 6, 0xffff00, true);
		tf.align = TextFormatAlign.CENTER;
		_textField.defaultTextFormat = tf;
		_textField.width = this.width;
		_textField.height = 20;
		_textField.y = 0;
		this.addChild(_textField);
	}
	
	public function updateText(text:String)
	{
		_textField.text = text;
	}
	
}