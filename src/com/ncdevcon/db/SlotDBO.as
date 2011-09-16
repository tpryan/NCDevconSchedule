package com.ncdevcon.db
{
	import com.ncdevcon.vo.Slot;
	
	import flash.data.SQLConnection;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;
	
	public class SlotDBO extends BaseDBO
	{
		public function SlotDBO(conn:SQLConnection, dbManager:DBManger)
		{
			super(conn, "slot", "slotid", dbManager);
		}
		
		override public function list(orderBy:String =""):ArrayCollection{
			var ac:ArrayCollection = super.list(orderBy);
			var result:ArrayCollection = new ArrayCollection();
			
			for (var i:int=0; i<ac.length; i ++ ){
				result.addItem(convertPlainObjectToSlot(ac[i]));
			}
			
			
			return result;
		}
		
		
		protected function convertPlainObjectToSlot(obj:Object):Slot{
			var result:Slot = new Slot();
		
			result.slotid = obj.slotid;
			result.startTime = convertDateTime(obj.starttime);
			result.endTime = convertDateTime(obj.endtime);
			
			return result;
		}
		
		private function convertDateTime(dateString:String):Date{
			var timeDateArray:Array = dateString.split(" ");
			var datearray:Array = timeDateArray[0].split("-");
			var timeArray:Array = timeDateArray[1].split(":");
			
			var year:int = parseInt(datearray[0]);
			var month:int = parseInt(datearray[1])-1;
			var day:int = parseInt(datearray[2]);
			
			var hour:int = parseInt(timeArray[0]);
			var min:int = parseInt(timeArray[1]);
			
			var result:Date = new Date(year, month, day, hour,min);
			
			return result;
		}
		
		public function get(id:int):Slot{
			return convertPlainObjectToSlot(baseGet(id));
		}
										 
		
		
	}
}