package com.thedevstop.asmap 
{
	import asunit.framework.TestCase;
	import com.thedevstop.asfac.FluentAsFactory;
	import com.thedevstop.asmap.stubs.User;

	public class CaseSensitiveTests extends TestCase
	{
		public function CaseSensitiveTests(testMethod:String = null) 
		{
			super(testMethod);
		}
		
		public function test_map_object_maps_matching_keys():void
		{
			var factory:FluentAsFactory = new FluentAsFactory();
			factory.register(Mapper).asType(IMapper);
			factory.register(CaseSensitiveMapper).asType(IObjectMapper);
			
			var mapper:IMapper = factory.resolve(IMapper);
			var result:User = mapper.map({name:"test", AGE:25, Children:[]}, User);
			
			assertEquals(25, result.AGE);
			assertEquals("test", result.name);
			assertEqualsArrays([], result.Children);
		}
		
		public function test_map_object_doesnt_maps_nonmatching_keys():void
		{
			var factory:FluentAsFactory = new FluentAsFactory();
			factory.register(Mapper).asType(IMapper);
			factory.register(CaseSensitiveMapper).asType(IObjectMapper);
			
			var mapper:IMapper = factory.resolve(IMapper);
			var result:User = mapper.map({NAME:"test", AGE:25, CHILDREN:[]}, User);
			
			assertEquals(25, result.AGE);
			assertNull(result.name);
			assertNull(result.Children);
		}
	}
}