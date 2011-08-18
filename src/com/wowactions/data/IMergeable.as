package com.wowactions.data 
{
	
	/**
	 * An interface for any class that can be merged with a class of it's same type.
	 * 
	 * @author Josh Brown
	 * @see http://www.shift-f12.com/wowactions
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 10.0
	 * @since 8.17.2011
	 */
	public interface IMergeable 
	{
		/**
		 * The Merge method will allow classes that implement IMergeable to merge their data with another class.
		 * 
		 * @param	mergeableClass A class (preferably of the same type) from what data should be merged.
		 */
		function merge(mergeableClass:IMergeable):void;
	}
	
}
