package  
{
	
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	public class GameManagerClass extends MovieClip 
	{
		
		public static var instance:GameManagerClass = null;
		public var curScene:SceneClass = null;
		
		public function GameManagerClass() 
		{
			
			// constructor code
			
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStage);
			
		}
		
		public function addedToStage(e:Event)
		{
			
			GoToScene("home");
			
		}
		
		public function GoToScene(name:String)
		{
			
			if (curScene)
			
			{
			
				curScene.OnLeaveScene();
			
				removeChild(curScene);
			
			}
			
			if(name=="home") curScene = new HomeScreenClass();
			if(name=="credits") curScene = new CreditsClass();
			if(name=="level1") curScene = new Level1Class();
			//if(name=="level2") curScene = new Level2Class();
			//if(name=="level3") curScene = new Level3Class();
			if(name=="options") curScene = new OptionsClass();
			addChild(curScene);
			
		}
		
		public static function getInstance():GameManagerClass
		{
			
			if (instance==null)
			{
				
				trace("Instance Of Game Manager Is Being Created");
				instance = new GameManagerClass();
				
			}
			return instance;
			
		}
	}
	
}
