package;
import openfl.display.Tile;

/**
 * ...
 * @author mightymarcus
 */
class Cashier extends Tile
{

	public function new() 
	{
		super(0);
		this.x = 393;
		this.y = 110;
		this.scaleX = this.scaleY = 1.5;
	}
	
	public function changeAnim(id:Int)
	{
		this.id = id;
	}
	
}