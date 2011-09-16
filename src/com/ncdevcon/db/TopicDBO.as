package com.ncdevcon.db
{
	import com.ncdevcon.vo.Slot;
	import com.ncdevcon.vo.Speaker;
	import com.ncdevcon.vo.Topic;
	import com.ncdevcon.vo.Track;
	
	import flash.data.SQLConnection;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	
	import mx.collections.ArrayCollection;
	
	public class TopicDBO extends BaseDBO
	{
		public function TopicDBO(conn:SQLConnection, dbManager:DBManger)
		{
			super(conn, "topic", "topicid", dbManager);
		}
		
		public function listBySlot(slot:Slot):ArrayCollection{
			var query:String = "";
			
			query = "SELECT * FROM topic WHERE slot = :slotid ORDER BY track";
			
			var sqlSelect:SQLStatement = new SQLStatement();
			sqlSelect.sqlConnection = conn;
			sqlSelect.parameters[":slotid"] = slot.slotid;
			sqlSelect.text = query;
			sqlSelect.execute();
			var result:SQLResult =  sqlSelect.getResult();
			
			
			var ac:ArrayCollection = new ArrayCollection();
			if (result.data != null){
				for (var i:int = 0; i < result.data.length; i++){
					var obj:Object = convertPlainObjectToTopic(result.data[i]);
					ac.addItem(obj);
				}
			}
			return ac;
			
		}
		
		public function listByTrack(track:Track):ArrayCollection{
			var query:String = "";
			
			query = "SELECT * FROM topic WHERE track = :trackid ORDER BY slot";
			
			var sqlSelect:SQLStatement = new SQLStatement();
			sqlSelect.sqlConnection = conn;
			sqlSelect.parameters[":trackid"] = track.trackid;
			sqlSelect.text = query;
			sqlSelect.execute();
			var result:SQLResult =  sqlSelect.getResult();
			
			
			var ac:ArrayCollection = new ArrayCollection();
			if (result.data != null){
				for (var i:int = 0; i < result.data.length; i++){
					var obj:Object = convertPlainObjectToTopic(result.data[i]);
					ac.addItem(obj);
				}
			}
			return ac;
			
		}
		
		public function listBySpeaker(speaker:Speaker):ArrayCollection{
			var query:String = "";
			
			query = "SELECT * FROM topic WHERE speaker = :speakerid ORDER BY slot";
			
			var sqlSelect:SQLStatement = new SQLStatement();
			sqlSelect.sqlConnection = conn;
			sqlSelect.parameters[":speakerid"] = speaker.speakerid;
			sqlSelect.text = query;
			sqlSelect.execute();
			var result:SQLResult =  sqlSelect.getResult();
			
			
			var ac:ArrayCollection = new ArrayCollection();
			if (result.data != null){
				for (var i:int = 0; i < result.data.length; i++){
					var obj:Object = convertPlainObjectToTopic(result.data[i]);
					ac.addItem(obj);
				}
			}
			return ac;
			
		}
		
		
		
		private function convertPlainObjectToTopic(obj:Object):Topic{
			var result:Topic = new Topic();
			
			result.topicid = obj.topicid;
			result.title = obj.title;
			result.description = obj.description;
			result.speaker = dbManager.speakerDBO.get(obj.speaker);
			result.slot = dbManager.slotDBO.get(obj.slot);
			result.track = dbManager.trackDBO.get(obj.track);
			
			return result;
			
		}
	}
}