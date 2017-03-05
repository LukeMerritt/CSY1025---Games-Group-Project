﻿package  
{
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.display.StageDisplayState;
	
	public class GAME_Options extends SCRIPT_Scene_Class {
		
		
		public function GAME_Options() {
			
			trace("GAME_Options constructor");
			
			SCRIPT_Game_Manager.getInstance().stage.displayState = StageDisplayState.FULL_SCREEN;

			SCRIPT_Game_Manager.getInstance().stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			
		}
		
		
		override public function OnLeaveScene()	{
			
			trace("leaving GAME_Options scene");
			
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