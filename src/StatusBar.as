package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.BlendMode;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Point;
	import flash.utils.*;
	/**
	 * ...
	 * @author ...
	 */
	public class StatusBar extends Sprite
	{
		// The StatusBar class exists to hold information about and draw a status bar.
		
		
		private var value:int;
		private var maxValue:int;
		
		private var barColour:Number;
		
		// Graphics in use
		[Embed(source="../img/HUDBar_Outline.png")]
		private var gfx_BarOutline:Class;
		[Embed(source = "../img/HUDBar_Back.png")]
		private var gfx_BarBackground:Class;
		[Embed(source = "../img/HUDBar_Piece.png")] 
		private var gfx_BarPiece:Class;
		
		
		// Increaser
		
		// Reducer
		
		// Effect
		
		
		
		public function StatusBar(_value:int, _maxValue:int, _barColour:Number ) 
		{
			value = _value;
			maxValue = _maxValue;
			barColour = _barColour;
			Draw();
		}
		
		public function AddValue(addval:int):void
		{
			value += addval;
			if (value > maxValue)
			{
				value = maxValue;
			}
		}
		
		public function ReduceValue(reduceval:int):void
		{
			value -= reduceval;
			if (value < 0)
			{
				value = 0;
			}
		}
		
		public function Draw():void
		{

			var _outline:Bitmap = new gfx_BarOutline();		
			var _back:Bitmap = new gfx_BarBackground();
			
			// Tint background & pieces to be the same colour as the bar, using a colourmatrix.
			var redvalue:uint = (barColour >> 16) & 0xFF;
			var greenvalue:uint = (barColour >> 8) & 0xFF;
			var bluevalue:uint = barColour & 0xFF;
			// The colour matrix I'm using tries to hit a median blend of the source and target colours.
			// The matrix works like this: on the first row, it gives the resultant Red channel value by multiplying the contents of the cells in the matrix by the source image channel value, going R  G  B  A along the columns.
			// Therefore, it takes a value between 0 and 1 - by dividing the desired colour by 256 we get the fractional value multiplying with the source image, producing
			// a combined colour.
			var colourMatrix:Array = new Array();
			colourMatrix = colourMatrix.concat([redvalue/256, 0, 0, 0, 0]);
			colourMatrix = colourMatrix.concat([0, greenvalue/256, 0, 0, 0]);
			colourMatrix = colourMatrix.concat([0, 0, bluevalue/256, 0, 0]);
			colourMatrix = colourMatrix.concat([0, 0, 0, 1, 0]); // alpha is not modified
			
			
			// Apply the tint
			var colourFilter:ColorMatrixFilter = new ColorMatrixFilter(colourMatrix);
			_back.bitmapData.applyFilter(_back.bitmapData, _back.bitmapData.rect, new Point(0, 0), colourFilter);
			
			// Reposition background
			_back.x = 1;
			_back.y = 1;
			
			// Draw background
			addChild(_back);
					
			
			// Create filled pieces of the bar.
			
			var numPieces:int;
			numPieces = value * 30 / maxValue; // The bar is exactly 29 pieces long
			
			for (var i:int = 0; i < numPieces; i++)
			{
				// Create piece
				var _piece:Bitmap = new gfx_BarPiece();
				_piece.bitmapData.applyFilter(_piece.bitmapData, _piece.bitmapData.rect, new Point(0, 0), colourFilter);
				
				// Position piece
				_piece.x = -2 + i;
				_piece.y = 1;
				
				addChild(_piece);
			}
			
			
			// Draw outline
			addChild(_outline);	
			
			// Crop the bar to make sure pieces do not escape the borders
			var _mask:Shape = new Shape();
			_mask.graphics.beginFill(0xFFFFFF, 0);
			_mask.graphics.drawRect(0, 0, 31, 5);
			_mask.graphics.endFill();
			
			this.mask = _mask;
			addChild(_mask);
			
			
			
			
			

		}
		
		public function Update():void
		{
			// Possibly animate bar?
			Draw();
		}
		
	}

}