package com.wowactions.professions 
{
	/**
	 * Contains information for a single profession.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com/wowactions
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 10.0
	 * @since 8.17.2011
	 */
	public class Profession 
	{
		//========================================================
		// Private Properties
		//========================================================
		
		private var _id:Number;
		private var _name:String;
		private var _icon:String;
		private var _rank:Number;
		private var _max:Number;
		private var _isPrimary:Boolean;
		private var _recipes:Vector.<Recipe>;
		
		//========================================================
		// Getters / Setters
		//========================================================
		
		/**
		 * The unique identifier of the profession.
		 */
		public function get id():Number { return _id; }
		public function set id(value:Number):void
		{
			_id = value;
		}
		
		/**
		 * The name of the profession.
		 */
		public function get name():String { return _name; }
		public function set name(value:String):void
		{
			_name = value;
		}
		
		/**
		 * The name of the icon for the profession.
		 */
		public function get icon():String { return _icon; }
		public function set icon(value:String):void
		{
			_icon = value;
		}
		
		/**
		 * The current skill level for the profession.
		 */
		public function get rank():Number { return _rank; }
		public function set rank(value:Number):void
		{
			_rank = value;
		}
		
		/**
		 * The maximum skill level of the current rank.
		 */
		public function get max():Number { return _max; }
		public function set max(value:Number):void
		{
			_max = value;
		}
		
		/**
		 * Whether or not this is a primary profession.
		 */
		public function get isPrimary():Boolean { return _isPrimary; }
		public function set isPrimary(value:Boolean):void
		{
			_isPrimary = value;
		}
		
		/**
		 * Recipes associated with this profession.  If this instance is returned from character data retrieval,
		 * this array will only include known recipes.
		 */
		public function get recipes():Vector.<Recipe> { return _recipes; }
		public function set recipes(value:Vector.<Recipe>):void
		{
			_recipes = value;
		}
		
		/**
		 * Creates a new instance of the profession.
		 * 
		 * @param	id The unique identifier of the profession.
		 * @param	name The name of the profession.
		 * @param	icon The name of the icon of the profession.
		 * @param	rank The current skill level of this profession.
		 * @param	max The maximum skill for the rank.
		 * @param	isPrimary Whether or not this is a primary profession.
		 * @param	recipes Any recipes associated with this profession.  Will only include known recipes if profession information is retrieved during a character data request.
		 */
		public function Profession(id:Number = -1, name:String = "", icon:String = "", rank:Number = 0, max:Number = 0, isPrimary:Boolean = false, recipes:Vector.<Recipe> = null)
		{
			this.id = id;
			this.name = name;
			this.icon = icon;
			this.rank = rank;
			this.max = max;
			this.isPrimary = isPrimary;
			this.recipes = recipes;
		}
		
		/**
		 * The Profession, in string form.
		 * 
		 * @return A string with basic profession information, including name, rank, and max.
		 */
		public function toString():String
		{
			return name + ": " + rank.toString() + "/" + max.toString();
		}
		
	}

}
