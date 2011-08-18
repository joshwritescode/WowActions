package com.wowactions.net 
{
	import com.wowactions.events.WowActionsEvent;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	
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
	 * @see http://www.shift-f12.com/wowactions
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 10.0
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
			var loader:URLLoader = event.target as URLLoader;
			
			trace("Service Unavailable!  Error details: " + loader.data);
			dispatchEvent(new WowActionsEvent(WowActionsEvent.DATA_ERROR));
		}
	}
}
