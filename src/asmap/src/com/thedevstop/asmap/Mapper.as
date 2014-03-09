package com.thedevstop.asmap 
{
	import com.thedevstop.asfac.FluentAsFactory;
	import mx.collections.ArrayCollection;

	public class Mapper implements IMapper
	{
		private var _factory:FluentAsFactory;
		
		public function Mapper(factory:FluentAsFactory)
		{
			_factory = factory;
		}
		
		public function map(instance:*, type:Class):*
		{
			if (instance === null || instance === undefined)
				return instance;
			
			if (instance is Array)
				return mapArray(instance, type);
			if (instance is ArrayCollection)
				return mapArrayCollection(instance, type);
			return mapObject(instance, type);
		}
		
		private function mapArray(instance:Array, type:Class):Array
		{
			return instance.map(function(item:Object, index:int, array:Array):* {
				return mapObject(item, type);
			});
		}
		
		private function mapArrayCollection(instance:ArrayCollection, type:Class):ArrayCollection
		{
			return new ArrayCollection(mapArray(instance.toArray(), type));
		}
		
		private function mapObject(instance:Object, type:Class):Object
		{
			if (instance is type)
				return instance;
			
			var objectMapper:IObjectMapper = _factory.fromScope(type).resolveWithFallback(IObjectMapper);
			var target:Object = _factory.resolve(type);
			var typeInfo:TypeInfo = ReflectionUtil.getTypeInfo(type);
			return objectMapper.map(instance, target, typeInfo);
		}
	}
}