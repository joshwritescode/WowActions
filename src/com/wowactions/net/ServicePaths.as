package com.wowactions.net 
{
	/**
	 * The paths to the different parts of the api.  Currently only supports Realm, but more paths will be added for characters, guilds, etc.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com/wowactions
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 10.0
	 * @since 6.17.2011
	 */
	public class ServicePaths 
	{
		public static const BASE_QUERY_URL:String = "/api/wow/";
		public static const REALM:String = "realm/";
		public static const GUILD:String = "guild/";
		public static const CHARACTER:String = "character/";
		
		public static function getBasePath(region:String):String
		{
			return "http://" + region + BASE_QUERY_URL;
		}
		
		public function ServicePaths() 
		{
			
		}
		
	}

}
