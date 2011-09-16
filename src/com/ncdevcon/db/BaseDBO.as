package com.ncdevcon.db
{
	import flash.data.SQLConnection;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	
	import mx.collections.ArrayCollection;

	public class BaseDBO
	{
		
		public var tableName:String;
		public var idField:String
		public var dbManager:DBManger;
		private var _conn:SQLConnection
		
		public function BaseDBO(conn:SQLConnection, table:String, idField:String, dbManager:DBManger)
		{
			_conn = conn;
			this.tableName = table;
			this.idField = idField;
			this.dbManager = dbManager;
		}
		
		public function get conn():SQLConnection{
			return _conn;
		}
		
		public function list(orderBy:String =""):ArrayCollection{
			var query:String = "";
			
			query = "SELECT * FROM " +  tableName;
			
				if (orderBy.length > 0){
			
					query = query + " ORDER BY " + orderBy;
			
				}	
			var sqlSelect:SQLStatement = new SQLStatement();
			sqlSelect.sqlConnection = _conn;
			
			sqlSelect.text = query;
			sqlSelect.execute();
			var result:SQLResult =  sqlSelect.getResult();
			
			
			var ac:ArrayCollection = new ArrayCollection();
			if (result.data != null){
				for (var i:int = 0; i < result.data.length; i++){
					var obj:Object = convertPlainObjectToTyped(result.data[i]);
					ac.addItem(obj);
				}
			}
			return ac;
			
		}
		
		public function baseGet(id:int):Object{
			var query:String = "";
			
			query = "SELECT * FROM " +  tableName + 
				" WHERE " + idField + " = :id";
			trace(query)
			
			var sqlSelect:SQLStatement = new SQLStatement();
			sqlSelect.sqlConnection = _conn;
			sqlSelect.parameters[":id"] = id;
			
			sqlSelect.text = query;
			sqlSelect.execute();
			var result:SQLResult =  sqlSelect.getResult();
			
			
			return result.data[0];
		}
		
		
		private function convertPlainObjectToTyped(obj:Object):Object
		{
			return obj;
		}
		
	}
}