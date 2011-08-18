package com.wowactions.guilds 
{
	import com.wowactions.characters.Character;
	import com.wowactions.data.Achievement;
	
	/**
	 * The Guild class contains information about a guild, as well as methods to retrieve member and achievement data.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com/wowactions
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 10.0
	 * @since 8.5.2011
	 */
	public class Guild 
	{
		//========================================================
		// Private Properties
		//========================================================
		
		private var _name:String;
		private var _level:int;
		private var _faction:String;
		private var _achievementPoints:Number;
		private var _members:Vector.<Character>;
		private var _achievements:Vector.<Achievement>;
		private var _numMembers:int;
		private var _realm:String;
		
		//========================================================
		// Getters / Setters
		//========================================================
		
		/**
		 * The name of the guild.
		 */
		public function get name():String { return _name; }
		public function set name(value:String):void
		{
			_name = value;
		}
		
		/**
		 * The current level of the guild.
		 */
		public function get level():int { return _level; }
		public function set level(value:int):void
		{
			_level = value;
		}
		
		/**
		 * The faction to which this guild belongs.
		 */
		public function get faction():String { return _faction; }
		public function set faction(value:String):void
		{
			_faction = value;
		}
		
		/**
		 * The number of achievement points this guild as accrued.
		 */
		public function get achievementPoints():Number { return _achievementPoints; }
		public function set achievementPoints(value:Number):void
		{
			_achievementPoints = value;
		}
		
		/**
		 * A vector array of all characters that belong the guild.
		 */
		public function get members():Vector.<Character> { return _members; }
		public function set members(value:Vector.<Character>):void
		{
			_members = value;
			numMembers = members.length;
		}
		
		/**
		 * A vector array of all achievements the guild has either made progress on, or completed.
		 */
		public function get achievements():Vector.<Achievement> { return _achievements; }
		public function set achievements(value:Vector.<Achievement>):void
		{
			_achievements = value;
		}
		
		/**
		 * The number of members currently in the guild.
		 */
		public function get numMembers():int { return _numMembers; }
		public function set numMembers(value:int):void
		{
			_numMembers = value;
		}
		
		public function get realm():String { return _realm; }
		public function set realm(value:String):void
		{
			_realm = value;
		}
		
		//========================================================
		// Constructor Function
		//========================================================
		
		/**
		 * Creates a new instance of the Guild class.
		 */
		public function Guild(name:String = "", level:int = -1, faction:String = "", achievementPoinst:Number = -1) 
		{
			this.name = name;
			this.level = level;
			this.faction = faction;
			this.achievementPoints = achievementPoints;
		}
		
		//========================================================
		// Public Methods
		//========================================================
		
		/**
		 * Retrieves information about a member of the guild.
		 * 
		 * @param	name The name of the member for which data should be retrieved.
		 * @return A <code>Character</code> class containing information about the requested user, or <code>null</code> if members have not been retrieved for the guild.
		 * 
		 * @see com.wowactions.characters.Character
		 */
		public function getMember(name:String):Character
		{
			if (!members) return null;
			
			for (var i:int = 0; i < members.length; i++)
			{
				if (members[i].name.toLowerCase() == name.toLowerCase())
					return members[i];
			}
			
			return null;
		}
		
		/**
		 * Retrieves all members at the given level.
		 * 
		 * @param	level The current level of the members that should be retrieved.
		 * @return A vector array of characters with the given level, or <code>null</code> if members have not been retrieved for the guild.
		 * 
		 * @see com.wowactions.characters.Character
		 */
		public function getMembersAtLevel(level:int):Vector.<Character>
		{
			if (!members) return null;
			
			var chars:Vector.<Character> = new Vector.<Character>();
			for (var i:int = 0; i < members.length; i++)
			{
				if (members[i].level == level)
					chars.push(members[i]);
			}
			
			return chars;
		}
		
		/**
		 * Retrieves members within the given criteria.
		 * 
		 * @param	min The minimum level of the characters to be retrieved.
		 * @param	max The maximum level of the charactesr to be retrieved.
		 * @param	includeMinMax (optional) Whether or not characters at the min or max level should be returned with the rest of the data.
		 * 
		 * @return A vector array of characters within the given parameters, or <code>null</code> if members have not been retrieved for the guild.
		 * 
		 * @see com.wowactions.characters.Character
		 */
		public function getMembersBetweenLevels(min:int, max:int, includeMinMax:Boolean = false):Vector.<Character>
		{
			if (!members) return null;
			if (min > max) throw new Error("Invalid Parameters - min must be less than or equal to max!");
			
			var chars:Vector.<Character> = new Vector.<Character>();
			for(var i:int = 0; i < members.length; i++)
			{
				if (includeMinMax)
				{
					if (members[i].level >= min && members[i].level <= max)
						chars.push(members[i]);
				}
				else
				{
					if (members[i].level > min && members[i].level < max)
						chars.push(members[i]);
				}
			}
			
			return chars;
		}
		
		/**
		 * Retrieves all members above the given level.
		 * 
		 * @param	level The level that members should be above.
		 * @param	includeLevel (optional) Whether or not characters at the given level should be included in the returned data.
		 * 
		 * @return A vector array of characters matching the given parameters, or <code>null</code> if members have not been retrieved for the guild.
		 * 
		 * @see com.wowactions.characters.Character
		 */
		public function getMembersAboveLevel(level:int, includeLevel:Boolean = false):Vector.<Character>
		{
			if (!members) return null;
			
			var chars:Vector.<Character> = new Vector.<Character>();
			for (var i:int = 0; i < members.length; i++)
			{
				if (includeLevel)
				{
					if (members[i].level >= level)
						chars.push(members[i]);
				}
				else
				{
					if (members[i].level > level)
						chars.push(members[i]);
				}
			}
			
			return chars;
		}
		
		/**
		 * Retrieves all users below the given level.
		 * 
		 * @param	level The level that members should be below.
		 * @param	includeLevel (optional) Whether or not users at the given level should be included in the returned data.
		 * 
		 * @return A vector array of members matching the given parameters, or <code>null</code> if members have not been retrieved for the guild.
		 * 
		 * @see com.wowactions.characters.Character
		 */
		public function getMembersBelowLevel(level:int, includeLevel:Boolean = false):Vector.<Character>
		{
			if (!members) return null;
			
			var chars:Vector.<Character> = new Vector.<Character>();
			for (var i:int = 0; i < members.length; i++)
			{
				if (includeLevel)
				{
					if (members[i].level <= level)
						chars.push(members[i]);
				}
				else
				{
					if (members[i].level < level)
						chars.push(members[i]);
				}
			}
			
			return chars;
		}
		
		/**
		 * Retrieves all members that have a main spec of the given spec.
		 * 
		 * @param	specName The name of the spec that determines which members are retrieved.
		 * 
		 * @return A vector array of members with the given spec, or <code>null</code> if members have not been retrieved for the guild.
		 * 
		 * @see com.wowactions.characters.Character
		 * @see com.wowactions.characters.classes.CharacterClassData
		 */
		public function getMembersByCharacterClass(characterClassName:String):Vector.<Character>
		{
			if (!members) return null;
			
			var chars:Vector.<Character> = new Vector.<Character>();
			for (var i:int = 0; i < members.length; i++)
			{
				if (members[i].characterClass.name.toLowerCase() == characterClassName.toLowerCase())
					chars.push(members[i]);
			}
			
			return chars;
		}
		
		/**
		 * Retrieves all members of the given race.
		 * 
		 * @param	raceName The name of the race that determines which members to retrieve.
		 * 
		 * @return A vector array of members with the given spec, or <code>null</code> if members have not been retrieved for the guild.
		 * 
		 * @see com.wowactions.characters.Character
		 * @see com.wowactions.races.RaceData
		 */
		public function getMembersByRace(raceName:String):Vector.<Character>
		{
			if (!members) return null;
			
			var chars:Vector.<Character> = new Vector.<Character>();
			for (var i:int = 0; i < members.length; i++)
			{
				if (members[i].race.name.toLowerCase() == raceName.toLowerCase())
					chars.push(members[i]);
			}
			
			return chars;
		}
		
		/**
		 * Retrieves all achievements that have been completed by the guild.
		 * 
		 * @return A vector array of achievements, or <code>null</code> if no achievements have been retrieved for the guild.
		 * 
		 * @see com.wowactions.data.Achievement
		 */
		public function getCompletedAchievements():Vector.<Achievement>
		{
			if (!achievements) return null;
			
			var completedAchievs:Vector.<Achievement> = new Vector.<Achievement>();
			for (var i:int = 0; i < achievements.length; i++)
			{
				if (achievements[i].completed)
					completedAchievs.push(achievements);
			}
			
			return completedAchievs;
		}
		
		/**
		 * Retrieves all achievements that have been started, but not completed, by the guild.
		 * 
		 * @return A vector array of achievements, or <code>null</code> of achievements have not been retrieved for the guild.
		 * 
		 * @see com.wowactions.data.Achievement
		 */
		public function getIncompleteAchievements():Vector.<Achievement>
		{
			if (!achievements) return null;
			
			var incompleteAchievs:Vector.<Achievement> = new Vector.<Achievement>();
			for (var i:int = 0; i < achievements.length; i++)
			{
				if (!achievements[i].completed)
					incompleteAchievs.push(achievements[i]);
			}
			
			return incompleteAchievs;
		}
		
		/**
		 * Returns basic guild information in string form.
		 * @return
		 */
		public function toString():String
		{
			return name + ", Level: " + level + ", Faction: " + faction + " Guild, Achievement Points: " + achievementPoints;
		}
		
	}

}
