package com.wowactions.realms 
{
	import com.adobe.serialization.json.JSON;
	import com.wowactions.events.WowActionsEvent;
	import com.wowactions.net.ServiceActions;
	import com.wowactions.net.ServicePaths;
	import com.wowactions.net.WowActionService;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	
	/**
	 * Dispatched when realm data has been retrieved from the server.
	 * 
	 * @eventType com.wowactions.events.WowActionsEvent.REALMS_RETRIEVED
	 */
	[Event(name="realmsRetrieved", type="com.wowactions.events.WowActionsEvent")]
	
	/**
	 * This class contains methods that are used to retrieve realm data from the servers.  All data retrieval method calls are asynchronous and therefore should have listeners attached
	 * to the instance to catch the data being returned from the Blizzard servers.  Currently all methods dispatch a <code>WowActionsEvent.REALMS_RETRIEVED</code> event when realm data has been
	 * successfully retrieved from the Blizzard servers.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 9.0
	 * @since 6.17.2011
	 * 
	 * @see com.wowactions.events.WowActionsEvent
	 */
	public class RealmService extends WowActionService 
	{
		
		private var _status:Boolean;
		private var _type:String;
		private var _queue:Boolean;
		private var _level:String;
		
		/**
		 * Creates a new instance of the RealmService class that can be used to easily retrieve realm data from the blizzard servers.
		 * 
		 * @param	region The physical region you would like the data to be retrieved from.  <b>Only the regions located in the Region static class
		 * are actually available from the Blizzard Community Platform API</b>.  If you don't see your region in the static class, it's because it 
		 * is not supported by the API and it will not work with this library.
		 * 
		 * @see com.wowactions.data.Region
		 */
		public function RealmService(region:String) 
		{
			super(region);
		}
		
		//========================================================
		// Get Realms
		//========================================================
		
		/**
		 * Retrieves information for any realm passed to the array.
		 * 
		 * @param	realms An array of realms for which data should be retrieved.  If no array is passed, all realms will be retrieved.
		 * Please note that if any realm in the array does not exist, the WoW API returns all realms.
		 * 
		 * @example
		 * <listing version="3.0">
		 * var realmcomm:RealmService = new RealmService(Region.UNITED_STATES);
		 * realmcomm.addEventListener(WowActionsEvent.REALMS_RETRIEVED, _onRealmsRetrieved);
		 * realmcomm.getRealms([&quot;Blade's Edge&quot;, &quot;Bloodhoof&quot;]);
		 * 
		 * function _onRealmsRetrieved(event:WowActionsEvent):void
		 * {
		 * 		var realmcomm:RealmService = event.target as RealmService;
		 * 		realmcomm.removeEventListener(WowActionsEvent.REALMS_RETRIEVED, _onRealmsRetrieved);
		 * 		
		 * 		var realms:Array = event.data;
		 * 
		 * 		for(var i:int = 0; i &lt; realms.length; i++)
		 * 		{
		 * 			var realm:Realm = realms[i];
		 * 			trace(realm.toString());
		 * 		}
		 * }
		 * </listing>
		 */
		public function getRealms(realms:Array = null):void
		{
			if (!realms) realms = [];
			
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest();
			
			var variables:String = "?realm=" + realms[0];
			for (var i:int = 1; i < realms.length; i++)
			{
				variables += ("&realm=" + realms[i]);
			}
			
			var url:String = ServicePaths.getBasePath(_region) + ServicePaths.REALM + ServiceActions.GET_STATUS + variables;
			request.url = encodeURI(url);
			
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.addEventListener(Event.COMPLETE, _onRealmsRetrieved);
			loader.addEventListener(IOErrorEvent.IO_ERROR, _onIOError);
			loader.load(request);
		}
		
		private function _onRealmsRetrieved(event:Event):void
		{
			var loader:URLLoader = event.target as URLLoader;
			loader.removeEventListener(Event.COMPLETE, _onRealmsRetrieved);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, _onIOError);
			
			var results:Object = JSON.decode(loader.data) as Object;
			var realms:Array = new Array();
			
			for each(var result:Object in results.realms)
				realms.push(_createRealmFromObject(result));
			
			dispatchEvent(new WowActionsEvent(WowActionsEvent.REALMS_RETRIEVED, realms));
		}
		
		//========================================================
		// Get Realm By Status
		//========================================================
		
		/**
		 * Retrieves all realms that match the given status.
		 * 
		 * @param	status Determines which realms are retrieved.  If true, only realms currently online are returned, 
		 * otherwise only realms currently offline will be returned.
		 * 
		 * @example
		 * <listing version="3.0">
		 * var realmcomm:RealmService = new RealmService(Region.UNITED_STATES);
		 * realmcomm.addEventListener(WowActionsEvent.REALMS_RETRIEVED, _onRealmsByStatusRetrieved);
		 * realmcomm.getRealmsByStatus(true);
		 * 
		 * function _onRealmsRetrievedByStatus(event:WowActionsEvent):void
		 * {
		 * 		var realmcomm:RealmService = event.target as RealmService;
		 * 		realmcomm.removeEventListener(WowActionsEvent.REALMS_RETRIEVED, _onRealmsByStatusRetrieved);
		 * 		
		 * 		var realms:Array = event.data;
		 * 
		 * 		for(var i:int = 0; i &lt; realms.length; i++)
		 * 		{
		 * 			var realm:Realm = realms[i];
		 * 			trace(realm.toString());
		 * 		}
		 * }
		 * </listing>
		 */
		public function getRealmsByStatus(status:Boolean):void
		{
			_status = status;
			
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest();
			var headers:Array = new Array();
			
			
			var url:String = ServicePaths.getBasePath(_region) + ServicePaths.REALM + ServiceActions.GET_STATUS;
			request.url = encodeURI(url);
			
			
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.addEventListener(Event.COMPLETE, _onRealmsByStatusRetrieved);
			loader.addEventListener(IOErrorEvent.IO_ERROR, _onIOError);
			loader.load(request);
		}
		
		private function _onRealmsByStatusRetrieved(event:Event):void
		{
			var loader:URLLoader = event.target as URLLoader;
			loader.removeEventListener(Event.COMPLETE, _onRealmsByStatusRetrieved);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, _onIOError);
			
			var realms:Array = new Array();
			
			var results:Object = JSON.decode(loader.data);
			for each(var result:Object in results.realms)
			{
				if (result.status == _status)
					realms.push(_createRealmFromObject(result));
			}
			
			dispatchEvent(new WowActionsEvent(WowActionsEvent.REALMS_RETRIEVED, realms));
		}
		
		//========================================================
		// Get Realms By Type
		//========================================================
		
		/**
		 * Retrieves all realms of the specified type, which can be found in the RealmData static class.
		 * 
		 * @param	type The type of realm that should be retrieved.
		 * 
		 * @see com.wowactions.realms.RealmData
		 * 
		 * @example
		 * <listing version="3.0">
		 * var realmcomm:RealmService = new RealmSerivce(Region.UNITED_STATES);
		 * realmcomm.addEventListener(WowActionsEvent.REALMS_RETRIEVED, _onRealmsByTypeRetrieved);
		 * realmcomm.getRealmsByType(RealmData.TYPE_PVE);
		 * 
		 * function _onRealmsByTypeRetrieved(event:WowActionsEvent):void
		 * {
		 * 		var realmcomm:RealmService = event.target as RealmService;
		 * 		realmcomm.removeEventListener(WowActionsEvent.REALMS_RETRIEVED, _onRealmsByTypeRetrieved);
		 * 		
		 * 		var realms:Array = event.data;
		 * 
		 * 		for(var i:int = 0; i &lt; realms.length; i++)
		 * 		{
		 * 			var realm:Realm = realms[i];
		 * 			trace(realm.toString());
		 * 		}
		 * }
		 * </listing>
		 */
		public function getRealmsByType(type:String):void
		{
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest();
			
			_type = type;
			
			var url:String = ServicePaths.getBasePath(_region) + ServicePaths.REALM + ServiceActions.GET_STATUS;
			request.url = encodeURI(url);
			
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.addEventListener(Event.COMPLETE, _onRealmsByTypeRetrieved);
			loader.addEventListener(IOErrorEvent.IO_ERROR, _onIOError);
			loader.load(request);
		}
		
		private function _onRealmsByTypeRetrieved(event:Event):void
		{
			var loader:URLLoader = event.target as URLLoader;
			loader.removeEventListener(Event.COMPLETE, _onRealmsByTypeRetrieved);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, _onIOError);
			
			var realms:Array = new Array();
			
			var results:Object = JSON.decode(loader.data);
			for each(var result:Object in results.realms)
			{
				if (result.type == _type)
					realms.push(_createRealmFromObject(result));
			}
			
			dispatchEvent(new WowActionsEvent(WowActionsEvent.REALMS_RETRIEVED, realms));
		}
		
		//========================================================
		// Get Realms By Queue
		//========================================================
		
		/**
		 * Retrieves all realms matching the given queue.
		 * 
		 * @param	queue If true, it will return all realms with a queue to play, otherwise it will return
		 * all realms with no queue to play.
		 * 
		 * @example
		 * <listing version="3.0">
		 * var realmcomm:RealmService = new RealmService(Region.UNITED_STATES);
		 * realmcomm.addEventListener(WowActionsEvent.REALMS_RETRIEVED, _onRealmsByQueueRetrieved);
		 * realmcomm.getRealmsByQueue(false);
		 * 
		 * function _onRealmsByQueueRetrieved(event:WowActionsEvent):void
		 * {
		 * 		var realmcomm:RealmService = event.target as RealmService;
		 * 		realmcomm.removeEventListener(WowActionsEvent.REALMS_RETRIEVED, _onRealmsByQueueRetrieved);
		 * 		
		 * 		var realms:Array = event.data;
		 * 
		 * 		for(var i:int = 0; i &lt; realms.length; i++)
		 * 		{
		 * 			var realm:Realm = realms[i];
		 * 			trace(realm.toString());
		 * 		}
		 * }
		 * </listing>
		 */
		public function getRealmsByQueue(queue:Boolean):void
		{
			_queue = queue;
			
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest();
			
			request.url = encodeURI(ServicePaths.getBasePath(_region) + ServicePaths.REALM + ServiceActions.GET_STATUS);
			
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.addEventListener(Event.COMPLETE, _onRealmsByQueueRetrieved);
			loader.addEventListener(IOErrorEvent.IO_ERROR, _onIOError);
			loader.load(request);
		}
		
		private function _onRealmsByQueueRetrieved(event:Event):void
		{
			var loader:URLLoader = event.target as URLLoader;
			loader.removeEventListener(Event.COMPLETE, _onRealmsByQueueRetrieved);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, _onIOError);
			
			var realms:Array = new Array();
			
			var results:Object = JSON.decode(loader.data);
			for each(var result:Object in results.realms)
			{
				if (result.queue == _queue)
					realms.push(_createRealmFromObject(result));
			}
		}
		
		//========================================================
		// Get Realms by Population
		//========================================================
		
		/**
		 * Retrieves all realms with a population level that match the given level.  The appropriate levels are defined 
		 * in the RealmData class.
		 * 
		 * @param	level The population level for the realms that should be returned.
		 * 
		 * @see com.wowactions.realms.RealmData
		 * 
		 * @example
		 * <listing version="3.0">
		 * var realmcomm:RealmService = new RealmService(Region.UNITED_STATES);
		 * realmcomm.addEventListener(WowActionsEvent.REALMS_RETRIEVED, _onRealmsByPopulationRetrieved);
		 * realmcomm.getRealmsByPopulation(RealmData.POPULATION_MEDIUM);
		 * 
		 * function _onRealmsByPopulationRetrieved(event:WowActionsEvent):void
		 * {
		 * 		var realmcomm:RealmService = event.target as RealmService;
		 * 		realmcomm.removeEventListener(WowActionsEvent.REALMS_RETRIEVED, _onRealmsByPopulationRetrieved);
		 * 		
		 * 		var realms:Array = event.data;
		 * 		
		 * 		for(var i:int = 0; i &lt; realms.length; i++)
		 * 		{
		 * 			var realm:Realm = realms[i];
		 * 			trace(realm.toString());
		 * 		}
		 * }
		 * </listing>
		 */
		public function getRealmsByPopulation(level:String):void
		{
			_level = level;
			
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest();
			
			request.url = encodeURI(ServicePaths.getBasePath(_region) + ServicePaths.REALM + ServiceActions.GET_STATUS);
			
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.addEventListener(Event.COMPLETE, _onRealmsByPopulationRetrieved);
			loader.addEventListener(IOErrorEvent.IO_ERROR, _onIOError);
			loader.load(request);
		}
		
		private function _onRealmsByPopulationRetrieved(event:Event):void
		{
			var loader:URLLoader = event.target as URLLoader;
			loader.removeEventListener(Event.COMPLETE, _onRealmsByPopulationRetrieved);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, _onIOError);
			
			var realms:Array = new Array();
			
			var results:Object = JSON.decode(loader.data);
			for each(var result:Object in results.realms)
			{
				if(result.population == _level)
					realms.push(_createRealmFromObject(result));
			}
			
			dispatchEvent(new WowActionsEvent(WowActionsEvent.REALMS_RETRIEVED, realms));
		}
		
		//========================================================
		// Helper Methods
		//========================================================
		
		/**
		 * @private
		 * 
		 * Creates an instance of the Realm class populated by the JSON object recieved from the Blizzard API.
		 * 
		 * @param	realmObject A JSON-formatted realm object retrieved from the Blizzard servers.
		 * 
		 * @return An instance of the Realm class, populated with the data from the given object.
		 */
		protected function _createRealmFromObject(realmObject:Object):Realm
		{
			var realm:Realm = new Realm();
			realm.name = realmObject.name;
			realm.type = realmObject.type;
			realm.status = realmObject.status;
			realm.slug = realmObject.slug;
			realm.population = realmObject.population;
			realm.queue = realmObject.queue;
			
			return realm;
		}
	}

}
