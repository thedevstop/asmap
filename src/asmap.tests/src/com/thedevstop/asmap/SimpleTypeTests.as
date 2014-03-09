package com.thedevstop.asmap 
{
	import asunit.framework.TestCase;
	import com.thedevstop.asfac.FluentAsFactory;

	public class SimpleTypeTests extends TestCase
	{
		public function SimpleTypeTests(testMethod:String = null) 
		{
			super(testMethod);
		}
		
		public function test_map_null_to_object_returns_null():void
		{
			var factory:FluentAsFactory = new FluentAsFactory();
			factory.register(Mapper).asType(IMapper);
			factory.register(CaseSensitiveMapper).asType(IObjectMapper);
			
			var mapper:IMapper = factory.resolve(IMapper);
			var result:Object = mapper.map(null, Object);
			
			assertNull(result);		
		}
		
		public function test_map_number_to_number_returns_number():void
		{
			var factory:FluentAsFactory = new FluentAsFactory();
			factory.register(Mapper).asType(IMapper);
			factory.register(CaseSensitiveMapper).asType(IObjectMapper);
			
			var mapper:IMapper = factory.resolve(IMapper);
			var result:Object = mapper.map(-7.25, Number);
			
			assertEquals(-7.25, result);		
		}
		
		public function test_map_string_to_string_returns_string():void
		{
			var factory:FluentAsFactory = new FluentAsFactory();
			factory.register(Mapper).asType(IMapper);
			factory.register(CaseSensitiveMapper).asType(IObjectMapper);
			
			var mapper:IMapper = factory.resolve(IMapper);
			var result:Object = mapper.map("test", String);
			
			assertEquals("test", result);		
		}
	}
}