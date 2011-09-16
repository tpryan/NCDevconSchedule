package com.ncdevcon.vo
{
	public class Speaker
	{
		
		public var speakerid:int;
		public var firstName:String;
		public var lastName:String;
		public var bio:String;
		
		public function Speaker()
		{
		}

		public function get fullName():String
		{
			return firstName + " " + lastName;
		}

	}
}