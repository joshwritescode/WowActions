package com.wowactions.mounts 
{
	/**
	 * Contains information related to a riding mount.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com/wowactions
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 10.0
	 * @since 8.17.2011
	 */
	public class Mount 
	{
		//========================================================
		// Private Properties
		//========================================================
		
		private var _id:Number;
		
		//========================================================
		// Getters / Setters
		//========================================================
		
		/**
		 * The unique identifier of the mount.
		 */
		public function get id():Number { return _id; }
		public function set id(value:Number):void
		{
			_id = value;
		}
		
		/**
		 * Creates a new instance of the Mount class.
		 * 
		 * @param	id (optional) The unique identifier of the mount
		 */
		public function Mount(id:Number = -1)
		{
			this.id = id;
		}
		
		/**
		 * Returns information about the mount, including the id.
		 * 
		 * @return A string representation of an instance of the Mount class.
		 */
		public function toString():String
		{
			return "Mount: " + id.toString();
		}
		
	}

}
