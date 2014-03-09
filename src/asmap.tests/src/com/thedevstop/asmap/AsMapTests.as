package com.thedevstop.asmap 
{
	import asunit.framework.TestSuite;
	
	public class AsMapTests extends TestSuite
	{
		public function AsMapTests() 
		{
			super();
			
			addTest(new SimpleTypeTests());
			addTest(new ArrayTests());
			addTest(new ArrayCollectionTests());
			addTest(new CaseSensitiveTests());
			addTest(new CaseInsensitiveTests());
		}
	}
}