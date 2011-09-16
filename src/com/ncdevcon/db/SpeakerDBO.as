package com.ncdevcon.db
{
	
	import com.ncdevcon.vo.Speaker;
	
	import flash.data.SQLConnection;
	
	import mx.collections.ArrayCollection;
	
	public class SpeakerDBO extends BaseDBO
	{
		public function SpeakerDBO(conn:SQLConnection, dbManager:DBManger)
		{
			super(conn, "speaker", "speakerid", dbManager);
		}
		
		override public function list(orderBy:String =""):ArrayCollection{
			var ac:ArrayCollection = super.list(orderBy);
			var result:ArrayCollection = new ArrayCollection();
			
			for (var i:int=0; i<ac.length; i ++ ){
				
				result.addItem(convertPlainObjectToSpeaker(ac[i]));
			}

			return result;
		}
		
		public function get(id:int):Speaker{
			return convertPlainObjectToSpeaker(baseGet(id));
		}
		
		private function convertPlainObjectToSpeaker(obj:Object):Speaker
		{
			var result:Speaker = new Speaker();
			
			result.speakerid = obj.speakerid;
			result.firstName = obj.firstname;
			result.lastName = obj.lastname;
			result.bio = obj.bio;
			
			return result;
		}		
		
	}
}