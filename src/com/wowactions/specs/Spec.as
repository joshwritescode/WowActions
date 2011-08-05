package com.wowactions.specs 
{
	/**
	 * Contains properties related to character class specs.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 9.0
	 * @since 8.5.2011
	 */
	public class Spec 
	{
		//========================================================
		// Private Properties
		//========================================================
		
		private var _id:Number;
		private var _mask:Number;
		private var _powerType:String;
		private var _name:String;
		
		//========================================================
		// Getters / Setters
		//========================================================
		
		/**
		 * The unique identifier of the spec.
		 */
		public function get id():Number { return _id; }
		public function set id(value:Number):void
		{
			_id = value;
		}
		
		/**
		 * The mask of the spec.
		 */
		public function get mask():Number { return _mask; }
		public function set mask(value:Number):void
		{
			_mask = value;
		}
		
		/**
		 * The power specialization of the spec.
		 */
		public function get powerType():String { return _powerType; }
		public function set powerType(value:String):void
		{
			_powerType = value;
		}
		
		/**
		 * The name of the spec.
		 */
		public function get name():String { return _name; }
		public function set name(value:String):void
		{
			_name = value;
		}
		
		//========================================================
		// Constructor Function
		//========================================================
		
		/**
		 * Creates a new instance of the Spec class.
		 * 
		 * @param	id (optional) The unique identifier of the spec.
		 * @param	mask (optional) The mask of the spec.
		 * @param	powerType (optional) The power specialization of the spec.
		 * @param	name (optional) The name of the spec.
		 */
		public function Spec(id:Number = -1, mask:Number = -1, powerType:String = "", name:String = "")
		{
			_id = id;
			_mask = mask;
			_powerType = powerType;
			_name = name;
		}
		
		//========================================================
		// Public Methods
		//========================================================
		
		/**
		 * A string representation of the spec.
		 * 
		 * @return A string containing the following attributes: id, mask, powerType and name.
		 */
		public function toString():String
		{
			return "Spec: " + id.toString() + " mask: " + mask.toString() + " powerType: " + powerType + " name: " + name;
		}
	}

}
