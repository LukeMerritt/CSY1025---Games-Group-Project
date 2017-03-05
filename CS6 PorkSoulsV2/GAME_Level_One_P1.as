package  
{
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.display.StageDisplayState;
	import flash.system.fscommand;
	import flash.media.Sound;
	
	import SCRIPT_Player_Movement;
	
	public class GAME_Level_One_P1 extends SCRIPT_Scene_Class {
		
//VARIABLE DECLARATION.

		//AUDIO.
		
		public var gameBackgroundAudio:Sound = new MUSIC_Background(); 

		//BOOLEANS
		
		public var isAtRightEdge = false;
		public var isAtLeftEdge = false;
		
		public var keyUp = false;
		public var keyDown = false;
		public var keyLeft = false;
		public var keyRight = false;
		
		//VARIABLES.
		
		public var scrollSpeed = 10;
		public var playerSpeed = 10;
		
		//HEALTH VARIABLES.
		
		public var h1:HEALTH_1;
		public var h2:HEALTH_2;
		public var h3:HEALTH_3;
		public var h4:HEALTH_4;
		public var h5:HEALTH_5;
		public var h6:HEALTH_6;
		public var h7:HEALTH_7;
		public var h8:HEALTH_8;
		public var h9:HEALTH_9;
		public var h10:HEALTH_10;
		
		//JUMPING VARIABLES.
		
		public var gravity:Number = 10;
		public var jumping:Boolean = false;
		public var jumpPower:Number = 0;
		
		//BUILDING THE SCENE.
		
		public var backdrop:Backdrop;
		public var frame1:Level1P1Frame;
		public var stairs:Stairs;
		
		public var exit:Exit_BUTTON;
		
		//BUILDING THE OBJECTS.
		
		public var box1:InteractionBox;
		public var box2:InteractionBox;
		public var box3:InteractionBox;
		public var box4:InteractionBox;
		public var box5:InteractionBox;
		
		public var inBox:InteractedBox;
		
		//BUILDING THE PLAYERS.
		
		public var player:PLAYER;
		
		public function GAME_Level_One_P1() {
			
//CONSTRUCTOR CODE.
			
			trace("GAME_Level_One_P1 constructor");
			
			SCRIPT_Game_Manager.getInstance().stage.displayState = StageDisplayState.FULL_SCREEN;

			SCRIPT_Game_Manager.getInstance().stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			SCRIPT_Game_Manager.getInstance().stage.addEventListener(KeyboardEvent.KEY_UP, keyUpListener);
			SCRIPT_Game_Manager.getInstance().stage.addEventListener(Event.ENTER_FRAME, enterFrameListener);
			
//AUDIO.
			
			gameBackgroundAudio.play();	
			
			
//VARIABLE TO OBJECT DECLARATION.

			//SCENE OBJECTS.
			
			backdrop = new Backdrop;
				addChild(backdrop);
					backdrop.x = 7;
					backdrop.y = -981;
			
			frame1 = new Level1P1Frame;
				addChild(frame1);
					frame1.x = 0;
					frame1.y = -1080;
			stairs = new Stairs;
				addChild(stairs);
					stairs.x = 2363;
					stairs.y = 104;
						
			//OBJECT, OBJECTS.
			
			box1 = new InteractionBox;
				addChild(box1);
					box1.x = 1460;
					box1.y = 696;
			box2 = new InteractionBox;
				addChild(box2);
					box2.x = 2224;
					box2.y = -383;
			box3 = new InteractionBox;
				addChild(box3);
					box3.x = 1548;
					box3.y = -383;
			box4 = new InteractionBox;
				addChild(box4);
					box4.x = 1548;
					box4.y = -643;
			box5 = new InteractionBox;
				addChild(box5);
					box5.x = 1288;
					box5.y = -383;
			
			inBox = new InteractedBox;
			//addChild(inBox);
					//inBox.x = 0;
					//inBox.y = 0;
					
			//HEALTH BAR.
			
			h1 = new HEALTH_1;
				addChild(h1);
				h1.visible = false;
					
			h2 = new HEALTH_2;
				addChild(h2);
				h2.visible = false;

			h3 = new HEALTH_3;
				addChild(h3);
				h3.visible = false;

			h4 = new HEALTH_4;
				addChild(h4);
				h4.visible = false;

			h5 = new HEALTH_5;
				addChild(h5);
				h5.visible = false;

			h6 = new HEALTH_6;
				addChild(h6);
				h6.visible = false;

			h7 = new HEALTH_7;
				addChild(h7);
				h7.visible = false;

			h8 = new HEALTH_8;
				addChild(h8);
				h8.visible = false;

			h9 = new HEALTH_9;
				addChild(h9);
				h9.visible = false;

			h10 = new HEALTH_10;
				addChild(h10);
				h10.visible = true;
				
			//PLAYER OBJECTS.
			
			player = new PLAYER;
				addChild(player);
					player.x = 356;
					player.y = 850;
					
			//MENU OBJECTS.
			
			exit = new Exit_BUTTON;
				addChild(exit);
					exit.x = 1393;
					exit.y = -46;
						exit.addEventListener(MouseEvent.MOUSE_DOWN, exitButtonClicked);
			
		}
		
		override public function OnLeaveScene()	{
			
			trace("leaving GAME_Level_One_P1 scene");
			
			removeChildren();
			
			this.removeEventListener(MouseEvent.CLICK, onClick);
			
			SCRIPT_Game_Manager.getInstance().stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			SCRIPT_Game_Manager.getInstance().stage.removeEventListener(KeyboardEvent.KEY_UP, keyDownHandler);
			
		}
		
		public function onClick(e:MouseEvent) {
			
			trace("Game scene onClick");
			SCRIPT_Game_Manager.getInstance().GoToScene("HOME_SCREEN");
			
		}
		
//ENTER FRAME LISTENER.
		
		public function enterFrameListener(e:Event) {
						
			if (player.hitTestObject(stairs) && keyUp == true) {
				
				frame1.y = 0;
				stairs.y = 1185;
				trace("hit");
				
			}
			
			if(jumping){
				
				player.y += jumpPower;
				jumpPower += gravity;
		
				if(player.y >= 850){
					
					jumping = false;
					player.y = 850;
					
				}
				
			}
						
		}
		
//SCROLLING METHODS.
				
		public function itemsLeft() {
			
			backdrop.x -= scrollSpeed;
			frame1.x -= scrollSpeed;
			stairs.x -= scrollSpeed;
			box1.x -= scrollSpeed;
			box2.x -= scrollSpeed;
			box3.x -= scrollSpeed;
			box4.x -= scrollSpeed;
			box5.x -= scrollSpeed;
			
		}
		
		public function itemsRight() {
			
			backdrop.x += scrollSpeed;
			frame1.x += scrollSpeed;
			stairs.x += scrollSpeed;
			box1.x += scrollSpeed;
			box2.x += scrollSpeed;
			box3.x += scrollSpeed;
			box4.x += scrollSpeed;
			box5.x += scrollSpeed;
			
		}
		
		public function keyUpListener(e:KeyboardEvent) {
			
			
			
		}
		
//KEY DOWN METHODS.
		
		public function keyDownHandler(e:KeyboardEvent) {
			
			trace(e.keyCode);
			
			if (e.keyCode == 37 || e.keyCode == 65 && player.x !== 918) {
													
				player.x -= playerSpeed;

			}
			
			else if (e.keyCode == 37 || e.keyCode == 65 && player.x == 918) {
				
				frame1.x -= playerSpeed;
				
			}
			
			if (e.keyCode == 38 || e.keyCode == 87) {
				
				if(jumping != true){
					
					jumpPower = -50;
					jumping = true;
				
        		}
								
			}
			
			if (e.keyCode == 39 || e.keyCode == 68 && this.x !== 918) {
				
				player.x += playerSpeed;

			}
			
			else if (e.keyCode == 39 || e.keyCode == 68 && this.x == 918) {
				
				frame1.x += playerSpeed;
				
			}
			
			if (e.keyCode == 40 || e.keyCode == 83) {
				
				keyDown = true;				
				
			}
			
		}
		
		public function exitButtonClicked(e:MouseEvent) {
							
      		//fscommand("quit");
			SCRIPT_Game_Manager.getInstance().GoToScene("HOME_SCREEN");
						
		}
		

	}
	
}