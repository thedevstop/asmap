package com.thedevstop.asmap.stubs 
{
	import mx.collections.ArrayCollection;
	public class User 
	{
		private var _name:String;
		public var AGE:int = 20;
		
		[Item(type="com.thedevstop.asmap.stubs.User")]
		public var Children:Array;
		
		[Item(type="com.thedevstop.asmap.stubs.User")]
		public var FriendS:ArrayCollection;
		
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