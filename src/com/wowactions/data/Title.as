package com.wowactions.data 
{
	/**
	 * Contains information about a specific title that can be earned.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com/wowactions
	 * 
	 * @langversion 3.0
	 * @playerversion 10.0
	 * @since 8.17.2011
	 */
	public class Title 
	{
		//========================================================
		// Private Properties
		//========================================================
		
		private var _id:Number;
		private var _name:String;
		private var _selected:Boolean;
		
		//========================================================
		// Getters / Setters
		//========================================================
		
		/**
		 * The unique identifier of the title.
		 */
		public function get id():Number { return _id; }
		public function set id(value:Number):void
		{
			_id = value;
		}
		
		/**
		 * The raw name of the title, which does NOT include a characters name.
		 */
		public function get name():String { return _name; }
		public function set name(value:String):void
		{
			_name = value;
		}
		
		/**
		 * Whether or not the title is selected.  This will only be set if title information is obtained during character data retrieval.
		 */
		public function get selected():Boolean { return _selected; }
		public function set selected(value:Boolean):void
		{
			_selected = value;
		}
		
		//========================================================
		// Constructor Function
		//========================================================
		
		/**
		 * Creates a new instance of the Title class.
		 * 
		 * @param	id The unique identifier of the title.
		 * @param	name The raw name of the title, which does NOT include a characters name.
		 * @param	selected Whether or not the title is selected.  This will only be set if title information is obtained during character data retrieval.
		 */
		public function Title(id:Number = -1, name:String = "", selected:Boolean = false) 
		{
			_id = id;
			_name = name;
			_selected = selected;
		}
		
		//========================================================
		// Public Methods
		//========================================================
		
		/**
		 * Formats a the title with the given character name.
		 * 
		 * @param	characterName The character name that should be added to the title.
		 * 
		 * @return The title, including the name of the character.
		 */
		public function formatTitleWithName(characterName:String):String
		{
			return _name.replace("%s", characterName);
		}
		
		/**
		 * Returns information related to the instance of the Title class, including the name (exluding a character name) and whether or not the title is selected.
		 * 
		 * @return A string representation of the instance of the Title class.
		 */
		public function toString():String
		{
			return "Title: " + name + " - selected: " + selected;
		}
		
	}

}
