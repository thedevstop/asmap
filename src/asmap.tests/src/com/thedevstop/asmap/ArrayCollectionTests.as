package com.thedevstop.asmap 
{
	import asunit.framework.TestCase;
	import com.thedevstop.asfac.FluentAsFactory;
	import mx.collections.ArrayCollection;
	
	public class ArrayCollectionTests extends TestCase
	{
		public function ArrayCollectionTests(testMethod:String = null) 
		{
			super(testMethod);
		}
		
		public function test_map_null_to_arrayCollection_returns_null():void
		{
			var factory:FluentAsFactory = new FluentAsFactory();
			factory.register(Mapper).asType(IMapper);
			
			var mapper:IMapper = factory.resolve(IMapper);
			var result:Object = mapper.map(null, ArrayCollection);
			
			assertNull(result);		
		}
	}
}