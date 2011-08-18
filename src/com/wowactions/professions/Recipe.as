package com.wowactions.professions 
{
	/**
	 * Contains information related to a single recipe.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com/wowactions
	 * 
	 * @langversion 3.0
	 * @playerversion 10.0
	 * @since 8.17.2011
	 */
	public class Recipe 
	{
		//========================================================
		// Private Properties
		//========================================================
		
		private var _id:Number;
		
		//========================================================
		// Getters / Setters
		//========================================================
		
		/**
		 * The unique identifier for this recipe.
		 */
		public function get id():Number { return _id; }
		public function set id(value:Number):void
		{
			_id = value;
		}
		
		/**
		 * Creates a new instance of the Recipe class.
		 * 
		 * @param	id The unique identifier for this recipe.
		 */
		public function Recipe(id:Number = -1)
		{
			this.id = id;
		}
		
		/**
		 * Returns Recipe information in string form, including the id.
		 * 
		 * @return A string representation of the Recipe instance.
		 */
		public function toString():String
		{
			return "Recipe: " + id.toString();
		}
		
	}

}
