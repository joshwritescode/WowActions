package com.wowactions.net 
{
	/**
	 * The paths to the different parts of the api.  Currently only supports Realm, but more paths will be added for characters, guilds, etc.
	 * 
	 * @author Josh Brown
	 * @link www.shift-f12.com
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 9.0
	 * @since 6.17.2011
	 */
	public class ServicePaths 
	{
		public static const REALM:String = "realm/";
		
		public static function getBasePath(region:String):String
		{
			return "http://" + region + ".battle.net/api/wow/";
		}
		
		public function ServicePaths() 
		{
			
		}
		
	}

}