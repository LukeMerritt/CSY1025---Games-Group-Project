package 
{
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;
	
	public class MovementClass extends MovieClip
	{
		
		//Speed variables...
		
		public var PlayerSpeed = 4;
		
		public function MovementClass() 
		{
						
			//Add The Event Listeners For Player Movement...
			
			GameManagerClass.getInstance().stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownListener);
		
			GameManagerClass.getInstance().stage.addEventListener(KeyboardEvent.KEY_UP, keyUpListener);
						
			GameManagerClass.getInstance().stage.addEventListener(Event.ENTER_FRAME, enterFrameListener);
			
			// constructor code
			
			trace ("Constructor Code For PorkSouls")
			
		}
		
		public function keyDownListener(e:KeyboardEvent)
		{
			
			trace ("X Location is " + this.x);
			trace ("Y Location is " + this.y);
			
			trace ("Key " + e.keyCode + " Pressed");
			
			//Player Movement...
						
			if (e.keyCode == 37)
			{
					
				this.x -= PlayerSpeed;
					
				//this.gotoAndPlay()
					
			}
				
			if (e.keyCode == 38)
			{
					
				//Needs upwards interaction.
					
			}
				
			if (e.keyCode == 39)
			{
					
				this.x += PlayerSpeed;
					
				//this.gotoAndPlay()
					
			}
				
			if (e.keyCode == 40)
			{
					
				//Needs upwards interaction.
					
			}
						
		}
		
		public function keyUpListener(e:KeyboardEvent)
		{
			
			trace ("Key " + e.keyCode + " Released");
			
			this.stop();
			
		}
		public function enterFrameListener(e:Event)
		{
				
			
				
		}

	}
	
}
