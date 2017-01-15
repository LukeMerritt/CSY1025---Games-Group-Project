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
	import fl.transitions.*;
	import fl.transitions.easing.*;
	
	public class Level1Class extends SceneClass
	{
		
		//Declairing variables
		
			//Tasks
			
		public var startedTaskOne: Boolean = true;
		public var finishedTaskOne: Boolean = false;
		
		public var task1Text: Task1Text;
		
			//Background / Scene
		
		public var part1Background: Level1Part1Background;
		public var part2Background: Level1Part2Background;
		
		public var onFirstScene: Boolean = true;
		public var onSecondScene: Boolean = false;
		public var onThirdScene: Boolean = false;
		public var crateAnimation:Boolean = false;
						
		public var PlayerSpeed = 4;
		
		public var pushSpeed = 5;
		
		public var lowerLimit:int = 3;
		public var upperLimit:int = 1289;
		
			//Object variables
		
		public var smallCrate: SmallCrate;
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
		
			//Game menu
			
		public var healthImage1: Health;
		public var noHealthImage1: LostHealth;
		public var healthImage2: Health;
		public var noHealthImage2: LostHealth;
		public var healthBox: HealthBoxMeat;
		public var textBox: TextBoxMeat;
		public var playerFace: PigFace;
		
			//Collectables
		
		public var lockedCage: ClosedCageImage;
		public var openCage: OpenCageImage;
		public var key: KeyImage;
		
			//Players
		
		public var lincolnPorkRight: LincolnPorkRight;
		public var lincolnPorkLeft: LincolnPorkLeft;
		
		public var lincolnNotification: InteractionNotification;
		
		public var meatGrinder: MeatGrinder;
		public var grinderSwitch: GrinderSwitch;
		public var meatBall: MeatballShot;
		
		public function Level1Class() 
		{
			// constructor code.
			
			GameManagerClass.getInstance().stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownListener);
		
			GameManagerClass.getInstance().stage.addEventListener(KeyboardEvent.KEY_UP, keyUpListener);
						
			GameManagerClass.getInstance().stage.addEventListener(Event.ENTER_FRAME, enterFrameListener);
			
			//Initialising variables
			
			part1Background = new Level1Part1Background;
			part2Background = new Level1Part2Background;
			
			lincolnPorkRight = new LincolnPorkRight;	
			lincolnPorkLeft = new LincolnPorkLeft;	
			
			meatGrinder = new MeatGrinder;
			grinderSwitch = new GrinderSwitch;
			meatBall = new MeatballShot;
			
			healthImage1 = new Health;
			noHealthImage1 = new LostHealth;
			healthImage2 = new Health;
			noHealthImage2 = new LostHealth;
			healthBox = new HealthBoxMeat;
			textBox = new TextBoxMeat;
			
			playerFace = new PigFace;
				playerFace.addEventListener(MouseEvent.CLICK, displayMenuListener);
			
			task1Text = new Task1Text;
			
			//Adding children from the parent variables
			
			addChild(part1Background);
			
			addChild(part2Background);
				part2Background.y = 900;			
			
			addChild(part2Background);
				part2Background.x = 0;
				part2Background.y = 900;
			
			addChild(lincolnPorkRight);
				lincolnPorkRight.x = 47;
				lincolnPorkRight.y = 667;
				
			addChild(lincolnPorkLeft);
				lincolnPorkLeft.x = -1000;
				lincolnPorkLeft.y = -1000;
							
				//Object variables
			
			singleCrate = new CrateImage;
				addChild(singleCrate);
					singleCrate.x = 1037;
					singleCrate.y = 612;
					
			smallCrate = new SmallCrate;
				addChild(smallCrate);
					smallCrate.x = 1000;
					smallCrate.y = 1000;
					
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
					
			lincolnNotification = new InteractionNotification;
				addChild(lincolnNotification);
						lincolnNotification.x = -100;
						lincolnNotification.y = -100;	
			
				//Collectables
			
			lockedCage: ClosedCageImage;
			openCage: OpenCageImage;
			key: KeyImage;
			
			//Initialise task 1.
			
			TaskOne()
				
			
										
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
			
			// Basic trace commant to allow exact location notifications.
			
			trace ("X Location is " + this.x);
			trace ("Y Location is " + this.y);
			
			trace ("Key " + e.keyCode + " Pressed");
			
			//Player Movement...
						
			if (e.keyCode == 37)
			{
				
				lincolnPorkLeft.x = lincolnPorkRight.x;
				lincolnPorkLeft.y = lincolnPorkRight.y;
				lincolnPorkRight.visible = false;
									
				lincolnPorkRight.x -= PlayerSpeed;
					
				//this.gotoAndPlay()
					
			}
			
			if (e.keyCode == 39)
			{
				
				lincolnPorkLeft.x = -1000;
				lincolnPorkLeft.y = -1000;
				lincolnPorkRight.visible = true;
				
				lincolnPorkRight.x += PlayerSpeed;
					
				//this.gotoAndPlay()
					
			}
			
			
			//Player movement for stairs.
				
			if (e.keyCode == 38)
			{
					
				//Needs upwards interaction.
								
				if (lincolnPorkRight.x >= 300 && lincolnPorkRight.x <= 400 && lincolnPorkRight.y > 600)
				{
					
					lincolnPorkRight.x = 832;
					lincolnPorkRight.y = 393;
					
					trace("Player can go UP!");
					
				}
				
				if (lincolnPorkLeft.x >= 300 && lincolnPorkLeft.x <= 400 && lincolnPorkLeft.y > 600)
				{
					
					lincolnPorkRight.x = 832;
					lincolnPorkRight.y = 393;
					
					trace("Player can go UP!");
					
				}
				
				if (crateAnimation == true)
				{
					
					trace("Trasitioned");
					
					lincolnPorkRight.x += 530;
					
				}
					
			}
				
				
			if (e.keyCode == 40)
			{
					
				//Needs downwards interaction.
				
				if (lincolnPorkLeft.x >= 620 && lincolnPorkLeft.x <= 700 && lincolnPorkLeft.y < 400)
				{
					
					lincolnPorkRight.x = 283;
					lincolnPorkRight.y = 667;
					
					trace("Player can go DOWN!");
					
				}
				
				if (lincolnPorkRight.x >= 620 && lincolnPorkRight.x <= 700 && lincolnPorkRight.y < 400)
				{
					
					lincolnPorkRight.x = 283;
					lincolnPorkRight.y = 667;
					
					trace("Player can go DOWN!");
					
				}
					
			}
			
			//Allows player to stay on the stage or move to next scene.
			
				//Part 1.
				
			if (lincolnPorkRight.x >= upperLimit && part1Background.y == 0)
			{
					 
				trace("Player on 'Upper Limit, moving to next scene");
				
				part2Background.y = 0;
				part1Background.y = 900;
				
				onFirstScene = false;
				onSecondScene = true;
				
				//Build second scene
				
				addChild(smallCrate);
					smallCrate.x = 513;
					smallCrate.y = 679;
								
				addChild(meatBall);
					meatBall.x = 1046;
					meatBall.y = 666;
						if (!meatBall.hitTestObject(smallCrate))
						{
							
							trace("MeatBall on move");
							
							meatBall.x -= 1;
							
						}
						else if (meatBall.hitTestObject(smallCrate))
						{
							
							trace("MeatBall hit crate");
							
							meatBall.x = 1046;
							
						}
					
				addChild(meatGrinder);
					meatGrinder.x = 1038;
					meatGrinder.y = 565;
									
				addChild(grinderSwitch);
					grinderSwitch.x = 700;
					grinderSwitch.y = 636;
				
				if (lincolnPorkRight.y == 667)
				{
					
					lincolnPorkRight.x = 60;
					
				}
				
				else if (lincolnPorkRight.y < 600 )
				{
					
					lincolnPorkRight.x = 60;
					
				}
					 
		    }
			
			if (lincolnPorkRight.x <= lowerLimit && part1Background.y == 0)
			{
					 
				trace("Player on 'Lower Limit'");
				lincolnPorkRight.x += 4;
					 
			}
			
				//Part 2.
				
			if (lincolnPorkRight.x >= upperLimit && onSecondScene == true)
			{
					 
				trace("Player on 'Upper Limit, moving to next scene");
				//part2Background.y = 900;
				//part3Background.y = 0;
				
				if (lincolnPorkRight.y == 667)
				{
					
					//lincolnPorkRight.x = 60;
					
				}
				
				else if (lincolnPorkRight.y < 600 )
				{
					
					//lincolnPorkRight.x = 60;
					
				}
					 
		    }
			
			if (lincolnPorkRight.x <= lowerLimit && onSecondScene == true)
			{
					 
				trace("Player on 'Lower Limit' moving to previous scene");
				
				onFirstScene = true;
				onSecondScene = false;
				
				part2Background.y = 900;
				part1Background.y = 0;
				
				lincolnPorkRight.x = 1280;
					 
			}
			
			
						
		}
		
		public function keyUpListener(e:KeyboardEvent)
		{
			
			trace ("Key " + e.keyCode + " Released");
			
			lincolnPorkRight.stop();
			
		}
		
		public function enterFrameListener(e:Event)
		{
			
			//Code for pushing the crate until collion
			
			if (lincolnPorkRight.hitTestObject(jumpCrate2) && !jumpCrate2.hitTestObject(singleCrate))
			{
				
				trace("Player moving crate");
				
				jumpCrate2.x += pushSpeed;
				
			}
			
			//Code for when crates collide and animation for jumping procedure begins.
			
			if (lincolnPorkRight.hitTestObject(jumpCrate2) && jumpCrate2.hitTestObject(singleCrate))
			{
				
				trace("Upwards animation");
				
				//lincolnPorkRight.x -= 4;	
				
				crateAnimation = true;
								
			}
			
			else
			{
				
				lincolnNotification.x = -100;
				lincolnNotification.y = -100;
				
				crateAnimation = false;
				
			}
			
			//Allows the view to hide levels the player is not present on.
			
			if (lincolnPorkRight.y < 395)
			{
				
				platformCover.x = 0;
				platformCover.y = 484;
				
			}
			
			if (lincolnPorkRight.y > 395)
			{
				
				platformCover.x = 0;
				platformCover.y = 198;
				
			}
			
			if (lincolnPorkRight.x >= 300 && lincolnPorkRight.x <= 400 && lincolnPorkRight.y > 600)
			{
				
				lincolnNotification.x = lincolnPorkRight.x + 90;
				lincolnNotification.y = lincolnPorkRight.y - 61;
						
			}
						
			else if (lincolnPorkRight.x >= 620 && lincolnPorkRight.x <= 700 && lincolnPorkRight.y < 400)
			{
				
				lincolnNotification.x = lincolnPorkRight.x + 90;
				lincolnNotification.y = lincolnPorkRight.y - 61;
				
			}
			
			else
			{
				
				lincolnNotification.x = -100;
				lincolnNotification.y = -100;
				
			}
			
		}
		
		public function TaskOne()
		{
			
			trace("Task 1 started.")
			
			//healthImage = new Health;
			//noHealthImage = new LostHealth;
			//healthBox = new HealthBoxMeat;
			//textBox = new TextBoxMeat;
			//playerFace = new PigFace;
			
			addChild(healthBox);
				healthBox.x = 166;
				healthBox.y = 735;
			
			addChild(textBox);
				textBox.x = 301;
				textBox.y = 735;
				
			addChild(noHealthImage1);
				noHealthImage1.x = 187;
				noHealthImage1.y = 747;
				
			addChild(healthImage1);
				healthImage1.x = 187;
				healthImage1.y = 747;
				
			addChild(noHealthImage2);
				noHealthImage2.x = 187;
				noHealthImage2.y = 825;
				
			addChild(healthImage2);
				healthImage2.x = 187;
				healthImage2.y = 825;
				
			addChild(playerFace);
				playerFace.x = -16;
				playerFace.y = 703;
				
			addChild(task1Text);
				task1Text.x = 355;
				task1Text.y = 789;
				
			TransitionManager.start(playerFace, {type:Fade, direction:Transition.IN, duration:9, easing:Strong.easeOut});
			TransitionManager.start(textBox, {type:Fade, direction:Transition.IN, duration:9, easing:Strong.easeOut});
			TransitionManager.start(noHealthImage1, {type:Fade, direction:Transition.IN, duration:9, easing:Strong.easeOut});
			TransitionManager.start(healthImage1, {type:Fade, direction:Transition.IN, duration:9, easing:Strong.easeOut});
			TransitionManager.start(noHealthImage2, {type:Fade, direction:Transition.IN, duration:9, easing:Strong.easeOut});
			TransitionManager.start(healthImage2, {type:Fade, direction:Transition.IN, duration:9, easing:Strong.easeOut});
			TransitionManager.start(healthBox, {type:Fade, direction:Transition.IN, duration:9, easing:Strong.easeOut});
			TransitionManager.start(task1Text, {type:Fade, direction:Transition.IN, duration:9, easing:Strong.easeOut});
				
			if (finishedTaskOne == true)
			{
				
				//Remove children.
				
			}
			
		}
		
		public function displayMenuListener(e:MouseEvent)
		{
			
			trace("Display menu");
			
			if (textBox.y == 735)
			{

				healthBox.y = 1000;
				textBox.y = 1000;
				noHealthImage1.y = 1000;
				healthImage1.y = 1000;
				noHealthImage2.y = 1000;
				healthImage2.y = 1000;
				task1Text.y = 1000;
				
			}
			else if (textBox.y == 1000)
			{
				
				healthBox.y = 735;
				textBox.y = 735;
				noHealthImage1.y = 747;
				healthImage1.y = 747;
				noHealthImage2.y = 825;
				healthImage2.y = 825;
				task1Text.y = 789;
				
			}
			
		}

	}
	
}
