package com.thedevstop.asmap 
{
	import com.thedevstop.asguard.Contract;
	import mx.collections.ArrayCollection;

	public class CaseSensitiveMapper implements IObjectMapper
	{
		private var _mapper:IMapper;
		
		public function CaseSensitiveMapper(mapper:IMapper)
		{
			Contract.require.isNotNull(mapper);
			
			_mapper = mapper;
		}
		
		public function map(source:Object, target:Object, typeInfo:TypeInfo):*
		{
			Contract.require.isNotNull(source);
			Contract.require.isNotNull(target);
			Contract.require.isNotNull(typeInfo);
			
			var values:Object = {};
			for (var key:String in source)
				values[key] = source[key];
			
			for each (var member:MemberInfo in typeInfo.members)
			{
				if (values[member.name] === undefined)
					continue;
					
				var value:Object = values[member.name];
				value = _mapper.map(value, member.itemType);
				
				if (value is Array && member.containerType == MemberInfo.ARRAY_COLLECTION)
					value = new ArrayCollection(value as Array);
				
				target[member.name] = value;
			}
			
			return target;
		}
	}
}