package com.wowactions.characters 
{
	/**
	 * Contains information related to the physical appearance of a character.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com/wowactions
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 10.0
	 * @since 8.17.2011
	 */
	public class Appearance 
	{
		//========================================================
		// Private Properties
		//========================================================
		
		private var _faceVariation:Number;
		private var _skinColor:uint;
		private var _hairVariation:Number;
		private var _hairColor:uint;
		private var _featureVariation:Number;
		private var _showHelm:Boolean;
		private var _showCloak:Boolean;
		
		//========================================================
		// Getters / Setters
		//========================================================
		
		public function get faceVariation():Number { return _faceVariation; }
		public function set faceVariation(value:Number):void
		{
			_faceVariation = value;
		}
		
		public function get skinColor():uint { return _skinColor; }
		public function set skinColor(value:uint):void
		{
			_skinColor = value;
		}
		
		public function get hairVariation():Number { return _hairVariation; }
		public function set hairVariation(value:Number):void
		{
			_hairVariation = value;
		}
		
		public function get hairColor():uint { return _hairColor; }
		public function set hairColor(value:uint):void
		{
			_hairColor = value;
		}
		
		public function get featureVariation():Number { return _featureVariation; }
		public function set featureVariation(value:Number):void
		{
			_featureVariation = value;
		}
		
		public function get showHelm():Boolean { return _showHelm; }
		public function set showHelm(value:Boolean):void
		{
			_showHelm = value;
		}
		
		public function get showCloak():Boolean { return _showCloak; }
		public function set showCloak(value:Boolean):void
		{
			_showCloak = value;
		}
		
		/**
		 * Creates a new instance of the Appearance class.
		 * 
		 * @param	faceVariation The current face variant of the character.
		 * @param	skinColor The current skin color of the character.
		 * @param	hairVariation The current hair variant of the character.
		 * @param	hairColor The current hair color of the character.
		 * @param	featureVariation The current feature variant of the character.
		 * @param	showHelm Whether or not the helmet is currently shown.
		 * @param	showCloak Whether or not the cloak is currently shown.
		 */
		public function Appearance(faceVariation:Number = -1, skinColor:uint = 0, hairVariation:Number = -1, hairColor:uint = 0, featureVariation:Number = -1, showHelm:Boolean = true, showCloak:Boolean = true)
		{
			this.faceVariation = faceVariation;
			this.skinColor = skinColor;
			this.hairVariation = hairVariation;
			this.hairColor = hairColor;
			this.featureVariation = featureVariation;
			this.showHelm = showHelm;
			this.showCloak = showCloak;
		}
		
		public function toString():String
		{
			return "Appearance - Face Variation: " + faceVariation.toString() + ", Skin Color: " + skinColor.toString() + ", Hair Variation: " + hairVariation.toString() + ", Hair Color: " + hairColor.toString() + ", Feature Variation: " + featureVariation.toString() + ", Show Helm: " + showHelm.toString() + ", Show Cloak: " + showCloak.toString();
		}
		
	}

}
