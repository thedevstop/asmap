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