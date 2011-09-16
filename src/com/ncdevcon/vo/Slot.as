package com.ncdevcon.vo
{

	public class Slot
	{
		
		public var slotid:int;
		public var startTime:Date;
		public var endTime:Date;
		
		public function Slot()
		{
		}

		public function get title():String
		{
			var day:String = "Sat";
			
			if (startTime.day == 0){
				day = "Sun";
			}
			
			var start:String = day + " " + "Sept" + " " + startTime.date;			
			return start;
		}
		
		public function get range():String
		{
			var mins:String = startTime.minutes.toString();
			var hours:int = startTime.hours;
			var suffix:String = "AM";
			
			if (hours > 12){
				hours = hours - 12;
				suffix = "PM";
			}
			
			if (mins.length < 2){
				mins = "0" + mins;
			}
			
			var result:String = convertTime(startTime) + " - " + convertTime(endTime);			
			return result;
		}
		
		public function convertTime(date:Date):String{
			var mins:String = date.minutes.toString();
			var hours:int = date.hours;
			var suffix:String = "AM";
			
			if (hours > 12){
				hours = hours - 12;
				suffix = "PM";
			}
			
			if (mins.length < 2){
				mins = "0" + mins;
			}
			
			var result:String = hours + ":" + mins + suffix;			
			return result;
			
		}
			
		

	}
}