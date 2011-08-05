package com.wowactions.characters 
{
	import com.wowactions.characters.classes.CharacterClass;
	import com.wowactions.data.Achievement;
	import com.wowactions.guilds.Guild;
	import com.wowactions.races.Race;
	
	/**
	 * Contains data about a specific character from the game.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 9.0
	 * @since 8.5.2011
	 */
	public class Character 
	{
		//========================================================
		// Private Properties
		//========================================================
		
		private var _name:String;
		private var _realm:String;
		private var _mainSpec:CharacterClass;
		private var _race:Race;
		private var _gender:String;
		private var _level:int;
		private var _achievementPoints:int;
		private var _thumbnail:String;
		private var _achievements:Vector.<Achievement>;
		private var _guild:Guild;
		private var _guildRank:int;
		
		//========================================================
		// Getters / Setters
		//========================================================
		
		public function get name():String { return _name; }
		public function set name(value:String):void 
		{
			_name = value;
		}
		
		public function get realm():String { return _realm; }
		public function set realm(value:String):void
		{
			_realm = value;
		}
		
		public function get mainSpec():CharacterClass { return _mainSpec; }
		public function set mainSpec(value:CharacterClass):void
		{
			_mainSpec = value;
		}
		
		public function get race():Race { return _race; }
		public function set race(value:Race):void
		{
			_race = value;
		}
		
		public function get gender():String { return _gender; }
		public function set gender(value:String):void
		{
			_gender = (value == "0") ? "Male" : "Female";
		}
		
		public function get level():int { return _level; }
		public function set level(value:int):void
		{
			_level = value;
		}
		
		public function get achievementPoints():int { return _achievementPoints; }
		public function set achievementPoints(value:int):void
		{
			_achievementPoints = value;
		}
		
		public function get thumbnail():String { return _thumbnail; }
		public function set thumbnail(value:String):void
		{
			_thumbnail = value;
		}
		
		public function get achievements():Vector.<Achievement> { return _achievements; }
		public function set achievements(value:Vector.<Achievement>):void
		{
			_achievements = value;
		}
		
		public function get guildRank():int { return _guildRank; }
		public function set guildRank(value:int):void
		{
			_guildRank = value;
		}
		
		public function get guild():Guild { return _guild; }
		public function set guild(value:Guild):void
		{
			_guild = value;
		}
		
		//========================================================
		// Constructor Function
		//========================================================
		
		public function Character() 
		{
			
		}
		
		//========================================================
		// Public Methods
		//========================================================
		
		public function toString():String
		{
			return name + " Level " + level + " " + race.name + " " + mainSpec.name;
		}
	}

}
