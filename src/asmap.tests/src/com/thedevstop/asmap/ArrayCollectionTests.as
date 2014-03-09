package com.thedevstop.asmap 
{
	import asunit.framework.TestCase;
	import com.thedevstop.asfac.FluentAsFactory;
	import com.thedevstop.asmap.stubs.User;
	import mx.collections.ArrayCollection;
	
	public class ArrayCollectionTests extends TestCase
	{
		public function ArrayCollectionTests(testMethod:String = null) 
		{
			super(testMethod);
		}
		
		public function test_map_null_returns_null():void
		{
			var factory:FluentAsFactory = new FluentAsFactory();
			factory.register(Mapper).asType(IMapper);
			factory.register(CaseSensitiveMapper).asType(IObjectMapper);
			
			var mapper:IMapper = factory.resolve(IMapper);
			var result:Object = mapper.map(null, ArrayCollection);
			
			assertNull(result);		
		}
		
		public function test_map_empty_arraycolletion_returns_empty_arraycollection():void
		{
			var factory:FluentAsFactory = new FluentAsFactory();
			factory.register(Mapper).asType(IMapper);
			factory.register(CaseSensitiveMapper).asType(IObjectMapper);
			
			var mapper:IMapper = factory.resolve(IMapper);
			var result:Object = mapper.map(new ArrayCollection(), Object);
			
			assertNotNull(result);
			assertTrue(result is ArrayCollection);
			assertEquals(0, result.length);
		}
		
		public function test_map_populated_arraycollection_returns_populated_arraycollection():void
		{
			var factory:FluentAsFactory = new FluentAsFactory();
			factory.register(Mapper).asType(IMapper);
			factory.register(CaseSensitiveMapper).asType(IObjectMapper);
			
			var mapper:IMapper = factory.resolve(IMapper);
			var result:Object = mapper.map(new ArrayCollection([{}]), Object);
			
			assertNotNull(result);
			assertTrue(result is ArrayCollection);
			assertEquals(1, result.length);
		}
		
		public function test_map_member_with_item_attribute_to_type():void
		{
			var factory:FluentAsFactory = new FluentAsFactory();
			factory.register(Mapper).asType(IMapper);
			factory.register(CaseSensitiveMapper).asType(IObjectMapper);
			
			var mapper:IMapper = factory.resolve(IMapper);
			var result:User = mapper.map({FriendS:[{name:"Test"}]}, User);
			
			assertNotNull(result.FriendS);
			assertTrue(result.FriendS is ArrayCollection);
			assertEquals(1, result.FriendS.length);
			assertTrue(result.FriendS[0] is User);
			assertEquals("Test", result.FriendS[0].name);
		}
	}
}