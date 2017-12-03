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
class GameOverPanel extends Sprite
{

	var _textField:TextField;
	
	public function new() 
	{
		super();
		
		this.graphics.lineStyle(1, 0xff0000);
		this.graphics.beginFill(0x0000ff, .4);
		this.graphics.drawRect(0, 0, 128, 128);
		this.graphics.endFill();
		
		var bd = Assets.getBitmapData("img/gameover.png");
		this.graphics.beginBitmapFill(bd, null, false, false);
		this.graphics.drawRect(0, 0, 128, 128);
		this.graphics.endFill();
		this.visible = false;
		
		_textField = new TextField();
		var tf = new TextFormat(null, 6, 0xff0000, true);
		tf.align = TextFormatAlign.CENTER;
		_textField.defaultTextFormat = tf;
		_textField.width = this.width;
		_textField.height = 60;
		_textField.y = 0;
		this.addChild(_textField);		
	}
	
	public function setText(text:String)
	{
		_textField.text = text;
	}
}