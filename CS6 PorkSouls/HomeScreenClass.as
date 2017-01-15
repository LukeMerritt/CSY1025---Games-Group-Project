package  
{
	
	//Import Packages.
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.display.SimpleButton;
	
	public class HomeScreenClass extends SceneClass
	{
		
		public var backgroundImage: BackgroundImage;
		
		public var plyBtn:PlayButtonImage;
		public var optBtn:OptionsButtonImage;
		public var crdBtn:CreditsButtonImage;
		
		public function HomeScreenClass() 
		{
			
			//Constructor code
									
			//Variables
			
			backgroundImage = new BackgroundImage
			
			plyBtn = new PlayButtonImage;
			optBtn = new OptionsButtonImage;
			crdBtn = new CreditsButtonImage;
			
			addChild (backgroundImage);
			
			addChild (plyBtn);
				plyBtn.x = 36;
				plyBtn.y = 36;
					plyBtn.addEventListener(MouseEvent.MOUSE_DOWN, playButtonClicked);
				
			addChild (optBtn);
				optBtn.x = 400;
				optBtn.y = 36;
					optBtn.addEventListener(MouseEvent.MOUSE_DOWN, optionsButtonClicked);
					
			addChild (crdBtn);
				crdBtn.x = 950;
				crdBtn.y = 36;
					crdBtn.addEventListener(MouseEvent.MOUSE_DOWN, creditsButtonClicked);
						
		}

		override public function OnLeaveScene()
		{
			
			trace("Leaving Menu Scene");
			
			removeChildren();
			
			this.removeEventListener(MouseEvent.CLICK, playButtonClicked);
			//this.removeEventListener(MouseEvent.CLICK, optionsButtonClicked);
			//this.removeEventListener(MouseEvent.CLICK, creditButtonClicked);
			
		}
		
		public function playButtonClicked(e:MouseEvent)
		{
			
			trace("Play Button Clicked");
						
			GameManagerClass.getInstance().GoToScene("level1");
			
		}
		
		public function optionsButtonClicked(e:MouseEvent)
		{
			
			trace("Options Button Clicked");
						
			GameManagerClass.getInstance().GoToScene("options");
						
		}
		
		public function creditsButtonClicked(e:MouseEvent)
		{
			
			trace("Credit Button Clicked");
			
			GameManagerClass.getInstance().GoToScene("credits");
						
		}
		
		public function keyDown(e:KeyboardEvent)
		{
			
			trace(e.keyCode);
			
		}
		
	}
	
}
