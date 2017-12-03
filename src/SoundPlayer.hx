package;

import openfl.Assets;
import openfl.media.Sound;

/**
 * ...
 * @author mightymarcus
 */
class SoundPlayer 
{
	static var sfx:Map<String, Sound> = null;
	
	public static function init()
	{
		sfx = new Map();
		
		sfx.set("beep", Assets.getSound("sfx/beep.ogg"));
		sfx.set("scanner", Assets.getSound("sfx/scanner.ogg"));
		sfx.set("piano", Assets.getSound("sfx/piano.ogg"));
		sfx.set("jammer1", Assets.getSound("sfx/jammer1.ogg"));
		sfx.set("jammer2", Assets.getSound("sfx/jammer2.ogg"));
		sfx.set("jammer3", Assets.getSound("sfx/jammer3.ogg"));
		sfx.set("jammer4", Assets.getSound("sfx/jammer4.ogg"));
	}
	
	public static function playSound(id:String, loop:Bool = false)
	{
		if (sfx.exists(id))
		{
			sfx.get(id).play(0, loop ? 1000000 : 1);
		}
		else trace("no sound!", id);
	}
}