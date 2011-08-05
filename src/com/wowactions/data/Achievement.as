package com.wowactions.data 
{
	/**
	 * Contains information about a specific achievement.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 9.0
	 * @since 8.5.2011
	 */
	public class Achievement 
	{
		//========================================================
		// Private Properties
		//========================================================
		
		private var _achievementId:Number;
		private var _completed:Boolean;
		private var _criteriaId:Number;
		private var _criteriaQuantity:Number;
		private var _completeTimestamp:Number;
		private var _startTimestamp:Number;
		
		//========================================================
		// Getters / Setters
		//========================================================
		
		public function get achievementId():Number { return _achievementId; }
		public function set achievementId(value:Number):void
		{
			_achievementId = value;
		}
		
		public function get completed():Boolean { return _completed; }
		public function set completed(value:Boolean):void
		{
			_completed = value;
		}
		
		public function get criteriaId():Number { return _criteriaId; }
		public function set criteriaId(value:Number):void
		{
			_criteriaId = value;
		}
		
		public function get criteriaQuantity():Number { return _criteriaQuantity; }
		public function set criteriaQuantity(value:Number):void
		{
			_criteriaQuantity = value;
		}
		
		public function get completeTimestamp():Number { return _completeTimestamp; }
		public function set completeTimestamp(value:Number):void
		{
			_completeTimestamp = value;
		}
		
		public function get startTimestamp():Number { return _startTimestamp; }
		public function set startTimestamp(value:Number):void
		{
			_startTimestamp = value;
		}
		
		//========================================================
		// Constructor Function
		//========================================================
		
		/**
		 * Creates a new instance of the Achievement class.
		 */
		public function Achievement() 
		{
			
		}
		
		//========================================================
		// Public Methods
		//========================================================
		
		public function toString():String
		{
			return "Achievement Id: " + _achievementId.toString() + ", Completed: " + (new Date(_completeTimestamp)).toString();
		}
		
	}

}
