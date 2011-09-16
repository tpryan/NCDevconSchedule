package com.ncdevcon.vo
{
	public class Topic
	{
		
		[Bindable]
		public var topicid:int;
		[Bindable]
		public var title:String;
		[Bindable]
		public var description:String;
		[Bindable]
		public var speaker:Speaker;
		[Bindable]
		public var track:Track;
		[Bindable]
		public var slot:Slot;
		
		public function Topic()
		{
		}
	}
}