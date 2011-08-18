package com.wowactions.characters 
{
	/**
	 * Contains statistical information about a specific character.
	 * 
	 * @author Josh Brown
	 * @see http://www.shif-f12.com/wowactions
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 10.0
	 * @since 8.17.2011
	 */
	public class Stats 
	{
		//========================================================
		// Private Properties
		//========================================================
		
		private var _health:Number;
		private var _powerType:String;
		private var _power:Number;
		private var _strength:Number;
		private var _agility:Number;
		private var _stamina:Number;
		private var _intellect:Number;
		private var _spirit:Number;
		private var _attackPower:Number;
		private var _rangedAttackPower:Number;
		private var _mastery:Number;
		private var _masteryRating:Number;
		private var _crit:Number;
		private var _critRating:Number;
		private var _hitRating:Number;
		private var _hasteRating:Number;
		private var _expertiseRating:Number;
		private var _spellPower:Number;
		private var _spellPenetration:Number;
		private var _spellCrit:Number;
		private var _spellCritRating:Number;
		private var _mana5:Number;
		private var _mana5Combat:Number;
		private var _armor:Number;
		private var _dodge:Number;
		private var _dodgeRating:Number;
		private var _parry:Number;
		private var _parryRating:Number;
		private var _block:Number;
		private var _blockRating:Number;
		private var _resilience:Number;
		private var _mainHandDmgMin:Number;
		private var _mainHandDmgMax:Number;
		private var _mainHandSpeed:Number;
		private var _mainHandExpertise:Number;
		private var _offHandDmgMin:Number;
		private var _offHandDmgMax:Number;
		private var _offHandSpeed:Number;
		private var _offHandDps:Number;
		private var _offHandExpertise:Number;
		private var _rangedDmgMin:Number;
		private var _rangedDmgMax:Number;
		private var _rangedSpeed:Number;
		private var _rangedDps:Number;
		private var _rangedCrit:Number;
		private var _rangedCritRating:Number;
		private var _rangedHitRating:Number;
		
		//========================================================
		// Getters / Setters
		//========================================================
		
		// I'm not going to go through and try to write AsDoc comments for every single one of these - there's just too many.
		
		public function get health():Number { return _health; }
		public function set health(value:Number):void 
		{
			_health = value;
		}
		
		public function get powerType():String { return _powerType; }
		public function set powerType(value:String):void 
		{
			_powerType = value;
		}
		
		public function get power():Number { return _power; }
		public function set power(value:Number):void 
		{
			_power = value;
		}
		
		public function get strength():Number { return _strength; }
		public function set strength(value:Number):void 
		{
			_strength = value;
		}
		
		public function get agility():Number { return _agility; }
		public function set agility(value:Number):void 
		{
			_agility = value;
		}
		
		public function get stamina():Number { return _stamina; }
		public function set stamina(value:Number):void 
		{
			_stamina = value;
		}
		
		public function get intellect():Number { return _intellect; }
		public function set intellect(value:Number):void 
		{
			_intellect = value;
		}
		
		public function get spirit():Number { return _spirit; }
		public function set spirit(value:Number):void 
		{
			_spirit = value;
		}
		
		public function get attackPower():Number { return _attackPower; }
		public function set attackPower(value:Number):void 
		{
			_attackPower = value;
		}
		
		public function get rangedAttackPower():Number { return _rangedAttackPower; }
		public function set rangedAttackPower(value:Number):void 
		{
			_rangedAttackPower = value;
		}
		
		public function get mastery():Number { return _mastery; }
		public function set mastery(value:Number):void 
		{
			_mastery = value;
		}
		
		public function get masteryRating():Number { return _masteryRating; }
		public function set masteryRating(value:Number):void 
		{
			_masteryRating = value;
		}
		
		public function get crit():Number { return _crit; }
		public function set crit(value:Number):void 
		{
			_crit = value;
		}
		
		public function get critRating():Number { return _critRating; }
		public function set critRating(value:Number):void 
		{
			_critRating = value;
		}
		
		public function get hitRating():Number { return _hitRating; }
		public function set hitRating(value:Number):void 
		{
			_hitRating = value;
		}
		
		public function get hasteRating():Number { return _hasteRating; }
		public function set hasteRating(value:Number):void 
		{
			_hasteRating = value;
		}
		
		public function get expertiseRating():Number { return _expertiseRating; }
		public function set expertiseRating(value:Number):void 
		{
			_expertiseRating = value;
		}
		
		public function get spellPower():Number { return _spellPower; }
		public function set spellPower(value:Number):void 
		{
			_spellPower = value;
		}
		
		public function get spellPenetration():Number { return _spellPenetration; }
		public function set spellPenetration(value:Number):void 
		{
			_spellPenetration = value;
		}
		
		public function get spellCrit():Number { return _spellCrit; }
		public function set spellCrit(value:Number):void 
		{
			_spellCrit = value;
		}
		
		public function get spellCritRating():Number { return _spellCritRating; }
		public function set spellCritRating(value:Number):void 
		{
			_spellCritRating = value;
		}
		
		public function get mana5():Number { return _mana5; }
		public function set mana5(value:Number):void 
		{
			_mana5 = value;
		}
		
		public function get mana5Combat():Number { return _mana5Combat; }
		public function set mana5Combat(value:Number):void 
		{
			_mana5Combat = value;
		}
		
		public function get armor():Number { return _armor; }
		public function set armor(value:Number):void 
		{
			_armor = value;
		}
		
		public function get dodge():Number { return _dodge; }
		public function set dodge(value:Number):void 
		{
			_dodge = value;
		}
		
		public function get dodgeRating():Number { return _dodgeRating; }
		public function set dodgeRating(value:Number):void 
		{
			_dodgeRating = value;
		}
		
		public function get parry():Number { return _parry; }
		public function set parry(value:Number):void 
		{
			_parry = value;
		}
		
		public function get parryRating():Number { return _parryRating; }
		public function set parryRating(value:Number):void 
		{
			_parryRating = value;
		}
		
		public function get block():Number { return _block; }
		public function set block(value:Number):void 
		{
			_block = value;
		}
		
		public function get blockRating():Number { return _blockRating; }
		public function set blockRating(value:Number):void 
		{
			_blockRating = value;
		}
		
		public function get resilience():Number { return _resilience; }
		public function set resilience(value:Number):void 
		{
			_resilience = value;
		}
		
		public function get mainHandDmgMin():Number { return _mainHandDmgMin; }
		public function set mainHandDmgMin(value:Number):void 
		{
			_mainHandDmgMin = value;
		}
		
		public function get mainHandDmgMax():Number { return _mainHandDmgMax; }
		public function set mainHandDmgMax(value:Number):void 
		{
			_mainHandDmgMax = value;
		}
		
		public function get mainHandSpeed():Number { return _mainHandSpeed; }
		public function set mainHandSpeed(value:Number):void 
		{
			_mainHandSpeed = value;
		}
		
		public function get mainHandExpertise():Number { return _mainHandExpertise; }
		public function set mainHandExpertise(value:Number):void 
		{
			_mainHandExpertise = value;
		}
		
		public function get offHandDmgMin():Number { return _offHandDmgMin; }
		public function set offHandDmgMin(value:Number):void 
		{
			_offHandDmgMin = value;
		}
		
		public function get offHandDmgMax():Number { return _offHandDmgMax; }
		public function set offHandDmgMax(value:Number):void 
		{
			_offHandDmgMax = value;
		}
		
		public function get offHandSpeed():Number { return _offHandSpeed; }
		public function set offHandSpeed(value:Number):void 
		{
			_offHandSpeed = value;
		}
		
		public function get offHandDps():Number { return _offHandDps; }
		public function set offHandDps(value:Number):void 
		{
			_offHandDps = value;
		}
		
		public function get offHandExpertise():Number { return _offHandExpertise; }
		public function set offHandExpertise(value:Number):void 
		{
			_offHandExpertise = value;
		}
		
		public function get rangedDmgMin():Number { return _rangedDmgMin; }
		public function set rangedDmgMin(value:Number):void 
		{
			_rangedDmgMin = value;
		}
		
		public function get rangedDmgMax():Number { return _rangedDmgMax; }
		public function set rangedDmgMax(value:Number):void 
		{
			_rangedDmgMax = value;
		}
		
		public function get rangedSpeed():Number { return _rangedSpeed; }
		public function set rangedSpeed(value:Number):void 
		{
			_rangedSpeed = value;
		}
		
		public function get rangedDps():Number { return _rangedDps; }
		public function set rangedDps(value:Number):void 
		{
			_rangedDps = value;
		}
		
		public function get rangedCrit():Number { return _rangedCrit; }
		public function set rangedCrit(value:Number):void 
		{
			_rangedCrit = value;
		}
		
		public function get rangedCritRating():Number { return _rangedCritRating; }
		public function set rangedCritRating(value:Number):void 
		{
			_rangedCritRating = value;
		}
		
		public function get rangedHitRating():Number { return _rangedHitRating; }
		public function set rangedHitRating(value:Number):void 
		{
			_rangedHitRating = value;
		}
		
		//========================================================
		// Constructor Function
		//========================================================
		public function Stats() 
		{
			
		}
	}
}
