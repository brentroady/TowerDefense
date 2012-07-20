package  
{
	import flash.events.MouseEvent;
	import org.flixel.*;
	/**
	 * ...
	 * @author Brent
	 */
	public class RightMenu extends FlxGroup
	{
		private const TILE_WIDTH:int = 16;
		private const TILE_HEIGHT:int = 16;
		private var click1:FlxButton;
		[Embed(source = '../assets/player.png')] private var playerPNG:Class;
		
		public function RightMenu(X:Number, Y:Number) 
		{
			// draw rectangle covering area of menu for seeing layout
			add(new FlxSprite(X, Y).makeGraphic(TILE_WIDTH * 4, TILE_HEIGHT * 12, 0xff131c1b));
			
			// draw rectangle that creates new Sprite when clicked
			click1 = new FlxButton( X + ( 2 * TILE_WIDTH ) - 8, Y + ( 2 * TILE_HEIGHT ), null, onClick );
			click1.loadGraphic(playerPNG, false, false, 16, 16, true);
			add( click1 );
		}
		
		public function onClick():void 
		{
			var s:Shooter = new Shooter( FlxG.mouse.x, FlxG.mouse.y );
			s.follow();
			(FlxG.state as PlayState).add( s );
		}
		
	}

}