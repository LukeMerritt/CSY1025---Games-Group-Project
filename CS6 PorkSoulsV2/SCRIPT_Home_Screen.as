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
	
	public class SCRIPT_Home_Screen extends SCRIPT_Scene_Class {
		
		public var playButton:PLAYBUTTON;
		public var optionsButton:OPTIONSBUTTON;
		public var creditsButton:CREDITSBUTTON;
		
		public function SCRIPT_Home_Screen() {
 			
			//Constructor code
									
			//VARIABLE TO OBJECT DECLARATION.
			
			playButton = new PLAYBUTTON;
				addChild (playButton);
					playButton.x = 100;
					playButton.y = 100;
						playButton.addEventListener(MouseEvent.MOUSE_DOWN, playButtonClicked);
			
			optionsButton = new OPTIONSBUTTON;
				addChild (optionsButton);
					optionsButton.x = 400;
					optionsButton.y = 36;
						optionsButton.addEventListener(MouseEvent.MOUSE_DOWN, optionsButtonClicked);
			
			creditsButton = new CREDITSBUTTON;
				addChild (creditsButton);
					creditsButton.x = 950;
					creditsButton.y = 36;
						creditsButton.addEventListener(MouseEvent.MOUSE_DOWN, creditsButtonClicked);
	
		}

		override public function OnLeaveScene() {
			
			trace("Leaving Menu Scene");
			
			removeChildren();
			
			this.removeEventListener(MouseEvent.CLICK, playButtonClicked);
			this.removeEventListener(MouseEvent.CLICK, optionsButtonClicked);
			this.removeEventListener(MouseEvent.CLICK, creditsButtonClicked);
			
		}
		
		public function playButtonClicked(e:MouseEvent) {
			
			trace("Play Button Clicked");
						
			SCRIPT_Game_Manager.getInstance().GoToScene("LEVEL_ONE_PART_ONE");
			
		}
		
		public function optionsButtonClicked(e:MouseEvent) {
			
			trace("Options Button Clicked");
						
			SCRIPT_Game_Manager.getInstance().GoToScene("options");
						
		}
		
		public function creditsButtonClicked(e:MouseEvent) {
			
			trace("Credit Button Clicked");
			
			SCRIPT_Game_Manager.getInstance().GoToScene("credits");
						
		}
		
		public function keyDown(e:KeyboardEvent) {
			
			trace(e.keyCode);
			
		}
		
	}
	
}
