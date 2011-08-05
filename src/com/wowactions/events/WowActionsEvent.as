package com.wowactions.events 
{
	import flash.events.Event;
	
	/**
	 * The custom event class for the WowActions api.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 9.0
	 * @since 6.17.2011
	 */
	public class WowActionsEvent extends Event 
	{
		public static const REALMS_RETRIEVED:String = "realmsRetrieved";
		public static const GUILD_INFO_RETRIEVED:String = "guildInfoRetrieved";
		public static const DATA_ERROR:String = "dataError";
		
		public var data:*;
		
		public function WowActionsEvent(type:String, data:* = null, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			this.data = data;
			
			super(type, bubbles, cancelable);		
		} 
		
		public override function clone():Event 
		{ 
			return new WowActionsEvent(type, this.data, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("WowActionsEvent", "type", "data", "bubbles", "cancelable", "eventPhase");
		}
		
	}
	
}
