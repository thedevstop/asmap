package com.thedevstop.asmap 
{
	public interface IObjectMapper 
	{
		function map(source:Object, target:Object, typeInfo:TypeInfo):*;
	}	
}