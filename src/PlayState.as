package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class PlayState extends FlxState
	{
		public var player:Player;
		public var level:Level1;
		public var _goal:FlxExtendedSprite;
		public var shooter:Shooter;
		public var bullets:FlxGroup;
		
		private var btnFindPath:FlxButton;
		private var _action:int;
		private const ACTION_GO:int = 1;
		private const ACTION_IDLE:int = 0;
		private const TILE_WIDTH:int = 16;
		private const TILE_HEIGHT:int = 16;
		
		override public function create():void
		{
			if (FlxG.getPlugin(FlxMouseControl) == null)
			{
				FlxG.addPlugin(new FlxMouseControl);
			}
			
			level = new Level1;
			level.
			
			add(new FlxText(0, 0, 100, "Hello, World!")); 
			player = new Player(TILE_WIDTH * 0, TILE_HEIGHT * 4);   
			
			shooter = new Shooter(TILE_WIDTH * 2, TILE_HEIGHT * 4);
			//shooter.enableMouseDrag( true, true );
			
			var numPlayerBullets:uint = 8;
			bullets = new FlxGroup(numPlayerBullets);//Initializing the array is very important and easy to forget!
			var sprite:FlxSprite;
			var i:int;
			for(i = 0; i < numPlayerBullets; i++)			//Create 8 bullets for the player to recycle
			{
				sprite = new FlxSprite(-100,-100);	//Instantiate a new sprite offscreen
				sprite.makeGraphic(2,2);			//Create a 2x8 white box
				sprite.exists = false;
				bullets.add(sprite);			//Add it to the group of player bullets
			}
			
			add(level);
			add(player);
			add(shooter);
			add(bullets);
		
			//Add button move to goal to PlayState
			btnFindPath = new FlxButton(0, 0, "Move To Goal", moveToGoal);
			add(btnFindPath);
            
			_goal = new FlxExtendedSprite(TILE_WIDTH*15, TILE_HEIGHT*8);
			_goal.makeGraphic(TILE_WIDTH, TILE_HEIGHT, 0xffffff00);
			_goal.alpha = 0.5;
			_goal.enableMouseDrag( true, true );
			add(_goal);
			
			//FlxG.mouse.show();
			
			//	These are debugger watches. Bring up the debug console (the ' key by default) and you'll see their values in real-time as you play
			FlxG.watch(player.acceleration, "x", "ax");
			FlxG.watch(player.velocity, "x", "vx");
			FlxG.watch(player.velocity, "y", "vy");
		}
		
		override public function update():void
		{
			super.update();
			
			FlxG.collide(player, level);
			
			FlxG.overlap(player, bullets, stuffHitStuff);
			
			if(!player.exists)
			{
				player.revive();
				player.x = 0 * TILE_WIDTH;
				player.y = 4 * TILE_HEIGHT;
			}
		}
		
		private function moveToGoal():void
		{
			//Find path to goal
			var path:FlxPath = level.map.findPath(new FlxPoint(player.x + player.width / 2, player.y + player.height / 2), new FlxPoint(_goal.x + _goal.width / 2, _goal.y + _goal.height / 2));
			
			if ( path != null ) {
				player.followPath(path);
			}
		}
		
		protected function stuffHitStuff(Object1:FlxObject,Object2:FlxObject):void
		{
			Object1.kill()
			Object2.kill();
		}
		
	}

}