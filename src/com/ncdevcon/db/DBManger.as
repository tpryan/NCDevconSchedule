package com.ncdevcon.db
{
	import flash.data.SQLConnection;
	import flash.errors.SQLError;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.filesystem.File;

	[Event(name="loaded", type="flash.events.Event")]
	
	public class DBManger extends EventDispatcher
	{
		private var _speakerDBO:SpeakerDBO;
		private var _topicDBO:TopicDBO;
		private var _dbFile:File;
		private var _slotDBO:SlotDBO;
		private var _trackDBO:TrackDBO;
		private var _conn:SQLConnection = new SQLConnection();
		
		public function DBManger(dbFile:File) 
		{
			_dbFile = dbFile;
			
			try
			{
				_conn.open(_dbFile);
				_slotDBO = new SlotDBO(_conn, this);
				_speakerDBO = new SpeakerDBO(_conn, this);
				_topicDBO = new TopicDBO(_conn, this);
				_trackDBO = new TrackDBO(_conn, this);
				onLoadComplete();
				
			}
			catch (error:SQLError)
			{
				trace("Error opening database");
				trace("error.message:", error.message);
				trace("error.details:", error.details);
				return;
			}
			
			
		}

		public function get trackDBO():TrackDBO
		{
			return _trackDBO;
		}

		public function set trackDBO(value:TrackDBO):void
		{
			_trackDBO = value;
		}

		public function get topicDBO():TopicDBO
		{
			return _topicDBO;
		}

		public function set topicDBO(value:TopicDBO):void
		{
			_topicDBO = value;
		}

		public function get speakerDBO():SpeakerDBO
		{
			return _speakerDBO;
		}

		public function set speakerDBO(value:SpeakerDBO):void
		{
			_speakerDBO = value;
		}

		public function get slotDBO():SlotDBO
		{
			return _slotDBO;
		}

		public function set slotDBO(value:SlotDBO):void
		{
			_slotDBO = value;
		}
		
		public function onLoadComplete():void {
			dispatchEvent(new Event("loaded",true));
		}

	}
}