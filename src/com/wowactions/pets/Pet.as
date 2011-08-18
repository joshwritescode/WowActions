package com.wowactions.pets 
{
	/**
	 * Contains information related to a combat pet.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com/wowactions
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 10.0
	 * @since 8.17.2011
	 */
	public class Pet 
	{
		//========================================================
		// Private Properties
		//========================================================
		
		private var _name:String;
		private var _creature:Number;
		private var _selected:Boolean;
		private var _slot:Number;
		
		//========================================================
		// Getters / Setters
		//========================================================
		
		/**
		 * The name of the pet.
		 */
		public function get name():String { return _name; }
		public function set name(value:String):void
		{
			_name = value;
		}
		
		/**
		 * The unique identifier of the pet.
		 */
		public function get creature():Number { return _creature; }
		public function set creature(value:Number):void
		{
			_creature = value;
		}
		
		/**
		 * Whether or not this is the currently selected pet.
		 */
		public function get selected():Boolean { return _selected; }
		public function set selected(value:Boolean):void
		{
			_selected = value;
		}
		
		/**
		 * The current slot of the pet.
		 */
		public function get slot():Number { return _slot; }
		public function set slot(value:Number):void
		{
			_slot = value;
		}
		
		//========================================================
		// Constructor Function
		//========================================================
		
		/**
		 * Creates a new instance of the Pet class.
		 * 
		 * @param	name The name of the pet
		 * @param	creature The unique identifier of the pet.
		 * @param	selected Whether or not the pet is currently being used.
		 * @param	slot The current slot of the pet.
		 */
		public function Pet(name:String = "", creature:Number = -1, selected:Boolean = false, slot:Number = -1)
		{
			this.name = name;
			this.creature = creature;
			this.selected = selected;
			this.slot = slot;
		}
		
		/**
		 * Returns information about the pet, including its name and whether it is selected.
		 * 
		 * @return A string representation of the pet class.
		 */
		public function toString():String
		{
			return "Pet " + name + ": selected - " + selected.toString();
		}
	}

}
