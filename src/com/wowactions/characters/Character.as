package com.wowactions.characters 
{
	import com.wowactions.characters.CharacterClass;
	import com.wowactions.companions.Companion;
	import com.wowactions.data.Achievement;
	import com.wowactions.data.IMergeable;
	import com.wowactions.data.Reputation;
	import com.wowactions.data.Title;
	import com.wowactions.guilds.Guild;
	import com.wowactions.mounts.Mount;
	import com.wowactions.pets.Pet;
	import com.wowactions.professions.Profession;
	import com.wowactions.pvp.ArenaTeam;
	import com.wowactions.pvp.Battleground;
	import com.wowactions.raids.Raid;
	import com.wowactions.races.Race;
	
	/**
	 * Contains data about a specific character from the game.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com/wowactions
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 10.0
	 * @since 8.5.2011
	 */
	public class Character implements IMergeable
	{
		//========================================================
		// Private Properties
		//========================================================
		
		private var _name:String;
		private var _realm:String;
		private var _characterClass:CharacterClass;
		private var _race:Race;
		private var _gender:String;
		private var _level:int;
		private var _achievementPoints:int;
		private var _thumbnail:String;
		private var _achievements:Vector.<Achievement>;
		private var _guild:Guild;
		private var _guildRank:int;
		private var _averageItemLevel:int;
		private var _averageItemLevelEquipped:int;
		private var _stats:Stats;
		private var _reputations:Vector.<Reputation>;
		private var _titles:Vector.<Title>;
		private var _companions:Vector.<Companion>;
		private var _pets:Vector.<Pet>;
		private var _mounts:Vector.<Mount>;
		private var _appearance:Appearance;
		private var _progression:Vector.<Raid>;
		private var _totalHonorableKills:Number;
		private var _personalRbgRating:Number;
		private var _arenaTeams:Vector.<ArenaTeam>;
		private var _battlegrounds:Vector.<Battleground>;
		private var _professions:Vector.<Profession>;
		
		//========================================================
		// Getters / Setters
		//========================================================
		
		/**
		 * The in-game name of the character.
		 */
		public function get name():String { return _name; }
		public function set name(value:String):void 
		{
			_name = value;
		}
		
		/**
		 * The name and currently selected title of the character.  If no title is currently selected or there is no title data, it will return the name with no title.
		 */
		public function get formalName():String
		{
			if (titles)
			{
				for (var i:int = 0; i < titles.length; i++)
				{
					if (titles[i].selected)
						return titles[i].formatTitleWithName(name);
				}
			}
			
			return name;
		}
		
		/**
		 * The server to which this character belongs.
		 */
		public function get realm():String { return _realm; }
		public function set realm(value:String):void
		{
			_realm = value;
		}
		
		/**
		 * The class of the character (i.e. Warlock, Druid, etc.)
		 */
		public function get characterClass():CharacterClass { return _characterClass; }
		public function set characterClass(value:CharacterClass):void
		{
			_characterClass = value;
		}
		
		/**
		 * The race of the character (i.e. Human, Blood Elf, etc.)
		 */
		public function get race():Race { return _race; }
		public function set race(value:Race):void
		{
			_race = value;
		}
		
		/**
		 * Whether or not this character is male or female.
		 */
		public function get gender():String { return _gender; }
		public function set gender(value:String):void
		{
			_gender = (value == "0") ? "Male" : "Female";
		}
		
		/**
		 * The current level of the character.
		 */
		public function get level():int { return _level; }
		public function set level(value:int):void
		{
			_level = value;
		}
		
		/**
		 * The number of achievement points the character has earned.
		 */
		public function get achievementPoints():int { return _achievementPoints; }
		public function set achievementPoints(value:int):void
		{
			_achievementPoints = value;
		}
		
		/**
		 * The path to the thumbnail representation of this character.
		 */
		public function get thumbnail():String { return _thumbnail; }
		public function set thumbnail(value:String):void
		{
			_thumbnail = value;
		}
		
		/**
		 * A vector array of achievements either completed or currently in progress.
		 */
		public function get achievements():Vector.<Achievement> { return _achievements; }
		public function set achievements(value:Vector.<Achievement>):void
		{
			_achievements = value;
		}
		
		/**
		 * The rank of this character in their guild.
		 */
		public function get guildRank():int { return _guildRank; }
		public function set guildRank(value:int):void
		{
			_guildRank = value;
		}
		
		/**
		 * The guild to which this character belongs.
		 */
		public function get guild():Guild { return _guild; }
		public function set guild(value:Guild):void
		{
			_guild = value;
		}
		
		/**
		 * The average item level of this character.
		 */
		public function get averageItemLevel():int { return _averageItemLevel; }
		public function set averageItemLevel(value:int):void
		{
			_averageItemLevel = value;
		}
		
		/**
		 * The average item level of the character, based on items currently equipped.
		 */
		public function get averageItemLevelEquipped():int { return _averageItemLevelEquipped; }
		public function set averageItemLevelEquipped(value:int):void
		{
			_averageItemLevelEquipped = value;
		}
		
		/**
		 * The various stats of the character, including information like total health, mana, various crit ratings, etc.
		 */
		public function get stats():Stats { return _stats; }
		public function set stats(value:Stats):void
		{
			_stats = value;
		}
		
		/**
		 * All reputations where some amount of progess by the character has been made.
		 */
		public function get reputations():Vector.<Reputation> { return _reputations; }
		public function set reputations(value:Vector.<Reputation>):void
		{
			_reputations = value;
		}
		
		/**
		 * A vector array of all titles obtained by the character, including the currently selected title.
		 * 
		 * @see #getNameWithSelectedTitle()
		 */
		public function get titles():Vector.<Title> { return _titles; }
		public function set titles(value:Vector.<Title>):void
		{
			_titles = value;
		}
		
		/**
		 * A vector array of all non-combat pets obtained by the character.
		 */
		public function get companions():Vector.<Companion> { return _companions; }
		public function set companions(value:Vector.<Companion>):void
		{
			_companions = value;
		}
		
		/**
		 * A vector array of all combat pets obtained by the character.
		 */
		public function get pets():Vector.<Pet> { return _pets; }
		public function set pets(value:Vector.<Pet>):void
		{
			_pets = value;
		}
		
		/**
		 * A vector array of all mounts obtained by the character.
		 */
		public function get mounts():Vector.<Mount> { return _mounts; }
		public function set mounts(value:Vector.<Mount>):void
		{
			_mounts = value;
		}
		
		/**
		 * The current selections regarding what the character looks like.
		 */
		public function get appearance():Appearance { return _appearance; }
		public function set appearance(value:Appearance):void
		{
			_appearance = value;
		}
		
		/**
		 * A vector array of all raids with information on character completedness.
		 */
		public function get progression():Vector.<Raid> { return _progression; }
		public function set progression(value:Vector.<Raid>):void
		{
			_progression = value;
		}
		
		/**
		 * The Personal Rating of Rated Battlegrounds
		 */
		public function get personalRbgRating():Number { return _personalRbgRating; }
		public function set personalRbgRating(value:Number):void
		{
			_personalRbgRating = value;
		}
		
		/**
		 * The total number of honorable kills 
		 */
		public function get totalHonorableKills():Number { return _totalHonorableKills; }
		public function set totalHonorableKills(value:Number):void
		{
			_totalHonorableKills = value;
		}
		
		/**
		 * All arena teams membership information for the character.
		 */
		public function get arenaTeams():Vector.<ArenaTeam> { return _arenaTeams; }
		public function set arenaTeams(value:Vector.<ArenaTeam>):void
		{
			_arenaTeams = value;
		}
		
		/**
		 * Battleground information for all battlegrounds which the character has particpated.
		 */
		public function get battlegrounds():Vector.<Battleground> { return _battlegrounds; }
		public function set battlegrounds(value:Vector.<Battleground>):void
		{
			_battlegrounds = value;
		}
		
		/**
		 * All known professions of the character.
		 */
		public function get professions():Vector.<Profession> { return _professions; }
		public function set professions(value:Vector.<Profession>):void
		{
			_professions = value;
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
		
		
		
		//========================================================
		// Raid Data Methods
		//========================================================
		
		/**
		 * Gets raid progression info for a single raid.
		 * 
		 * @param	raidName The name of the raid for which data should be returned.
		 * 
		 * @return An instance of the populated Raid class.
		 * 
		 * @see com.wowactions.pve.Raid
		 */
		public function getRaidProgression(raidName:String):Raid
		{
			if (!progression) return null;
			
			for (var i:int = 0; i < progression.length; i++)
			{
				if (progression[i].name.toLowerCase() == raidName.toLowerCase())
				{
					return progression[i];
				}
			}
			
			return null;
		}
		
		//========================================================
		// Merge Method
		//========================================================
		
		/**
		 * <p>The merge method allows you to merge data from another character class to this one.  The idea behind this is that there can be
		 * multiple calls for data at different times for the same character.  By merging the resulting character classes,
		 * you can keep all the data for one character in a single instance of the class.  This also is an attempt to help reduce the number of calls to the api, since
		 * you can keep merging character data from subsequent api calls to reduce the number of calls in the future.</p>
		 * 
		 * <p><b>Please note: Only information not present in the main character class will be merged with the data of the 
		 * character class passed to the merge method.</b>  In other words, if the main class does not have data for an attribute, and the merging class does,
		 * only then will the data from the merging class be merged with the main class.</p>
		 * 
		 * @param	character The character class from which data should be merged.
		 * 
		 * @throws Error: Only classes of type Character can be merged!
		 */
		public function merge(characterClass:IMergeable):void
		{
			var character:Character = characterClass as Character;
			
			if (!character)
			{
				throw new Error("Only classes of type Character can be merged!");
				return;
			}
			
			if (!achievementPoints && character.achievementPoints)
				this.achievementPoints = character.achievementPoints;
			
			if (!achievements && character.achievements)
				this.achievements = character.achievements;
			
			if (!averageItemLevel && character.averageItemLevel)
				this.averageItemLevel = character.averageItemLevel;
			
			if (!averageItemLevelEquipped && character.averageItemLevelEquipped)
				this.averageItemLevelEquipped = character.averageItemLevelEquipped;
			
			if (!characterClass && character.characterClass)
				this.characterClass = character.characterClass;
			
			if (!gender && character.gender)
				this.gender = character.gender;
			
			if (!guild && character.guild)
				this.guild = character.guild;
			
			if (!guildRank && character.guildRank)
				this.guildRank = character.guildRank;
			
			if (!level && character.level)
				this.level = character.level;
			
			if (!name && character.name)
				this.name = character.name;
			
			if (!race && character.race)
				this.race = character.race;
			
			if (!realm && character.realm)
				this.realm = character.realm;
			
			if (!stats && character.stats)
				this.stats = character.stats;
			
			if (!thumbnail && character.thumbnail)
				this.thumbnail = character.thumbnail;
			
			if (!reputations && character.reputations)
				this.reputations = character.reputations;
			
			if (!titles && character.titles)
				this.titles = character.titles;
			
			if (!companions && character.companions)
				this.companions = character.companions;
			
			if (!pets && character.pets)
				this.pets = character.pets;
			
			if (!appearance && character.appearance)
				this.appearance = character.appearance;
			
			if (!progression && character.progression)
				this.progression = character.progression;
			
			if (!personalRbgRating && character.personalRbgRating)
				this.personalRbgRating = character.personalRbgRating;
			
			if (!totalHonorableKills && character.totalHonorableKills)
				this.totalHonorableKills = character.totalHonorableKills;
			
			if (!battlegrounds && character.battlegrounds)
				this.battlegrounds = character.battlegrounds;
			
			if (!arenaTeams && character.arenaTeams)
				this.arenaTeams = character.arenaTeams;
		}
		
		/**
		 * Gives basic character info, including name, level, race, and class.
		 * 
		 * @return A string containing name, level, race and class.
		 */
		public function toString():String
		{
			return name + " Level " + level + " " + race.name + " " + characterClass.name;
		}
	}

}
