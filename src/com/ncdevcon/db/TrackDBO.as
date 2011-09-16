package com.ncdevcon.db
{
	import com.ncdevcon.vo.Track;
	
	import flash.data.SQLConnection;
	
	public class TrackDBO extends BaseDBO
	{
		public function TrackDBO(conn:SQLConnection, dbManager:DBManger)
		{
			super(conn, "track", "trackid", dbManager);
		}
		
		public function get(id:int):Track{
			return convertPlainObjectToTrack(baseGet(id));
		}
		
		
		private function convertPlainObjectToTrack(obj:Object):Track
		{
			var result:Track = new Track();
			
			result.trackid = obj.trackid;
			result.title = obj.title;
			
			return result;
		}	
		
	}
}