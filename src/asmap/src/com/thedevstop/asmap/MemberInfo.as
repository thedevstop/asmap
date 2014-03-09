package com.thedevstop.asmap 
{
	import com.thedevstop.contracts.Contract;
	public class MemberInfo 
	{
		public static const OBJECT:String = "object";
		public static const ARRAY:String = "array";
		public static const ARRAY_COLLECTION:String = "arrayCollection";
		
		private var _name:String;
		private var _itemType:Class;
		private var _containerType:String;
		
		public function MemberInfo(name:String, itemType:Class, containerType:String) 
		{
			Contract.require.isNotNull(name);
			Contract.require.isNotNull(itemType);
			Contract.require.isNotNull(containerType);
			
			_name = name;
			_itemType = itemType;
			_containerType = containerType;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get itemType():Class
		{
			return _itemType;
		}
		
		public function get containerType():String
		{
			return _containerType;
		}
	}
}