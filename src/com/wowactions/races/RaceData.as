package com.wowactions.races 
{
	/**
	 * A static class that contains data and methods related to all races within the game.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 9.0
	 * @since 8.5.2011
	 */
	public class RaceData 
	{
		//========================================================
		// Public Properties
		//========================================================
		
		/**
		 * The name of the Alliance faction.
		 * 
		 * @see #getAllRacesByFaction()
		 */
		public static const FACTION_ALLIANCE:String = "Alliance";
		
		/**
		 * The name of the Horde faction.
		 * 
		 * @see #getAllRacesByFaction()
		 */
		public static const FACTION_HORDE:String = "Horde";
		
		public static const DWARF:String = "Dwarf";
		public static const TAUREN:String = "Tauren";
		public static const UNDEAD:String = "Undead";
		public static const ORC:String = "Orc";
		public static const GNOME:String = "Gnome";
		public static const TROLL:String = "Troll";
		public static const GOBLIN:String = "Goblin";
		public static const DRAENEI:String = "Draenei";
		public static const WORGEN:String = "Worgen";
		public static const BLOOD_ELF:String = "Blood Elf";
		public static const HUMAN:String = "Human";
		public static const NIGHT_ELF:String = "Night Elf";
		
		//========================================================
		// Public Static Methods
		//========================================================
		
		/**
		 * Retrieves all known races from the game.
		 * 
		 * @return A vector array of <code>Race</code> classes containing information about that specific race.
		 * 
		 * @see com.wowactions.races.Race
		 */
		public static function getAllRaces():Vector.<Race>
		{
			var races:Vector.<Race> = new Vector.<Race>();
			
			races.push(new Race(3, 4, "Alliance", "Dwarf"));
			races.push(new Race(6, 32, "Horde", "Tauren"));
			races.push(new Race(5, 16, "Horde", "Undead"));
			races.push(new Race(2, 2, "Horde", "Orc"));
			races.push(new Race(7, 64, "Alliance", "Gnome"));
			races.push(new Race(8, 128, "Horde", "Troll"));
			races.push(new Race(9, 256, "Horde", "Goblin"));
			races.push(new Race(11, 1024, "Alliance", "Draenei"));
			races.push(new Race(22, 2097125, "Alliance", "Worgen"));
			races.push(new Race(10, 512, "Horde", "Blood Elf"));
			races.push(new Race(1, 1, "Alliance", "Human"));
			races.push(new Race(4, 8, "Alliance", "Night Elf"));
			
			return races;
		}
		
		/**
		 * Retrieves all races that belong to the given faction.
		 * 
		 * @param	faction The side from which races should be retrieved.
		 * 
		 * @return A vector array of races that belong to the given faction.
		 * 
		 * @see #FACTION_ALLIANCE
		 * @see #FACTION_HORDE
		 * @see com.wowactions.races.Race
		 */
		public static function getAllRacesByFaction(faction:String):Vector.<Race>
		{
			var allRaces:Vector.<Race> = getAllRaces();
			var races:Vector.<Race> = new Vector.<Race>();
			
			for (var i:int = 0; i < allRaces.length; i++)
			{
				if (allRaces[i].faction.toLowerCase() == faction.toLowerCase())
				{
					races.push(allRaces[i]);
				}
			}
			
			return races;
		}
		
		/**
		 * Retrieves the race that matches the given id.
		 * 
		 * @param	id The id of the race that should be returned
		 * 
		 * @return A <code>Race</code> matching the given id, or <code>null</code> if there is no match.
		 * 
		 * @see com.wowactions.races.Race
		 */
		public static function getRaceById(id:Number):Race
		{
			var allRaces:Vector.<Race> = getAllRaces();
			
			for (var i:int = 0; i < allRaces.length; i++)
			{
				if (allRaces[i].id == id)
				{
					return allRaces[i];
				}
			}
			
			return null;
		}
		
		/**
		 * Retrieves the race that matches the given name.
		 * 
		 * @param	name The name of the race that should be returned.
		 * 
		 * @return A <code>Race</code> matching the given name, or <code>null</code> if there is no match.
		 * 
		 * @see com.wowactions.races.Race
		 */
		public static function getRaceByName(name:String):Race
		{
			var allRaces:Vector.<Race> = getAllRaces();
			
			for (var i:int = 0; i < allRaces.length; i++)
			{
				if (allRaces[i].name.toLowerCase() == name.toLowerCase())
				{
					return allRaces[i];
				}
			}
			
			return null;
		}
		
		/**
		 * Retrieves the race that matches the given mask.
		 * 
		 * @param	mask The mask of the race that should be returned.
		 * 
		 * @return A <code>Race</code> matching the given mask, or <code>null</code> if there is no match.
		 * 
		 * @see com.wowactions.races.Race
		 */
		public static function getRaceByMask(mask:Number):Race
		{
			var allRaces:Vector.<Race> = getAllRaces();
			
			for (var i:int = 0; i < allRaces.length; i++)
			{
				if (allRaces[i].mask == mask)
				{
					return allRaces[i];
				}
			}
			
			return null;
		}
		
		//========================================================
		// Constructor Function
		//========================================================
		
		/**
		 * RaceData is a static class that does not need to be instantiated.
		 */
		public function RaceData() 
		{
			
		}
		
	}

}
