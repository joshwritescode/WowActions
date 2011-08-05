package com.wowactions.errors 
{
	/**
	 * ...
	 * @author Josh Brown
	 */
	public class WowActionsError 
	{
		//========================================================
		// Private Properties
		//========================================================
		
		private var _reason:String;
		
		
		/**
		 * Creates a new instance of the class that includes information regarding a failed request.
		 * 
		 * @param	reason
		 */
		public function WowActionsError(reason:String) 
		{
			_reason = reason;
		}
		
	}

}
