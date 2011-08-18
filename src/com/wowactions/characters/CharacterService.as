package com.wowactions.characters 
{
	import com.adobe.serialization.json.JSON;
	import com.wowactions.characters.CharacterClassData;
	import com.wowactions.companions.Companion;
	import com.wowactions.data.Reputation;
	import com.wowactions.data.Title;
	import com.wowactions.events.WowActionsEvent;
	import com.wowactions.guilds.Guild;
	import com.wowactions.mounts.Mount;
	import com.wowactions.net.ServicePaths;
	import com.wowactions.net.WowActionService;
	import com.wowactions.pets.Pet;
	import com.wowactions.professions.Profession;
	import com.wowactions.professions.Recipe;
	import com.wowactions.pvp.ArenaTeam;
	import com.wowactions.pvp.Battleground;
	import com.wowactions.races.RaceData;
	import com.wowactions.raids.Raid;
	import com.wowactions.raids.RaidBoss;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	
	/**
	 * The character service class retireves character data from the blizzard api.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com/wowactions
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 10.0
	 * @since 8.17.2011
	 */
	public class CharacterService extends WowActionService
	{
		//========================================================
		// Private Properties
		//========================================================
		
		private var _realm:String;
		
		//========================================================
		// Constructor Function
		//========================================================
		
		/**
		 * Creates a new instance of the CharacterService class.
		 * 
		 * @param	region The region of servers from which the data should be retrieved.
		 * @param	realm The server from which the data should be retrieved.
		 */
		public function CharacterService(region:String, realm:String) 
		{
			_realm = realm;
			super(region);
		}
		
		/**
		 * Retrieves data about a specific character.
		 * 
		 * @param	name The name of the character for which data should be retrieved.
		 * @param	optionalParams The optional data that should be retrieved.
		 */
		public function getCharacterData(name:String, optionalParams:Array = null):void
		{
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest();
			
			
			var variables:String = "";
			if (optionalParams)
			{
				variables += "?fields=";
				for (var i:int = 0; i < optionalParams.length; i++)
				{
					if (i > 0) variables += ",";
					variables += optionalParams[i];
				}
			}
			
			var url:String = ServicePaths.getBasePath(_region) + ServicePaths.CHARACTER + _realm + "/" + name + variables;
			request.url = encodeURI(url);
			
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.addEventListener(Event.COMPLETE, _onCharacterDataRetrieved);
			loader.addEventListener(IOErrorEvent.IO_ERROR, _onIOError);
			loader.load(request);
		}
		
		/**
		 * @private
		 */
		protected function _onCharacterDataRetrieved(event:Event):void
		{
			var loader:URLLoader = event.target as URLLoader;
			loader.removeEventListener(Event.COMPLETE, _onCharacterDataRetrieved);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, _onIOError);
			
			//trace(loader.data);
			
			var info:Object = JSON.decode(loader.data);
			var character:Character = new Character();
			character.name = info.name;
			character.level = info.level;
			character.gender = (info.gender == 0) ? "Male" : "Female";
			character.race = RaceData.getRaceById(info.race);
			character.characterClass = CharacterClassData.getClassById(info["class"]);
			character.thumbnail = info.thumbnail;
			character.realm = info.realm;
			character.achievementPoints = info.achievementPoints;
			
			if (info.hasOwnProperty("guild"))
				character.guild = _parseGuildInfo(info.guild);
			
			if (info.hasOwnProperty("stats"))
				character.stats = _parseStats(info.stats);
			
			if (info.hasOwnProperty("reputation"))
				character.reputations = _parseReputations(info.reputation);
			
			if (info.hasOwnProperty("titles"))
				character.titles = _parseTitles(info.titles);
			
			if (info.hasOwnProperty("companions"))
				character.companions = _parseCompanions(info.companions);
			
			if (info.hasOwnProperty("pets"))
				character.pets = _parsePets(info.pets);
			
			if (info.hasOwnProperty("mounts"))
				character.mounts = _parseMounts(info.mounts);
			
			if (info.hasOwnProperty("appearance"))
				character.appearance = _parseAppearance(info.appearance);
			
			if (info.hasOwnProperty("progression"))
				character.progression = _parseProgression(info.progression.raids);
			
			if (info.hasOwnProperty("pvp"))
			{
				var pvpInfo:Object = _parsePVP(info.pvp);
				character.totalHonorableKills = pvpInfo.totalHonorableKills;
				character.personalRbgRating = pvpInfo.personRbgRating;
				character.battlegrounds = pvpInfo.battlegrounds;
				character.arenaTeams = pvpInfo.arenaTeams;
			}
			
			if (info.hasOwnProperty("professions"))
				character.professions = _parseProfessions(info.professions);
			
			dispatchEvent(new WowActionsEvent(WowActionsEvent.CHARACTER_INFO_RETRIEVED, character));
		}
		
		private function _parseGuildInfo(info:Object):Guild
		{
			var guild:Guild = new Guild();
			guild.name = info.name;
			guild.level = info.level;
			guild.realm = info.realm;
			guild.achievementPoints = info.achievementPoints;
			guild.numMembers = info.members;
			
			return guild;
		}
		
		private function _parseStats(info:Object):Stats
		{
			var stats:Stats = new Stats();
			stats.health = info.health;
			stats.powerType = info.powerType;
			stats.power = info.power;
			stats.strength = info.str;
			stats.agility = info.agi;
			stats.stamina = info.sta;
			stats.intellect = info.int;
			stats.spirit = info.spr;
			stats.attackPower = info.attackPower;
			stats.rangedAttackPower = info.rangedAttackPower;
			stats.mastery = info.mastery;
			stats.masteryRating = info.masteryRating;
			stats.crit = info.crit;
			stats.critRating = info.critRating;
			stats.hitRating = info.hitRating;
			stats.hasteRating = info.hasteRating;
			stats.expertiseRating = info.expertiseRating;
			stats.spellPower = info.spellPower;
			stats.spellPenetration = info.spellPen;
			stats.spellCrit = info.spellCrit;
			stats.spellCritRating = info.spellCritRating;
			stats.mana5 = info.mana5;
			stats.mana5Combat = info.mana5Combat;
			stats.armor = info.armor;
			stats.dodge = info.dodge;
			stats.dodgeRating = info.dodgeRating;
			stats.parry = info.parry;
			stats.parryRating = info.parryRating;
			stats.block = info.block;
			stats.blockRating = info.blockRating;
			stats.resilience = info.resilience;
			stats.mainHandDmgMin = info.mainHandDmgMin;
			stats.mainHandDmgMax = info.mainHandDmgMax;
			stats.mainHandSpeed = info.mainHandSpeed;
			stats.mainHandExpertise = info.mainHandExpertise;
			stats.offHandDmgMin = info.offHandDmgMin;
			stats.offHandDmgMax = info.offHandDmgMax;
			stats.offHandSpeed = info.offHandSpeed;
			stats.offHandDps = info.offHandDps;
			stats.offHandExpertise = info.offHandExpertise;
			stats.rangedDmgMin = info.rangedDmgMin;
			stats.rangedDmgMax = info.rangedDmgMax;
			stats.rangedSpeed = info.rangedSpeed;
			stats.rangedDps = info.rangedDps;
			stats.rangedCrit = info.rangedCrit;
			stats.rangedCritRating = info.rangedCritRating;
			stats.rangedHitRating = info.rangedHitRating;
			
			return stats;
		}
		
		private function _parseReputations(reputations:Array):Vector.<Reputation>
		{
			var reps:Vector.<Reputation> = new Vector.<Reputation>();
			for (var i:int = 0; i < reputations.length; i++)
			{
				var repInfo:Object = reputations[i];
				reps.push(new Reputation(repInfo.id, repInfo.name, repInfo.standing, repInfo.value, repInfo.max));
			}
			
			return reps;
		}
		
		private function _parseTitles(titleInfo:Array):Vector.<Title>
		{
			var titles:Vector.<Title> = new Vector.<Title>();
			for (var i:int = 0; i < titleInfo.length; i++)
			{
				titles.push(new Title(titleInfo[i].id, titleInfo[i].name, titleInfo[i].selected));
			}
			
			return titles;
		}
		
		private function _parseCompanions(companionInfo:Array):Vector.<Companion>
		{
			var companions:Vector.<Companion> = new Vector.<Companion>();
			for (var i:int = 0; i < companionInfo.length; i++)
			{
				companions.push(new Companion(companionInfo[i]));
			}
			
			return companions;
		}
		
		private function _parsePets(petInfo:Array):Vector.<Pet>
		{
			trace("parse pets");
			var pets:Vector.<Pet> = new Vector.<Pet>();
			for (var i:int = 0; i < petInfo.length; i++)
			{
				pets.push(new Pet(petInfo[i].name, petInfo[i].creature, petInfo[i].selected == "true", petInfo[i].slot));
			}
			
			return pets;
		}
		
		private function _parseMounts(mountInfo:Array):Vector.<Mount>
		{
			var mounts:Vector.<Mount> = new Vector.<Mount>();
			for (var i:int = 0; i < mountInfo.length; i++)
			{
				mounts.push(new Mount(mountInfo[i]));
			}
			
			return mounts;
		}
		
		private function _parseAppearance(info:Object):Appearance
		{
			var appearance:Appearance = new Appearance();
			appearance.faceVariation = info.faceVariation;
			appearance.featureVariation = info.featureVariation
			appearance.hairColor = info.hairColor;
			appearance.hairVariation = info.hairVariation;
			appearance.showCloak = info.showCloak == "true";
			appearance.showHelm = info.showHelm == "true";
			appearance.skinColor = info.skinColor;
			
			return appearance;
		}
		
		private function _parseProgression(info:Array):Vector.<Raid>
		{
			var raids:Vector.<Raid> = new Vector.<Raid>();
			for (var i:int = 0; i < info.length; i++)
			{
				var raid:Raid = new Raid();
				raid.id = info[i].id;
				raid.name = info[i].name;
				raid.normal = info[i].normal;
				raid.heroic = info[i].heroic;
				
				var bosses:Array = info[i].bosses;
				var raidBosses:Vector.<RaidBoss> = new Vector.<RaidBoss>();
				for (var j:int = 0; j < bosses.length; j++)
				{
					raidBosses.push(new RaidBoss(bosses[j].id, bosses[j].name, bosses[j].normalKills, bosses[j].heroicKills));
				}
				
				raid.bosses = raidBosses;
				raids.push(raid);
			}
			
			return raids;
		}
		
		private function _parsePVP(pvpInfo:Object):Object
		{
			var retObj:Object = new Object();
			retObj.personalRbgRating = pvpInfo.ratedBattlegrounds.personalRating;
			retObj.totalHonorableKills = pvpInfo.totalHonorableKills;
			
			var battlegroundInfo:Array = pvpInfo.ratedBattlegrounds.battlegrounds;
			var battlegrounds:Vector.<Battleground> = new Vector.<Battleground>();
			for (var i:int = 0; i < battlegroundInfo.length; i++)
			{
				battlegrounds.push(new Battleground(battlegroundInfo[i].name, battlegroundInfo[i].played, battlegroundInfo[i].won));
			}
			retObj.battlegrounds = battlegrounds;
			
			var teamsInfo:Array = pvpInfo.arenaTeams;
			var arenaTeams:Vector.<ArenaTeam> = new Vector.<ArenaTeam>();
			for (var j:int = 0; j < teamsInfo.length; j++)
			{
				arenaTeams.push(new ArenaTeam(teamsInfo[j].name, teamsInfo[j].personalRating, teamsInfo[j].teamRating, teamsInfo[i].size));
			}
			retObj.arenaTeams = arenaTeams;
			
			return retObj;
		}
		
		private function _parseProfessions(info:Object):Vector.<Profession>
		{
			var professions:Vector.<Profession> = new Vector.<Profession>();
			
			// Primary Professions
			var primary:Array = info.primary;
			for (var i:int = 0; i < primary.length; i++)
			{
				var primaryRecipes:Array = primary[i].recipes;
				var knownPrimaryRecipes:Vector.<Recipe> = new Vector.<Recipe>();
				for (var j:int = 0; j < primaryRecipes.length; j++)
				{
					knownPrimaryRecipes.push(new Recipe(primaryRecipes[i]));
				}
				
				professions.push(new Profession(primary[i].id, primary[i].name, primary[i].icon, primary[i].rank, primary[i].max, true, knownPrimaryRecipes));
			}
			
			// Secondary Professions
			var secondary:Array = info.secondary;
			for (var k:int = 0; k < secondary.length; k++)
			{
				var secondaryRecipes:Array = secondary[k].recipes;
				var knownSecondaryRecipes:Vector.<Recipe> = new Vector.<Recipe>();
				for (var l:int = 0; l < secondaryRecipes.length; l++)
				{
					knownSecondaryRecipes.push(new Recipe(secondaryRecipes[l]));
				}
				
				professions.push(new Profession(secondary[k].id, secondary[k].name, secondary[k].icon, secondary[k].rank, secondary[k].max, false, knownSecondaryRecipes));
			}
			
			return professions;
		}
	}
}
