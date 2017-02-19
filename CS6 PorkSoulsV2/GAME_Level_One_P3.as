package  
{
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	public class GAME_Level_One_P3 extends SCRIPT_Scene_Class {
		
		
		public function GAME_Level_One_P3() {
			
			trace("GAME_Level_One_P3 constructor");

			SCRIPT_Game_Manager.getInstance().stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			
		}
		
		
		override public function OnLeaveScene()	{
			
			trace("leaving GAME_Level_One_P3 scene");
			
			removeChildren();
			
			this.removeEventListener(MouseEvent.CLICK, onClick);
			
			SCRIPT_Game_Manager.getInstance().stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			
		}
		
		public function onClick(e:MouseEvent) {
			
			trace("Game scene onClick");
			SCRIPT_Game_Manager.getInstance().GoToScene("HOME_SCREEN");
			
		}
		
		public function keyDown(e:KeyboardEvent) {
			
			trace(e.keyCode);
			
		}

	}
	
}