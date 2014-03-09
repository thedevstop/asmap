package
{
	import asunit.textui.TestRunner;
	import com.thedevstop.asmap.AsMapTests;
	import flash.display.Sprite;
	
	public class Main extends Sprite
	{
		public function Main():void
		{
			var testRunner:TestRunner = new TestRunner();
			stage.addChild(testRunner);
			testRunner.start(AsMapTests, null, TestRunner.SHOW_TRACE);
		}
	}
}