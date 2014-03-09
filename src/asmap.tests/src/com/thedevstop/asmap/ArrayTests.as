package com.thedevstop.asmap 
{
	import asunit.framework.TestCase;
	import com.thedevstop.asfac.FluentAsFactory;
	
	public class ArrayTests extends TestCase
	{
		public function ArrayTests(testMethod:String = null) 
		{
			super(testMethod);
		}
		
		public function test_map_null_to_array_returns_null():void
		{
			var factory:FluentAsFactory = new FluentAsFactory();
			factory.register(Mapper).asType(IMapper);
			
			var mapper:IMapper = factory.resolve(IMapper);
			var result:Object = mapper.map(null, Array);
			
			assertNull(result);
		}
	}
}