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
		
		public var lvl1Background: BasicBG;
		public var player: LincolnPork;
		
		public function Level1Class() 
		{
			// constructor code.
			
			lvl1Background = new BasicBG;
			player = new LincolnPork;
			
			addChild(lvl1Background);
			
			addChild(player);
				player.x = 200;
				player.y = 200;
						
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
