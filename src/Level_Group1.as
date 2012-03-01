//Code generated with DAME. http://www.dambots.com

package 
{
	import org.flixel.*;
	import flash.utils.Dictionary;
	public class Level_Group1 extends BaseLevel
	{
		//Embedded media...
		[Embed(source="../assets/mapCSV_Group1_Map1.csv", mimeType="application/octet-stream")] public var CSV_Map1:Class;
		[Embed(source="../map/tiles.png")] public var Img_Map1:Class;

		//Tilemaps
		public var layerMap1:FlxTilemap;

		//Properties


		public function Level_Group1(addToStage:Boolean = true, onAddCallback:Function = null, parentObject:Object = null)
		{
			// Generate maps.
			var properties:Array = [];
			var tileProperties:Dictionary = new Dictionary;

			properties = generateProperties( null );
			layerMap1 = addTilemap( CSV_Map1, Img_Map1, 0.000, 0.000, 16, 16, 1.000, 1.000, false, 1, 1, properties, onAddCallback );

			//Add layers to the master group in correct order.
			masterLayer.add(layerMap1);

			if ( addToStage )
				createObjects(onAddCallback, parentObject);

			boundsMinX = 0;
			boundsMinY = 0;
			boundsMaxX = 320;
			boundsMaxY = 240;
			bgColor = 0xff000000;
		}

		override public function createObjects(onAddCallback:Function = null, parentObject:Object = null):void
		{
			generateObjectLinks(onAddCallback);
			if ( parentObject != null )
				parentObject.add(masterLayer);
			else
				FlxG.state.add(masterLayer);
		}

		public function generateObjectLinks(onAddCallback:Function = null):void
		{
		}

	}
}
