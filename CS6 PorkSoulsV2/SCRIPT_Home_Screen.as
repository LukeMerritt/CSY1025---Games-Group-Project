package  
{
	
	//TODO LIST.
	/*
			1. REPLACE ALL PLACEHOLDERS.
			2. PLAY, OPTIONS, CREDITS IMAGES ARE FUNCTION BUTTONS WITH STATES.
	*/
	
	
	//PACKAGE IMPORTING.
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.display.SimpleButton;
	import flash.system.fscommand;
	import flash.display.StageDisplayState;
	
	public class SCRIPT_Home_Screen extends SCRIPT_Scene_Class {
		
		public var logo_ASSET:Logo_ASSET;
		
		public var play_BUTTON:Play_BUTTON;
		public var options_BUTTON:Options_BUTTON;
		public var leaderboard_BUTTON:Leaderboard_BUTTON;
		public var exit_BUTTON:Exit_BUTTON;

		
		public function SCRIPT_Home_Screen() {
 			
			//Constructor code
			
			SCRIPT_Game_Manager.getInstance().stage.displayState = StageDisplayState.FULL_SCREEN;
									
			//VARIABLE TO OBJECT DECLARATION.
			
			logo_ASSET = new Logo_ASSET;
				addChild (logo_ASSET);
					logo_ASSET.x = 248;
					logo_ASSET.y = 0;
						
			play_BUTTON = new Play_BUTTON;
				addChild(play_BUTTON);
					play_BUTTON.x = 682;
					play_BUTTON.y = 337;
					play_BUTTON.addEventListener(MouseEvent.MOUSE_DOWN, playButtonClicked)
			
			options_BUTTON = new Options_BUTTON;
				addChild (options_BUTTON);
					options_BUTTON.x = 481;
					options_BUTTON.y = 487;
						options_BUTTON.addEventListener(MouseEvent.MOUSE_DOWN, optionsButtonClicked);
			
			leaderboard_BUTTON = new Leaderboard_BUTTON;
				addChild (leaderboard_BUTTON);
					leaderboard_BUTTON.x = 298;
					leaderboard_BUTTON.y = 641;
						leaderboard_BUTTON.addEventListener(MouseEvent.MOUSE_DOWN, leaderboardButtonClicked);
			
			exit_BUTTON = new Exit_BUTTON;
				addChild (exit_BUTTON);
					exit_BUTTON.x = 645;
					exit_BUTTON.y = 819;
						exit_BUTTON.addEventListener(MouseEvent.MOUSE_DOWN, exitButtonClicked);
			
	
		}

		override public function OnLeaveScene() {
			
			trace("Leaving Menu Scene");
			
			removeChildren();
			
			this.removeEventListener(MouseEvent.CLICK, playButtonClicked);
			this.removeEventListener(MouseEvent.CLICK, optionsButtonClicked);
			this.removeEventListener(MouseEvent.CLICK, leaderboardButtonClicked);
			this.removeEventListener(MouseEvent.CLICK, exitButtonClicked);
			
		}
		
		public function playButtonClicked(e:MouseEvent) {
			
			trace("Play Button Clicked");
						
			SCRIPT_Game_Manager.getInstance().GoToScene("LEVEL_ONE_PART_ONE");
			
		}
		
		public function optionsButtonClicked(e:MouseEvent) {
			
			trace("Options Button Clicked");
						
			SCRIPT_Game_Manager.getInstance().GoToScene("OPTIONS_SCREEN");
						
		}
		
		public function leaderboardButtonClicked(e:MouseEvent) {
			
			trace("Leaderboard Button Clicked");
			
			SCRIPT_Game_Manager.getInstance().GoToScene("LEADERBOARD_SCREEN");
						
		}
		
		public function exitButtonClicked(e:MouseEvent) {
							
      		fscommand("quit");
						
		}
		
		public function keyDown(e:KeyboardEvent) {
			
			trace(e.keyCode);
			
		}
		
	}
	
}
