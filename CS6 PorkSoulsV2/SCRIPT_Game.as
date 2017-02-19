package  
{
	
	//PACKAGE IMPORTING.
	
	import flash.display.MovieClip;
	
	
	public class SCRIPT_Game extends MovieClip {
		
		
		public function SCRIPT_Game() {
			
			// constructor code
			
			trace ("PorkSouls V2 Game In Progress")
			
			addChild(SCRIPT_Game_Manager.getInstance());
			
		}
	}
	
}
