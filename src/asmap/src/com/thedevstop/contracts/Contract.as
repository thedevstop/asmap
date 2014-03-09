package com.thedevstop.contracts 
{
	import com.thedevstop.contracts.ContractViolatedError;
	import com.thedevstop.contracts.ContractViolatedEvent;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	
	[Event(name="preCondition", type="com.thedevstop.contracts.ContractViolatedEvent")]
	[Event(name = "postCondition", type = "com.thedevstop.contracts.ContractViolatedEvent")]
	/**
	 * Use for checking pre- and post- conditions in code.
	 */
	public class Contract
	{
		public static const PRE_CONDITION:String = "preCondition";
		public static const POST_CONDITION:String = "postCondition";
		
		private static var _dispatcher:EventDispatcher = null;
		
		/**
		 * The event dispatcher where contract events can be listened for in Release builds.
		 */
		public static function get eventDispatcher():IEventDispatcher
		{
			if (_dispatcher == null)
				_dispatcher = new EventDispatcher();
			
			return _dispatcher;
		}
		
		/**
		 * Pre-condition check for true.
		 */
		public static function requireTrue(condition:Boolean, message:String = null):void
		{
			if (condition)
				return;
			
			message = message || "Expected condition to evaluate to true.";
			conditionCheckFailed(PRE_CONDITION, message);
		}
		
		/**
		 * Pre-condition check for false.
		 */
		public static function requireFalse(condition:Boolean, message:String = null):void
		{
			message = message || "Expected condition to evaluate to false.";
			requireTrue(!condition, message);
		}
		
		/**
		 * Pre-condition check for equality.
		 */
		public static function requireEquals(expected:Object, actual:Object, message:String = null):void
		{
			message = message || "Expected value: <" + expected + "> but was: <" + actual + ">.";
			requireTrue((expected == null && actual == null) ||
						(expected != null && expected.equals && expected.equals is Function && expected.equals(actual)) ||
						(expected == actual), message);
		}
		
		/**
		 * Pre-condition check for same instance.
		 */
		public static function requireSame(expected:Object, actual:Object, message:String = null):void
		{
			message = message || "Expected same: <" + expected + "> but was: <" + actual + ">.";
			requireTrue(expected === actual, message);
		}
		
		/**
		 * Pre-condition check for different instances.
		 */
		public static function requireNotSame(expected:Object, actual:Object, message:String = null):void
		{
			message = message || "Expected not same.";
			requireTrue(expected !== actual, message);
		}
		
		/**
		 * Pre-condition check for null-ness.
		 */
		public static function requireNull(object:Object, message:String = null):void
		{
			message = message || "Expected null value.";
			requireTrue(object === null, message);
		}
		
		/**
		 * Pre-condition check for value.
		 */
		public static function requireNotNull(object:Object, message:String = null):void
		{
			message = message || "Expected non-null value.";
			requireTrue(object !== null, message);
		}
		
		/**
		 * Post-condition check for true.
		 */
		public static function ensureTrue(condition:Boolean, message:String = null):void
		{
			if (condition)
				return;
			
			message = message || "Expected condition to evaluate to true.";
			conditionCheckFailed(POST_CONDITION, message);
		}
		
		/**
		 * Post-condition check for false.
		 */
		public static function ensureFalse(condition:Boolean, message:String = null):void
		{
			message = message || "Expected condition to evaluate to false.";
			ensureTrue(!condition, message);
		}
		
		/**
		 * Post-condition check for equality.
		 */
		public static function ensureEquals(expected:Object, actual:Object, message:String = null):void
		{
			message = message || "Expected value: <" + expected + "> but was: <" + actual + ">.";
			ensureTrue((expected == null && actual == null) ||
						(expected != null && expected.equals && expected.equals is Function && expected.equals(actual)) ||
						(expected == actual), message);
		}
		
		/**
		 * Post-condition check for same instance.
		 */
		public static function ensureSame(expected:Object, actual:Object, message:String = null):void
		{
			message = message || "Expected same: <" + expected + "> but was: <" + actual + ">.";
			ensureTrue(expected === actual, message);
		}
		
		/**
		 * Post-condition check for different instances.
		 */
		public static function ensureNotSame(expected:Object, actual:Object, message:String = null):void
		{
			message = message || "Expected not same.";
			ensureTrue(expected !== actual, message);
		}
		
		/**
		 * Post-condition check for null-ness.
		 */
		public static function ensureNull(object:Object, message:String = null):void
		{
			message = message || "Expected null value.";
			ensureTrue(object === null, message);
		}
		
		/**
		 * Post-condition check for a value.
		 */
		public static function ensureNotNull(object:Object, message:String = null):void
		{
			message = message || "Expected non-null value.";
			ensureTrue(object !== null, message);
		}
		
		private static function conditionCheckFailed(type:String, message:String):void
		{
			CONFIG::debug
			{
				throw new ContractViolatedError(type, message);
			}
			
			CONFIG::release
			{
				eventDispatcher.dispatchEvent(new ContractViolatedEvent(type, message));
			}
		}
	}
}