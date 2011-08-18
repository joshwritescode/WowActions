package com.wowactions.realms 
{
	/**
	 * This class is used to store all the information about a specific realm.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com/wowactions
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 10.0
	 * @since 6.17.2011
	 */
	public class Realm 
	{
		//========================================================
		// Private Properties
		//========================================================
		
		private var _type:String;
		private var _queue:Boolean;
		private var _status:Boolean;
		private var _population:String;
		private var _name:String;
		private var _slug:String;
		
		//========================================================
		// Getters / Setters
		//========================================================
		
		/**
		 * The fully formatted name of the realm, i.e. &quot;Blade's Edge&quot;.
		 */
		public function get name():String { return _name; }
		public function set name(value:String):void
		{
			_name = value;
		}
		
		/**
		 * The play type of the realm.  Will be one of &quot;pve&quot;, &quot;pvp&quot;, &quot;rp&quot; or &quot;rppvp&quot;.
		 */
		public function get type():String { return _type; }
		public function set type(value:String):void
		{
			_type = value;
		}
		
		/**
		 * Whether or not the realm is currently online.
		 */
		public function get status():Boolean { return _status; }
		public function set status(value:Boolean):void
		{
			_status = value;
		}
		
		/**
		 * The realm's population, one of &quot;low&quot;, &quot;medium&quot;, &quot;high&quot;, or will be &quot;n/a&quot; if the realm is down.
		 */
		public function get population():String { return _population; }
		public function set population(value:String):void
		{
			_population = value;
		}
		
		/**
		 * The &quot;data friendly&quot; version of the anem, with punctuation removed and spaces converted to dashes, i.e. &quot;blades-edge&quot;
		 */
		public function get slug():String { return _slug; }
		public function set slug(value:String):void
		{
			_slug = value;
		}
		
		/**
		 * Whether or not the realm has a queue to play.
		 */
		public function get queue():Boolean { return _queue; }
		public function set queue(value:Boolean):void
		{
			_queue = value;
		}
		
		/**
		 * The information for each server used in World of Warcraft.
		 */
		public function Realm() 
		{
			
		}
		
		public function toString():String
		{
			return "Realm: " + name + ", type: " + type + ", status: " + status.toString() + ", population: " + population + ", slug: " + slug + ", queue: " + _queue.toString();
		}
		
	}

}
