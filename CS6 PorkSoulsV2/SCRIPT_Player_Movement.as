package  {
	
	//PACKAGE IMPORTING.
	
	//http://stackoverflow.com/questions/10367411/how-to-do-you-get-an-character-to-jump
	
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.Timer;
    import flash.events.TimerEvent;
	import flash.display.Stage;
	
	public class SCRIPT_Player_Movement extends MovieClip{
		
		public var playerSpeed = 10;
		
		public var GAME_level_one_p1:GAME_Level_One_P1 = new GAME_Level_One_P1();
		//public var myVar:Number = someClass.getSomeVar();
		
		//JUMPING VARIABLES.
		
		public var gravity:Number = 10;
		public var jumping:Boolean = false;
		public var jumpPower:Number = 0;

		public function SCRIPT_Player_Movement() {
			
			// constructor code
			
			trace("Player Movement Class Created");
			
			SCRIPT_Game_Manager.getInstance().stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			SCRIPT_Game_Manager.getInstance().stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			SCRIPT_Game_Manager.getInstance().stage.addEventListener(Event.ENTER_FRAME, updateHandler);
		}
		
		public function keyDownHandler(e:KeyboardEvent) {
			
			trace(e.keyCode);
			
			if (e.keyCode == 37 && this.x !== 918) {
													
				this.x -= playerSpeed;

			}
			
			else if (e.keyCode == 37 && this.x == 918 && frame1.x !<0) {
				
			}
			
			if (e.keyCode == 38) {
				
				if(jumping != true){
					
					jumpPower = -50;
					jumping = true;
				
        		}
								
			}
			
			if (e.keyCode == 39 && this.x !== 918) {
				
				this.x += playerSpeed;

			}
			
			else if (e.keyCode == 37 && this.x !== 918) {
				
			}
			
			if (e.keyCode == 40) {
				
				keyDown = true;				
				
			}
			
		}
		
		public function keyUpHandler(e:KeyboardEvent) {
			
			
			
		}
		
		function updateHandler(evt:Event):void {
			
			if(jumping){
				
				player.y += jumpPower;
				jumpPower += gravity;
		
				if(player.y >= 768){
					
					jumping = false;
					player.y = 768;
					
				}
				
			}
			
		}    

	}
	
}
