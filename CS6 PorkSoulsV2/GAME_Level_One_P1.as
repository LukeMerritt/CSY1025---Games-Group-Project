package  
{
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	import SCRIPT_Player_Movement;
	
	public class GAME_Level_One_P1 extends SCRIPT_Scene_Class {
		
//VARIABLE DECLARATION.

		//BOOLEANS
		
		public var isAtRightEdge = false;
		public var isAtLeftEdge = false;
		
		public var keyUp = false;
		public var keyDown = false;
		
		//VARIABLES.
		
		public var scrollSpeed = 10;
		public var playerSpeed = 10;
		
		//BUILDING THE SCENE.
		
		public var backdrop:Backdrop;
		public var frame1:Level1P1Frame;
		public var stairs:Stairs;
		
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

			SCRIPT_Game_Manager.getInstance().stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			SCRIPT_Game_Manager.getInstance().stage.addEventListener(KeyboardEvent.KEY_UP, keyUpListener);
			SCRIPT_Game_Manager.getInstance().stage.addEventListener(Event.ENTER_FRAME, enterFrameListener);
			
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
					box5.y = 383;
			
			inBox = new InteractedBox;
			//addChild(inBox);
					//inBox.x = 0;
					//inBox.y = 0;
			
			//PLAYER OBJECTS.
			
			player = new PLAYER;
				addChild(player);
					player.x = 356;
					player.y = 850;
			
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
			
			//trace(player.x);
			
			if (frame1.x >= -1920 && player.x >= 1320) {
				
				trace ("scroll");
				itemsLeft();
			}
			
			if (!frame1.x <= 0 && player.x <= 600) {
				
				itemsRight();
				
			}
			
			if (player.hitTestObject(stairs) && keyUp == true) {
				
				frame1.y = 0;
				stairs.y = 1185;
				trace("hit");
				
			}
			
			if (player.x <= 126 || player.x >= 1676) {
				
				//
				if (player.x <= 126) {
					
					player.x += 10;
					
				}
				
				else if (player.x >= 1676){
					
					player.x -= 10;
					
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
			
			if (e.keyCode == 37 || e.keyCode == 65) {
													
				player.x -= playerSpeed;

			}
			
			if (e.keyCode == 38 || e.keyCode == 87) {
				
				keyUp = true;
								
			}
			
			if (e.keyCode == 39 || e.keyCode == 68) {
				
				player.x += playerSpeed;

			}
			
			if (e.keyCode == 40 || e.keyCode == 83) {
				
				keyDown = true;				
				
			}
			
		}
		

	}
	
}