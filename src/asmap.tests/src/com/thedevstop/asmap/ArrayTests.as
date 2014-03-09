package com.thedevstop.asmap 
{
	import asunit.framework.TestCase;
	import com.thedevstop.asfac.FluentAsFactory;
	import com.thedevstop.asmap.stubs.User;
	import mx.collections.ArrayCollection;
	
	public class ArrayTests extends TestCase
	{
		public function ArrayTests(testMethod:String = null) 
		{
			super(testMethod);
		}
		
		public function test_map_null_returns_null():void
		{
			var factory:FluentAsFactory = new FluentAsFactory();
			factory.register(Mapper).asType(IMapper);
			factory.register(CaseSensitiveMapper).asType(IObjectMapper);
			
			var mapper:IMapper = factory.resolve(IMapper);
			var result:Object = mapper.map(null, Array);
			
			assertNull(result);
		}
		
		public function test_map_empty_array_returns_empty_array():void
		{
			var factory:FluentAsFactory = new FluentAsFactory();
			factory.register(Mapper).asType(IMapper);
			factory.register(CaseSensitiveMapper).asType(IObjectMapper);
			
			var mapper:IMapper = factory.resolve(IMapper);
			var result:Object = mapper.map([], Array);
			
			assertNotNull(result);
			assertTrue(result is Array);
			assertEquals(0, result.length);
		}
		
		public function test_map_populated_array_returns_populated_array():void
		{
			var factory:FluentAsFactory = new FluentAsFactory();
			factory.register(Mapper).asType(IMapper);
			factory.register(CaseSensitiveMapper).asType(IObjectMapper);
			
			var mapper:IMapper = factory.resolve(IMapper);
			var result:Object = mapper.map([{}], Array);
			
			assertNotNull(result);
			assertTrue(result is Array);
			assertEquals(1, result.length);
		}
		
		public function test_map_member_with_item_attribute_to_type():void
		{
			var factory:FluentAsFactory = new FluentAsFactory();
			factory.register(Mapper).asType(IMapper);
			factory.register(CaseSensitiveMapper).asType(IObjectMapper);
			
			var mapper:IMapper = factory.resolve(IMapper);
			var result:User = mapper.map({Children:[{name:"Test"}]}, User);
			
			assertNotNull(result.Children);
			assertTrue(result.Children is Array);
			assertEquals(1, result.Children.length);
			assertTrue(result.Children[0] is User);
			assertEquals("Test", result.Children[0].name);
		}
	}
}