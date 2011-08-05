package com.wowactions.races 
{
	/**
	 * The Race class contains properties specific to all races of the game.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 9.0
	 * @since 8.5.2011
	 */
	public class Race
	{
		//========================================================
		// Private Properties
		//========================================================
		
		private var _id:Number;
		private var _mask:Number;
		private var _faction:String;
		private var _name:String;
		
		//========================================================
		// Getters / Setters
		//========================================================
		
		/**
		 * The unique number identifier for this race.
		 */
		public function get id():Number { return _id; }
		public function set id(value:Number):void
		{
			_id = value;
		}
		
		/**
		 * The mask for this race.
		 */
		public function get mask():Number { return _mask; }
		public function set mask(value:Number):void
		{
			_mask = value;
		}
		
		/**
		 * The side this race belongs to.
		 */
		public function get faction():String { return _faction; }
		public function set faction(value:String):void
		{
			_faction = value;
		}
		
		/**
		 * The name of the race.
		 */
		public function get name():String { return _name; }
		public function set name(value:String):void
		{
			_name = value;
		}
		
		//========================================================
		// Constructor Function
		//========================================================
		
		/**
		 * Creates a new instance of the Race class.
		 * 
		 * @param	id (optional) The unique number identifier for this race.
		 * @param	mask (optional) The mask for this race.
		 * @param	faction (optional) The side this race belongs to.
		 * @param	name (optional) The name of the race.
		 */
		public function Race(id:Number = -1, mask:Number = -1, faction:String = "", name:String = "")
		{
			_id = id;
			_mask = mask;
			_faction = faction;
			_name = name;
		}
		
		//========================================================
		// Public Methods
		//========================================================
		
		public function toString():String
		{
			return "Race: " + id + " mask: " + mask + " faction: " + faction + " name: " + name;
		}
	}
}
