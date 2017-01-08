package  
{
	
	//Import packages
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.net.URLLoader;  
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.display.SimpleButton;
	
	public class Level1Class extends SceneClass
	{
		
		//Declairing variables
		
			//Background / Scene
		
		public var lvl1Background: BasicBG;
		public var room1Cover: Room1CoverImage;
		public var room2Cover: Room2CoverImage;
		public var room3Cover: Room3CoverImage;
		public var room4Cover: Room4CoverImage;
		public var room5Cover: Room5CoverImage;
		public var bossRoomCover: BossRoomCover;
		public var bossRoom: BossRoomImage;
		public var sceneMeat: HangingMeatImage;
		
			//Object variables
		
		public var crateJumpObstacle: CrateJumpObstacle;
		public var singleCrate: CrateImage;
		public var smallCrate: SmallCrateStack;
		public var mediumCrate: MediumCrateStack;
		public var largeCrate: LargeCrateStack;
		public var haybale: HaybaleImage;
		public var hiddenHaybale: HiddenInHaybaleImage;
		public var spring: SpringPadImage;
		public var stairs: StairsImage;
		public var oppositeStairs: OppositeStairsImage;
		public var stairSeperator: StairSeperatorImage;
		public var light: LightImage;
		public var lightEffect: LightEffectImage;
		
			//Collectables
		
		public var lockedCage: ClosedCageImage;
		public var openCage: OpenCageImage;
		public var key: KeyImage;
		//public var pig1: Pig1
		
			//Player
		
		public var lincolnPork: LincolnPork;
		
		public function Level1Class() 
		{
			// constructor code.
			
			//Initialising variables
			
			lvl1Background = new BasicBG;
			lincolnPork = new LincolnPork;
			
			//Adding children from the parent variables
			
			addChild(lvl1Background);
			
			addChild(lincolnPork);
				lincolnPork.x = 200;
				lincolnPork.y = 200;
						
		}
		
		override public function OnLeaveScene()
		{
			
			trace("leaving Game scene");
			
			removeChildren();
			
			this.removeEventListener(MouseEvent.CLICK, onClick);
			
			GameManagerClass.getInstance().stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			GameManagerClass.getInstance().stage.removeEventListener(Event.ENTER_FRAME, enterFrameListener);
			
		}
		
		public function onClick(e:MouseEvent)
		{
			
			trace("Game scene onClick");
			
			GameManagerClass.getInstance().GoToScene("menu");
			
		}
		
		public function keyDown(e:KeyboardEvent)
		{
			
		}
		
		public function enterFrameListener(e:Event)
		{
			
		}

	}
	
}
