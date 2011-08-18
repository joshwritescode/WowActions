package com.wowactions.pvp 
{
	/**
	 * Contains information related to a specific Arena Team.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com/wowactions
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 10.0
	 * @since 8.17.2011
	 */
	public class ArenaTeam 
	{
		//========================================================
		// Private Properties
		//========================================================
		
		private var _name:String;
		private var _personalRating:Number;
		private var _teamRating:Number;
		private var _size:String;
		
		//========================================================
		// Getters / Setters
		//========================================================
		
		/**
		 * The name of the arena team.
		 */
		public function get name():String { return _name; }
		public function set name(value:String):void
		{
			_name = value;
		}
		
		/**
		 * If data was retrieved during a character data request, the personal rating of that character will be included.
		 */
		public function get personalRating():Number { return _personalRating; }
		public function set personalRating(value:Number):void
		{
			_personalRating = value;
		}
		
		/**
		 * The rating of the team as a whole.
		 */
		public function get teamRating():Number { return _teamRating; }
		public function set teamRating(value:Number):void
		{
			_teamRating = value;
		}
		
		/**
		 * The size of the arena team. i.e. 5v5
		 */
		public function get size():String { return _size; }
		public function set size(value:String):void
		{
			_size = value;
		}
		
		/**
		 * Creates a new instance of the ArenaTeam class.
		 * 
		 * @param	name The name of the arena team.
		 * @param	personalRating The rating of a specific character belonging to this arena team.
		 * @param	teamRating The rating of the team as a whole.
		 * @param	size The size of the arena team, i.e. 5v5
		 */
		public function ArenaTeam(name:String, personalRating:Number = 0, teamRating:Number = 0, size:String = "") 
		{
			this.name = name;
			this.personalRating = personalRating;
			this.teamRating = teamRating;
			this.size = size;
		}
		
		/**
		 * Returns information related to the arena team, including name, size, and team rating.
		 * 
		 * @return A string representation of this instance of the ArenaTeam class.
		 */
		public function toString():String
		{
			return "Arena Team: " + name + " Size: " + size + " Rating " + teamRating.toString();
		}
		
	}

}
