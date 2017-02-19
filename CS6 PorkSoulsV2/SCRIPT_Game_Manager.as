package  
{
	
	//PACKAGE IMPORTING.
	
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	public class SCRIPT_Game_Manager extends MovieClip {
		
		public static var instance:SCRIPT_Game_Manager = null;
		public var curScene:SCRIPT_Scene_Class = null;
		
		public function SCRIPT_Game_Manager() {
			
			// constructor code
			
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStage);
			
		}
		
		public function addedToStage(e:Event) {
			
			GoToScene("HOME_SCREEN");
			
		}
		
		public function GoToScene(name:String) {
			
			if (curScene) {
			
				curScene.OnLeaveScene();
			
				removeChild(curScene);
			
			}
			
			if(name=="HOME_SCREEN") curScene = new SCRIPT_Home_Screen();
			if(name=="CREDITS_SCREEN") curScene = new GAME_Credits();
			
			if(name=="LEVEL_ONE_PART_ONE") curScene = new GAME_Level_One_P1();
				if(name=="LEVEL_ONE_PART_TWO") curScene = new GAME_Level_One_P2();
					if(name=="LEVEL_ONE_PART_THREE") curScene = new GAME_Level_One_P3();
			
			//if(name=="LEVEL_TWO_PART_ONE") curScene = new GAME_Level_Two_P1();
				//if(name=="LEVEL_TWO_PART_TWO") curScene = new GAME_Level_Two_P2();
					//if(name=="LEVEL_TWO_PART_THREE") curScene = new GAME_Level_Two_P3();
			
			//if(name=="LEVEL_THREE_PART_ONE") curScene = new GAME_Level_Three_P1();
				//if(name=="LEVEL_THREE_PART_TWO") curScene = new GAME_Level_Three_P2();
					//if(name=="LEVEL_THREE_PART_THREE") curScene = new GAME_Level_Three_P3();
			
			if(name=="OPTIONS_SCREEN") curScene = new GAME_Options();
			addChild(curScene);
			
		}
		
		public static function getInstance():SCRIPT_Game_Manager {
			
			if (instance==null) {
				
				trace("Instance Of Game Manager Is Being Created");
				instance = new SCRIPT_Game_Manager();
				
			}
			return instance;
			
		}
	}
	
}
