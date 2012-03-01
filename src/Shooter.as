package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class Shooter extends FlxExtendedSprite
	{
		[Embed(source = '../assets/player.png')] private var playerPNG:Class;
		private var shotClock:Number;
		
		public function Shooter(X:Number, Y:Number) 
		{
			super(X, Y);
			
			//	Load the player.png into this sprite.
			//	The 2nd parameter tells Flixel it's a sprite sheet and it should chop it up into 16x18 sized frames.
			loadGraphic(playerPNG, true, true, 16, 18, true);
			
			resetShotClock();
		}
		
		private function resetShotClock():void
		{
			shotClock = 1+FlxG.random()*10;
		}
		
		override public function update():void
		{
			super.update();
			
			//Then do some bullet shooting logic
			shotClock -= FlxG.elapsed; 
			if(shotClock <= 0)
			{
				//We counted down to zero, so it's time to shoot a bullet!
				resetShotClock();
				var bullet:FlxSprite = (FlxG.state as PlayState).bullets.recycle() as FlxSprite;
				bullet.reset(x + width / 2 - bullet.width / 2, y);
				
				bullet.velocity.y = (FlxG.state as PlayState).player.y - y;
				bullet.velocity.x = (FlxG.state as PlayState).player.x - x;
			}
		}
		
	}

}