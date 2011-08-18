package com.wowactions.pvp 
{
	/**
	 * Contains information related to a Battleground.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com/wowactions
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 10.0
	 * @since 8.17.2011
	 */
	public class Battleground 
	{
		//========================================================
		// Private Properties
		//========================================================
		
		private var _name:String;
		private var _played:Number;
		private var _won:Number;
		
		//========================================================
		// Getters / Setters
		//========================================================
		
		/**
		 * The title of the battleground.
		 */
		public function get name():String { return _name; }
		public function set name(value:String):void
		{
			_name = value;
		}
		
		/**
		 * The number of times the character has played the battleground.  This is only retrieved from a character data retrieval.
		 */
		public function get played():Number { return _played; }
		public function set played(value:Number):void
		{
			_played = value;
		}
		
		/**
		 * The number of times the character has won while playing the battleground.  This is only retrieved from a character data retrieval.
		 */
		public function get won():Number { return _won; }
		public function set won(value:Number):void
		{
			_won = value;
		}
		
		/**
		 * Creates a new instance of the Battleground class.
		 * 
		 * @param	name The title of the battleground.
		 * @param	played The number of times a character has played the battleground.
		 * @param	won The number of times a character has won while playing the battleground.
		 */
		public function Battleground(name:String = "", played:Number = 0, won:Number = 0) 
		{
			this.name = name;
			this.played = played;
			this.won = won;
		}
		
		/**
		 * Returns information from the instance of the class, including name, times played and times won.
		 * 
		 * @return A string representation of the instance of the Battleground class.
		 */
		public function toString():String
		{
			return "Battleground " + name + " played: " + played.toString() + " won: " + won.toString();
		}
		
	}

}
