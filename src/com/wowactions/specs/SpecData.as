package com.wowactions.specs 
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
	public class SpecData 
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
		public static function getAllSpecs():Vector.<Spec>
		{
			var specs:Vector.<Spec> = new Vector.<Spec>();
			
			specs.push(new Spec(3, 4, "focus", "Hunter"));
			specs.push(new Spec(4, 8, "energy", "Rogue"));
			specs.push(new Spec(1, 1, "rage", "Warrior"));
			specs.push(new Spec(2, 2, "mana", "Paladin"));
			specs.push(new Spec(7, 64, "mana", "Shaman"));
			specs.push(new Spec(8, 128, "mana", "Mage"));
			specs.push(new Spec(5, 16, "mana", "Priest"));
			specs.push(new Spec(6, 32, "runic-power", "Death Knight"));
			specs.push(new Spec(11, 1024, "mana", "Druid"));
			specs.push(new Spec(9, 256, "mana", "Warlock"));
			
			return specs;
		}
		
		/**
		 * Returns the spec matching the given id.
		 * 
		 * @param	id The id of the Spec that should be returned.
		 * 
		 * @return The Spec matching the given id, or <code>null</code> if no Spec with a matching id is found.
		 */
		public static function getSpecById(id:Number):Spec
		{
			var allSpecs:Vector.<Spec> = getAllSpecs();
			
			for (var i:int = 0; i < allSpecs.length; i++)
			{
				if (allSpecs[i].id == id)
				{
					return allSpecs[i];
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
		public static function getSpecByName(name:String):Spec
		{
			var allSpecs:Vector.<Spec> = getAllSpecs();
			
			for (var i:int = 0; i < allSpecs.length; i++)
			{
				if (allSpecs[i].name.toLowerCase() == name.toLowerCase())
				{
					return allSpecs[i];
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
		public function getSpecByMask(mask:Number):Spec
		{
			var allSpecs:Vector.<Spec> = getAllSpecs();
			
			for (var i:int = 0; i < allSpecs.length; i++)
			{
				if (allSpecs[i].mask == mask)
				{
					return allSpecs[i];
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
		public function SpecData() 
		{
			
		}
		
	}

}
