package com.thedevstop.asmap
{
	import flash.utils.describeType;
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import mx.collections.ArrayCollection;
	
	public class ReflectionUtil
	{
		private static var _typeCache:Dictionary = new Dictionary();
		
		public static function getTypeInfo(type:Class):TypeInfo
		{
			if (!_typeCache[type])
				_typeCache[type] = generateTypeInfo(type);
			
			return _typeCache[type];
		}
		
		private static function generateTypeInfo(type:Class):TypeInfo
		{
			var members:Array = [];
			var description:XML = describeType(type);
			
			for each (var property:XML in description.factory.accessor)
			{
				if (property.@access != "readwrite")
					continue;
				
				members.push(getMemberInfo(property));
			}
			
			for each (var variable:XML in description.factory.variable)
				members.push(getMemberInfo(variable));
			
			return new TypeInfo(description.@name.toString(), members);
		}
		
		private static function getMemberInfo(member:XML):MemberInfo
		{
			var cotainerType:String = MemberInfo.OBJECT;
			var itemType:Class = Class(getDefinitionByName(member.@type.toString()));
			
			if (itemType == Array || itemType == ArrayCollection)
			{
				cotainerType = itemType == Array ? MemberInfo.ARRAY : MemberInfo.ARRAY_COLLECTION;
				itemType = getItemType(member);
			}
			
			return new MemberInfo(member.@name.toString(), itemType, cotainerType);
		}
		
		private static function getItemType(member:XML):Class
		{
			for each (var metadata:XML in member.metadata)
			{
				if (metadata.@name.toString() != "Item")
					continue;
					
				for each (var arg:XML in metadata.arg)
				{
					if (arg.@key.toString() == "type")
						return Class(getDefinitionByName(arg.@value.toString()));
				}
				break;
			}
			
			return Object;
		}
	}
}