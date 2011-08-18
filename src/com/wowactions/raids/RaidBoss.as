package com.wowactions.raids 
{
	/**
	 * Contains information related to Raid Bosses.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com/wowactions
	 * 
	 * @langversion 3.0
	 * @flashversion Flash 10.0
	 * @since 8.17.2011
	 */
	public class RaidBoss 
	{
		//========================================================
		// Private Properties
		//========================================================
		
		private var _id:Number;
		private var _name:String;
		private var _normalKills:Number;
		private var _heroicKills:Number;
		
		//========================================================
		// Getters / Setters
		//========================================================
		
		public function get id():Number { return _id; }
		public function set id(value:Number):void
		{
			_id = value;
		}
		
		public function get name():String { return  _name; }
		public function set name(value:String):void
		{
			_name = value;
		}
		
		public function get normalKills():Number { return _normalKills; }
		public function set normalKills(value:Number):void
		{
			_normalKills = value;
		}
		
		public function get heroicKills():Number { return _heroicKills; }
		public function set heroicKills(value:Number):void
		{
			_heroicKills = value;
		}
		
		public function RaidBoss(id:Number = -1, name:String = "", normalKills:Number = 0, heroicKills:Number = 0) 
		{
			this.id = id;
			this.name = name;
			this.normalKills = normalKills;
			this.heroicKills = heroicKills;
		}
		
		public function toString():String
		{
			return "Boss Name: " + name + " normal kills: " + normalKills.toString() + " heroic kills: " + heroicKills.toString();
		}
	}
}
