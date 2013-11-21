package com.thedevstop.asmap 
{
	import mx.collections.ArrayCollection;
	import mx.utils.StringUtil;
	
	public class CaseInsensitiveMapper implements IObjectMapper
	{
		private var _mapper:IMapper;
		
		public function CaseInsensitiveMapper(mapper:IMapper)
		{
			_mapper = mapper;
		}
		
		public function map(source:Object, target:Object, typeInfo:TypeInfo):* 
		{
			var upperCaseKeys:ArrayCollection = new ArrayCollection();
			var keys:Array = [];
			for (var key:String in source)
			{
				upperCaseKeys.addItem(key.toUpperCase());
				keys.push(key);
			}
			
			for each (var member:MemberInfo in typeInfo.members)
			{
				var index:int = upperCaseKeys.getItemIndex(member.name.toUpperCase());
				if (index == -1)
					continue;
				
				var value:Object = source[keys[index]];
				if (member.type != Object && Object(value).constructor != member.type)
					value = _mapper.map(value, member.type);
				
				if (value is Array && member.containerType == MemberInfo.ARRAY_COLLECTION)
					value = new ArrayCollection(value as Array);
				else if (value is ArrayCollection && member.containerType == MemberInfo.ARRAY)
					value = value.toArray();
				
				target[member.name] = value;
			}
			
			return target;
		}		
	}
}