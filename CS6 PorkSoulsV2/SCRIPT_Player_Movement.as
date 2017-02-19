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
		public var playerGravity:Number = 10;
		public var playerJumping:Boolean = false;
		public var playerJumpPower:Number = 0;

		public function SCRIPT_Player_Movement() {
			
			// constructor code
			
			trace("Player Movement Class Created");
			
			SCRIPT_Game_Manager.getInstance().stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			SCRIPT_Game_Manager.getInstance().stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			SCRIPT_Game_Manager.getInstance().stage.addEventListener(Event.ENTER_FRAME, updateHandler);
		}
		
		public function keyDownHandler(e:KeyboardEvent) {
			
			trace(e.keyCode);
			
			if (e.keyCode == 37) {
													
				this.x -= playerSpeed;

			}
			
			if (e.keyCode == 38) {
				
				keyUp = true;
								
			}
			
			if (e.keyCode == 39) {
				
				this.x += playerSpeed;

			}
			
			if (e.keyCode == 40) {
				
				keyDown = true;				
				
			}
			
		}
		
		public function keyUpHandler(e:KeyboardEvent) {
			
			
			
		}
		
		function updateHandler(evt:Event):void {
			if(playerJumping) {
				
				this.y += playerJumpPower;
				playerJumpPower += playerGravity;

				if(this.y >= stage.stageHeight) {
					
					playerJumping = false;
					this.y = stage.stageHeight;
					
				}
				
				if (this.y <= 960) {
					
					playerJumping = false;
					
				}
					
			}
			
		}    

	}
	
}
