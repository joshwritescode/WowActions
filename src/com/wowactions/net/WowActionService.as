package com.wowactions.net 
{
	import com.wowactions.events.WowActionsEvent;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	
	/**
	 * Dispatched when there is an error retrieving data from the Blizzard servers.
	 * 
	 * @eventType com.wowactions.events.WowActionsEvent.DATA_ERROR
	 */
	[Event(name="dataError", type="com.wowactions.events.WowActionsEvent")]
	
	/**
	 * The base class for any service to be used by the WowActions api.
	 * 
	 * @author Josh Brown
	 * @link www.shift-f12.com
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 9.0
	 * @since 6.17.2011
	 */
	public class WowActionService extends EventDispatcher 
	{
		protected var _region:String;
		
		public function WowActionService(region:String) 
		{
			_region = region;
		}
		
		protected function _onIOError(event:IOErrorEvent):void
		{
			trace("Service Unavailable!  Error details: " + event.toString);
			dispatchEvent(new WowActionsEvent(WowActionsEvent.DATA_ERROR));
		}
	}

}