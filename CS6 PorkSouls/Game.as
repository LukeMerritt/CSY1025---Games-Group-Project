package  
{
	
	import flash.display.MovieClip;
	
	
	public class Game extends MovieClip 
	
	{
		
		
		public function Game() 
		
		{
			
			// constructor code
			
			trace ("PorkSouls Game In Progress")
			
			addChild(GameManagerClass.getInstance());
			
		}
	}
	
}
