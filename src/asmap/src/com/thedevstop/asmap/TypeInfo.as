package com.thedevstop.asmap 
{
	import com.thedevstop.contracts.Contract;
	public class TypeInfo 
	{
		private var _className:String;
		private var _members:Array;
		
		public function TypeInfo(className:String, members:Array) 
		{
			Contract.require.isNotNull(className);
			Contract.require.isNotNull(members);
			
			_className = className;
			_members = members;
		}
		
		public function get className():String
		{
			return _className;
		}
		
		public function get members():Array
		{
			return _members;
		}
	}
}