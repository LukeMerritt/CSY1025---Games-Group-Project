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
		
		public var part1Background: Level1Part1Background;
						
		public var PlayerSpeed = 4;
		
		public var lowerLimit:int = 3;
		public var upperLimit:int = 1289;
		
			//Object variables
		
		public var singleCrate: CrateImage;
		public var mediumCrate: MediumCrateStack;
		public var largeCrate: LargeCrateStack;
		public var jumpCrate1: JumpCrate;
		public var jumpCrate2: JumpCrate;
		public var haybale: HaybaleImage;
		public var hiddenHaybale: HiddenInHaybaleImage;
		public var spring: SpringPadImage;
		public var light1: Light;
		public var light2: Light;
		public var light3: Light;
		public var platformCover: PlatformCover;
		
			//Collectables
		
		public var lockedCage: ClosedCageImage;
		public var openCage: OpenCageImage;
		public var key: KeyImage;
		
			//Player
		
		public var lincolnPork: LincolnPork;
		
		public function Level1Class() 
		{
			// constructor code.
			
			GameManagerClass.getInstance().stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownListener);
		
			GameManagerClass.getInstance().stage.addEventListener(KeyboardEvent.KEY_UP, keyUpListener);
						
			GameManagerClass.getInstance().stage.addEventListener(Event.ENTER_FRAME, enterFrameListener);
			
			//Initialising variables
			
			part1Background = new Level1Part1Background;
			lincolnPork = new LincolnPork;
			
			//Adding children from the parent variables
			
			addChild(part1Background);
			
			addChild(lincolnPork);
				lincolnPork.x = 47;
				lincolnPork.y = 667;
				
				//Object variables
			
			singleCrate = new CrateImage;
				addChild(singleCrate);
					singleCrate.x = 1037;
					singleCrate.y = 612;
					
			mediumCrate = new MediumCrateStack;
			largeCrate = new LargeCrateStack;
			
			jumpCrate1 = new JumpCrate;
				addChild(jumpCrate1);
					jumpCrate1.x = 1164;
					jumpCrate1.y = 686;
					
			jumpCrate2 = new JumpCrate;
				addChild(jumpCrate2);
					jumpCrate2.x = 805;
					jumpCrate2.y = 686;
					
			haybale = new HaybaleImage;
			
			hiddenHaybale = new HiddenInHaybaleImage;
			spring = new SpringPadImage;
			
			light1 = new Light;
				addChild(light1)
					light1.x = 77;
					light1.y = 201;
						light1.alpha=.5;
			light2 = new Light;
				addChild(light2)
					light2.x = 837;
					light2.y = 201;
						light2.alpha=.5;
			light3 = new Light;
				addChild(light3)
					light3.x = 837;
					light3.y = 482;	
						light3.alpha=.5;
						
			platformCover = new PlatformCover;
				addChild(platformCover);
					platformCover.x = 0;
					platformCover.y = 198;
			
				//Collectables
			
			lockedCage: ClosedCageImage;
			openCage: OpenCageImage;
			key: KeyImage;
				
			
										
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
		
		public function keyDownListener(e:KeyboardEvent)
		{
			
			trace ("X Location is " + this.x);
			trace ("Y Location is " + this.y);
			
			trace ("Key " + e.keyCode + " Pressed");
			
			//Player Movement...
						
			if (e.keyCode == 37)
			{
					
				lincolnPork.x -= PlayerSpeed;
					
				//this.gotoAndPlay()
					
			}
				
			if (e.keyCode == 38)
			{
					
				//Needs upwards interaction.
								
				if (lincolnPork.x >= 300 && lincolnPork.x <= 400 && lincolnPork.y > 600)
				{
					
					lincolnPork.x = 832;
					lincolnPork.y = 393;
					
					trace("Player can go UP!");
					
				}
					
			}
				
			if (e.keyCode == 39)
			{
					
				lincolnPork.x += PlayerSpeed;
					
				//this.gotoAndPlay()
					
			}
				
			if (e.keyCode == 40)
			{
					
				//Needs downwards interaction.
				
				if (lincolnPork.x >= 620 && lincolnPork.x <= 700 && lincolnPork.y < 400)
				{
					
					lincolnPork.x = 283;
					lincolnPork.y = 667;
					
					trace("Player can go DOWN!");
					
				}
					
			}
			
			if (lincolnPork.x >= upperLimit)
			{
					 
				trace("Player on 'Upper Limit'");
				lincolnPork.x -= 4;
					 
		    }
			if (lincolnPork.x <= lowerLimit)
			{
					 
				trace("Player on 'Lower Limit'");
				lincolnPork.x += 4;
					 
			}
						
		}
		
		public function keyUpListener(e:KeyboardEvent)
		{
			
			trace ("Key " + e.keyCode + " Released");
			
			lincolnPork.stop();
			
		}
		
		public function enterFrameListener(e:Event)
		{
			
			if (lincolnPork.hitTestObject(jumpCrate2) && !jumpCrate2.hitTestObject(singleCrate))
			{
				
				trace("Player moving crate");
				
				jumpCrate2.x += PlayerSpeed;
				
			}
			
			if (lincolnPork.hitTestObject(jumpCrate2) && jumpCrate2.hitTestObject(singleCrate))
			{
				
				trace("Upwards animation");
								
			}
			
			if (lincolnPork.y < 395)
			{
				
				platformCover.x = 0;
				platformCover.y = 484;
				
			}
			
			if (lincolnPork.y > 395)
			{
				
				platformCover.x = 0;
				platformCover.y = 198;
				
			}
			
		}

	}
	
}
