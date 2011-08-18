package com.wowactions.companions 
{
	/**
	 * Contains information related to a non-combat pet.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com/wowactions
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 10.0
	 * @since 8.17.2011
	 */
	public class Companion 
	{
		//========================================================
		// Private Properties
		//========================================================
		
		private var _id:Number;
		
		//========================================================
		// Getters / Setters
		//========================================================
		
		/**
		 * The unique identifier of the companion.
		 */
		public function get id():Number { return _id; }
		public function set id(value:Number):void
		{
			_id = value;
		}
		
		//========================================================
		// Constructor Function
		//========================================================
		
		/**
		 * Creates a new instance of the Companion class.
		 * 
		 * @param	id The unique identifier of the companion.
		 */
		public function Companion(id:Number = -1) 
		{
			this.id = id;
		}
		
	}

}
