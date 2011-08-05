package com.wowactions.characters.classes 
{
	/**
	 * A static class containing properties and methods related to character classes within the game.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 9.0
	 * @since 8.5.2011
	 */
	public class CharacterClassData 
	{
		//========================================================
		// Public Properties
		//========================================================
		
		public static const HUNTER:String = "Hunter";
		public static const ROGUE:String = "Rogue";
		public static const WARRIOR:String = "Warrior";
		public static const PALADIN:String = "Paladin";
		public static const SHAMAN:String = "Shaman";
		public static const MAGE:String = "Mage";
		public static const PRIEST:String = "Priest";
		public static const DEATH_KNIGHT:String = "Death Knight";
		public static const DRUID:String = "Druid";
		public static const WARLOCK:String = "Warlock";
		
		//========================================================
		// Public Static Methods
		//========================================================
		
		/**
		 * Retrieves all specs from the game.
		 * 
		 * @return A vector array of Spec's.
		 */
		public static function getAllClasses():Vector.<CharacterClass>
		{
			var classes:Vector.<CharacterClass> = new Vector.<CharacterClass>();
			
			classes.push(new CharacterClass(3, 4, "focus", "Hunter"));
			classes.push(new CharacterClass(4, 8, "energy", "Rogue"));
			classes.push(new CharacterClass(1, 1, "rage", "Warrior"));
			classes.push(new CharacterClass(2, 2, "mana", "Paladin"));
			classes.push(new CharacterClass(7, 64, "mana", "Shaman"));
			classes.push(new CharacterClass(8, 128, "mana", "Mage"));
			classes.push(new CharacterClass(5, 16, "mana", "Priest"));
			classes.push(new CharacterClass(6, 32, "runic-power", "Death Knight"));
			classes.push(new CharacterClass(11, 1024, "mana", "Druid"));
			classes.push(new CharacterClass(9, 256, "mana", "Warlock"));
			
			return classes;
		}
		
		/**
		 * Returns the spec matching the given id.
		 * 
		 * @param	id The id of the CharacterClassData that should be returned.
		 * 
		 * @return The Spec matching the given id, or <code>null</code> if no Spec with a matching id is found.
		 */
		public static function getClassById(id:Number):CharacterClass
		{
			var classes:Vector.<CharacterClass> = getAllClasses();
			
			for (var i:int = 0; i < classes.length; i++)
			{
				if (classes[i].id == id)
				{
					return classes[i];
				}
			}
			
			return null;
		}
		
		/**
		 * Returns a spec matching the given name.
		 * 
		 * @param	name The name of the Spec that should be returned.
		 * 
		 * @return The Spec matching the given name, or <code>null</code> if no Spec with a matching id is found.
		 */
		public static function getClassByName(name:String):CharacterClass
		{
			var classes:Vector.<CharacterClass> = getAllClasses();
			
			for (var i:int = 0; i < classes.length; i++)
			{
				if (classes[i].name.toLowerCase() == name.toLowerCase())
				{
					return classes[i];
				}
			}
			
			return null;
		}
		
		/**
		 * Returns a spec matching the given mask.
		 * 
		 * @param	mask The mask of the Spec that should be returned.
		 * 
		 * @return The Spec matching the given mask, or <code>null</code> if no Spec with a matching mask is found.
		 */
		public function getClassByMask(mask:Number):CharacterClass
		{
			var classes:Vector.<CharacterClass> = getAllClasses();
			
			for (var i:int = 0; i < classes.length; i++)
			{
				if (classes[i].mask == mask)
				{
					return classes[i];
				}
			}
			
			return null;
		}
		
		//========================================================
		// Constructor Function
		//========================================================
		
		/**
		 * SpecData is a static class that does not need to be instantiated.
		 */
		public function CharacterClassData() 
		{
			
		}
		
	}

}
