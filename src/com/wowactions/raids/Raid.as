package com.wowactions.raids 
{
	/**
	 * Contains information related to Raids.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com/wowactions
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 10.0
	 * @since 8.17.2011
	 */
	public class Raid 
	{
		//========================================================
		// Private Properties
		//========================================================
		
		private var _id:Number;
		private var _name:String;
		private var _normal:Number;
		private var _heroic:Number;
		private var _bosses:Vector.<RaidBoss>;
		
		//========================================================
		// Getters / Setters
		//========================================================
		
		/**
		 * The unique identifier of the raid.
		 */
		public function get id():Number { return _id; }
		public function set id(value:Number):void
		{
			_id = value;
		}
		
		/**
		 * The title of the raid.
		 */
		public function get name():String { return _name; }
		public function set name(value:String):void
		{
			_name = value;
		}
		
		/**
		 * The number of times the raid has been completed on normal difficulty.
		 */
		public function get normal():Number { return _normal; }
		public function set normal(value:Number):void
		{
			_normal = value;
		}
		
		/**
		 * The number of times the raid has been completed on heroic difficulty.
		 */
		public function get heroic():Number { return _heroic; }
		public function set heroic(value:Number):void
		{
			_heroic = value;
		}
		
		/**
		 * The Raid Bosses associated with this raid.
		 */
		public function get bosses():Vector.<RaidBoss> { return _bosses; }
		public function set bosses(value:Vector.<RaidBoss>):void
		{
			_bosses = value;
		}
		
		/**
		 * Creates a new instance of the raid class.
		 * 
		 * @param	id The unique identifier of the raid.
		 * @param	name The title of the raid.
		 * @param	normal The number of times the raid has been completed on normal difficulty.
		 * @param	heroic The number of times the raid has been completed on heroic difficulty.
		 * @param	bosses The Raid Bosses associated with this raid.
		 */
		public function Raid(id:Number = -1, name:String = "", normal:Number = 0, heroic:Number = 0, bosses:Vector.<RaidBoss> = null) 
		{
			this.id = id;
			this.name = name;
			this.normal = normal;
			this.heroic = heroic;
		}
		
		/**
		 * Returns Raid information, including the name, normal count, heroic count, and number of bosses in the raid.
		 * 
		 * @return A string representation of the Raid class.
		 */
		public function toString():String
		{
			return "Raid: " + name + " normal: " + normal + " herioc: " + heroic + " boss count: " + bosses.length.toString();
		}
	}
}
