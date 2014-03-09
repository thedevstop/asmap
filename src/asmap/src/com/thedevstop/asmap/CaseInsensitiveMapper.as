package com.thedevstop.asmap
{
	import com.thedevstop.contracts.Contract;
	import mx.collections.ArrayCollection;
	
	public class CaseInsensitiveMapper implements IObjectMapper
	{
		private var _mapper:IMapper;
		
		public function CaseInsensitiveMapper(mapper:IMapper)
		{
			Contract.require.isNotNull(mapper);
			
			_mapper = mapper;
		}
		
		public function map(source:Object, target:Object, typeInfo:TypeInfo):*
		{
			Contract.require.isNotNull(source);
			Contract.require.isNotNull(target);
			Contract.require.isNotNull(typeInfo);
			
			var key:String;
			var values:Object = {};
			for (key in source)
				values[key.toUpperCase()] = source[key];
			
			for each (var member:MemberInfo in typeInfo.members)
			{
				key = member.name.toUpperCase();
				if (values[key] === undefined)
					continue;
					
				var value:Object = values[member.name.toUpperCase()];
				value = _mapper.map(value, member.itemType);
				
				if (value is Array && member.containerType == MemberInfo.ARRAY_COLLECTION)
					value = new ArrayCollection(value as Array);
				
				target[member.name] = value;
			}
			
			return target;
		}
	}
}