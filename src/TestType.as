package  
{
	import mx.collections.ArrayCollection;
	
	public class TestType 
	{
		private var _first:String;
		
		public var name:String;
		
		[Item(type="TestType")]
		public var places:Array;
		
		public var times:ArrayCollection;
		
		public function TestType() 
		{
			
		}
		
		public function get first():String
		{
			return _first;
		}
		
		public function set first(f:String):void
		{
			_first = f;
		}
		
		public function get last():String
		{
			return "";
		}
		
	}

}