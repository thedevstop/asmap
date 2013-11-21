asmap
=====

An easy to use object mapper.

**Mapper**

The mapper will map an instance of an object into a specified type. This is especially helpful when needing to cast web service responses to their concrete type.

``` actionscript
var userObject:Object = {Name:"Anakin Skywalker", Children:[{name:"Luke Skywalker"}, {name:"Leia Amidala Skywalker"}]};

var mapper:IMapper = factory.resolve(IMapper);
var user:User = mapper.map(userObject, User);
```

***

**Item Metadata**

In order to map the items within an Array or ArrayCollection you must markup the variable or property with an Item attribute.

``` actionscript
package com.thedevstop 
{
	public class User 
	{
		private var _name:String;
		
		[Item(type="com.thedevstop.User")]
		public var children:Array;
		
		public function get name():String
		{
			return _name;
		}
		
		public function set name(value:String):void
		{
			_name = value;
		}	
	}
}
```

In order to use the custom metadata attribute you will need to add the following to your compiler flags.

```
-keep-as3-metadata+=Item
```

***

**Custom Object Mappers**

By default Mapper will use a case-insensitive object mapper that attepts to match variables and properties by name. If your object needs custom behavior in order to map across, then you can implement your own `IObjectMapper`. Your custom object mapper will need to be registered with the IoC container before it can be used.

***

**IoC Container**

The IoC container is used for binding object together at runtime. The IoC container is the platform for registering custom object mappers.

``` actionscript
var factory:FluentAsFactory = new FluentAsFactory();

factory.inScope(MyType).register(MyTypeMapper).asType(IObjectMapper);
var myMapper:IObjectMapper = factory.fromScope(MyType).resolve(IObjectMapper);

// The myMapper variable is an instance of MyTypeMapper.
```

Asmap uses [asfac](https://github.com/thedevstop/asfac/ "asfac") for it's IoC container.

***

**License**

This content is released under the MIT License (See LICENSE).
