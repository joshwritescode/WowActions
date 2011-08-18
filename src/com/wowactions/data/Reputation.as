package com.wowactions.data 
{
	/**
	 * Contains information related to the reputation with a faction.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com/wowactions
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 10.0
	 * @since 8.17.2011
	 */
	public class Reputation 
	{
		//========================================================
		// Public Properties
		//========================================================
		
		
		//========================================================
		// Private Properties
		//========================================================
		
		private var _id:Number;
		private var _name:String;
		private var _standing:Number;
		private var _progress:Number;
		private var _max:Number;
		
		//========================================================
		// Getters / Setters
		//========================================================
		
		/**
		 * The unique identifier of the faction.
		 */
		public function get id():Number { return _id; }
		public function set id(value:Number):void
		{
			_id = value;
		}
		
		/**
		 * The in-game title of the faction.
		 */
		public function get name():String { return _name; }
		public function set name(value:String):void
		{
			_name = value;
		}
		
		/**
		 * The current numerical standing with the faction.
		 */
		public function get standing():Number { return _standing; }
		public function set standing(value:Number):void
		{
			_standing = value;
		}
		
		/**
		 * The amount of progress made within the current standing.
		 */
		public function get progress():Number { return _progress; }
		public function set progress(value:Number):void
		{
			_progress = value;
		}
		
		/**
		 * The maximum progress that can be obtained in the current standing.
		 */
		public function get max():Number { return _max; }
		public function set max(value:Number):void
		{
			_max = value;
		}
		
		/**
		 * The percentage of the amount of progress made within the current standing.
		 */
		public function get percentComplete():String { return Math.round(progress / max).toString() + "%"; }
		
		/**
		 * All levels of standings that can be achieved with a faction.
		 */
		public function get standingValues():Vector.<String>
		{
			var values:Vector.<String> = new Vector.<String>();
			values.push("Unknown");
			values.push("Hated");
			values.push("Hostile");
			values.push("Unfriendly");
			values.push("Neutral");
			values.push("Friendly");
			values.push("Honored");
			values.push("Revered");
			values.push("Exalted");
			
			return values;
		}
		
		//========================================================
		// Constructor Function
		//========================================================
		
		/**
		 * Creates a new instance of the Reputation class.
		 * 
		 * @param	id The unique identifier of the faction.
		 * @param	name The in-game title of the faction.
		 * @param	standing The current numerical standing with the faction.
		 * @param	progress The amount of progress made within the current standing.
		 * @param	max The maximum progress that can be obtained in the current standing.
		 * 
		 * @see id
		 * @see name
		 * @see standing
		 * @see progress
		 * @see max
		 */
		public function Reputation(id:Number = -1, name:String = "", standing:Number = -1, progress:Number = -1, max:Number = -1) 
		{
			this.id = id;
			this.name = name;
			this.standing = standing;
			this.progress = progress;
			this.max = max;
		}
		
		//========================================================
		// Public Methods
		//========================================================
		
		/**
		 * Gets the name of the standing from the standing id.
		 * 
		 * @param	id The standing id, which can be a number from 0-8.
		 * 
		 * @return The title of the standing, in string form.
		 */
		public function getStandingNameById(id:Number):String
		{
			return standingValues[id];
		}
		
		/**
		 * Gets the unique identifier of a standing from the given name.
		 * 
		 * @param	name The title of the standing from which the id should be retrieved.
		 * 
		 * @return The unique identifier for the standing.
		 */
		public function getStandingIdByName(name:String):Number
		{
			for (var i:int = 0; i < standingValues.length; i++)
			{
				if (standingValues[i].toLowerCase() == name.toLowerCase())
					return i;
			}
			
			return -1;
		}
		
		/**
		 * Retrieves information related to the instance of the Reputation class, including name, the standing name, the progress 
		 * within the current standing and maximum amount of progress of the current standing.
		 * 
		 * @return A string representation of the instance of the Reputation class.
		 */
		public function toString():String
		{
			return name + ": " + getStandingNameById(standing) + "  (" + progress + "/" + max + ")";
		}
	}
}
