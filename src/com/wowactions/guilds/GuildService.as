package com.wowactions.guilds 
{
	import com.adobe.serialization.json.JSON;
	import com.wowactions.characters.Character;
	import com.wowactions.data.Achievement;
	import com.wowactions.events.WowActionsEvent;
	import com.wowactions.net.ServicePaths;
	import com.wowactions.net.WowActionService;
	import com.wowactions.races.RaceData;
	import com.wowactions.specs.SpecData;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	
	/**
	 * Dispatched when guild information has been retrieved.
	 * 
	 * @eventType com.wowactions.events.WowActionsEvent.GUILD_INFO_RETRIEVED
	 */
	[Event(name="guildInfoRetrieved", type="com.wowactions.events.WowActionsEvent")]
	
	
	/**
	 * Contains methods that allow the retrieval of guild information.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 9.0
	 * @since 8.5.2011
	 */
	public class GuildService extends WowActionService
	{
		//========================================================
		// Public Properties / Constants
		//========================================================
		/**
		 * Optional members parameter for the <code>getGuildInfo</code> method.
		 * 
		 * @see getGuildInfo
		 */
		public static const MEMBERS:String = "members";
		
		/**
		 * Optional achievements parameter for the <code>getGuildInfo</code> method.
		 * 
		 * @see getGuildInfo
		 */
		public static const ACHIEVEMENTS:String = "achievements";
		
		//========================================================
		// Private Properties
		//========================================================
		
		private var _realm:String;
		
		//========================================================
		// Constructor Function
		//========================================================
		
		/**
		 * Creates a new instance of the GuildService class, which is used to get guild information from the Blizzard servers.
		 * 
		 * @param	region The physical region in which the guild resides.
		 * @param	realm The realm in which the guild resides.
		 * 
		 * @see com.wowactions.data.Region
		 */
		public function GuildService(region:String, realm:String) 
		{
			_realm = realm;
			super(region);
		}
		
		/**
		 * Retrieves basic guild information, including name, level, faction and achievement points.  More information can be given if the 
		 * correct optional params are passed.
		 * 
		 * @param	guildName The name of the guild for which information should be retrieved.
		 * @param	...optionalParams Currently accepts two optional parameters: <code>MEMBERS</code> and <code>ACHIEVEMENTS</code>.  If any two of those are passed as 
		 * optionl params, that data will be retrieved with the rest of the guild data.  More parameters will be added if Blizzard adds them.
		 * 
		 * @see MEMBERS
		 * @see ACHIEVEMENTS
		 */
		public function getGuildInfo(guildName:String, ...optionalParams):void
		{
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest();
			
			var variables:String = "?fields=";
			if (optionalParams.indexOf(MEMBERS) != -1)
				variables += MEMBERS;
				
			if (optionalParams.indexOf(ACHIEVEMENTS) != -1)
				variables += ("," + ACHIEVEMENTS);
			
			var url:String = ServicePaths.getBasePath(_region) + ServicePaths.GUILD + _realm + "/" + guildName + variables;
			request.url = encodeURI(url);
			
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.addEventListener(Event.COMPLETE, _onGuildInfoRetrieved);
			loader.addEventListener(IOErrorEvent.IO_ERROR, _onIOError);
			loader.load(request);
		}
		
		/**
		 * @private
		 */
		protected function _onGuildInfoRetrieved(event:Event):void
		{
			var loader:URLLoader = event.target as URLLoader;
			loader.removeEventListener(Event.COMPLETE, _onGuildInfoRetrieved);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, _onIOError);
			
			var guildInfo:Object = JSON.decode(loader.data);
			
			var guild:Guild = new Guild();
			guild.name = guildInfo.name;
			guild.level = guildInfo.level;
			guild.faction = (guildInfo.side == 0) ? "Alliance" : "Horde";
			guild.achievementPoints = guildInfo.achievementPoints;
			
			
			if (guildInfo.hasOwnProperty(MEMBERS))
			{
				var roster:Vector.<Character> = new Vector.<Character>();
				var members:Array = guildInfo.members;
				for (var i:int = 0; i < members.length; i++)
				{
					var memberInfo:Object = members[i].character;
					var character:Character = new Character();
					
					character.name = memberInfo.name;
					character.realm = memberInfo.realm;
					character.mainSpec = SpecData.getSpecById(memberInfo["class"]); // class is a reservered word, so it's accessed with array notation to avoid compilation errors.
					character.race = RaceData.getRaceById(memberInfo.race);
					character.gender = memberInfo.gender;
					character.level = memberInfo.level;
					character.achievementPoints = memberInfo.achievementPoints;
					character.thumbnail = memberInfo.thumbnail;
					character.guildRank = members[i].rank;
					roster.push(character);
				}
				
				guild.members = roster;
			}
			
			if (guildInfo.hasOwnProperty(ACHIEVEMENTS))
			{
				var achievements:Vector.<Achievement> = new Vector.<Achievement>();
				var achievementInfo:Object = guildInfo.achievements;
				
				var completedAchievements:Array = achievementInfo.achievementsCompleted;
				var achievementsCompletedTimestamp:Array = achievementInfo.achievementsCompletedTimestamp;
				var criteria:Array = achievementInfo.criteria;
				var criteriaQuantity:Array = achievementInfo.criteriaQuantity;
				var criteriaCompleteTimestamp:Array = achievementInfo.criteriaTimestamp;
				var criteriaStartTimestamp:Array = achievementInfo.criteriaCreated;
				var achievement:Achievement;
				
				// Completed achievements
				for (var j:int = 0; j < completedAchievements.length; j++)
				{
					achievement = new Achievement();
					achievement.achievementId = completedAchievements[j];
					achievement.completeTimestamp = achievementsCompletedTimestamp[j];
					achievement.completed = true;
					achievements.push(achievement);
				}
				
				// Incomplete achievements
				for (var k:int = 0; k < criteria.length; k++)
				{
					achievement = new Achievement();
					achievement.achievementId = criteria[k];
					achievement.startTimestamp = criteriaStartTimestamp[k];
					achievement.criteriaQuantity = criteriaQuantity[k];
					achievement.completed = false;
					achievements.push(achievement);
				}
				
				guild.achievements = achievements;
			}
			
			
			dispatchEvent(new WowActionsEvent(WowActionsEvent.GUILD_INFO_RETRIEVED, guild));
		}
		
	}

}
