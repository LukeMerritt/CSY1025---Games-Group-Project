package  
{
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	public class Level2Class extends SceneClass
	{
		
		
		public function Level2Class() 
		{
			
			trace("Credits scene constructor");

			GameManagerClass.getInstance().stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			
		}
		
		
		override public function OnLeaveScene()
		{
			
			trace("leaving Credits scene");
			
			removeChildren();
			
			this.removeEventListener(MouseEvent.CLICK, onClick);
			
			GameManagerClass.getInstance().stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			
		}
		
		public function onClick(e:MouseEvent)
		{
			
			trace("Game scene onClick");
			GameManagerClass.getInstance().GoToScene("menu");
			
		}
		
		public function keyDown(e:KeyboardEvent)
		{
			
			trace(e.keyCode);
			
		}

	}
	
}