package
{
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	public class MainLike extends MovieClip
	{
		var btnLike:LikeB;//buttons
		var btnDislike:DislikeB;
		var likes:int=0;//variable
		var dislikes:int=0;
		var btnReset:ResetB;
		var btnDisable:DisableB;
		var l:logo;
		var logomove:Boolean=true;
		var Score:TextField=new TextField()
		var multiplier:TextField=new TextField()
		var btnDouble:DoubleLikes;
		var likenum:int=1;
		var multipliercost:int=50;


		public function MainLike()//CONSTRUCTOR - runs when the program starts
		//it has the same name as the class name - runs ONLY ONCE
		{
			btnDouble=new DoubleLikes()
			btnDouble.x=125;
			btnDouble.y=300;
			
			btnLike=new LikeB()
			btnLike.x=150;
			btnLike.y=200;
			stage.addChild(btnLike);
			
			btnDislike=new DislikeB()
			btnDislike.x=400;
			btnDislike.y=200;
			stage.addChild(btnDislike);
			
			btnReset=new ResetB()
			btnReset.x=225;
			btnReset.y=300;
			stage.addChild(btnReset);
			
			btnDisable=new DisableB()
			btnDisable.x=325;
			btnDisable.y=300;
			stage.addChild(btnDisable);
			
			l=new logo()
			l.x=-20;
			l.y=400;
			stage.addChild(l);
			
			Score.text ="Likes: "+likes.toString();
			Score.x=400;
			Score.y=300;
			stage.addChild(Score);
	
			btnLike.addEventListener(MouseEvent.CLICK,likeClick);
			btnDislike.addEventListener(MouseEvent.CLICK,dislikeClick);
			btnReset.addEventListener(MouseEvent.CLICK,resetClick);
			btnDisable.addEventListener(MouseEvent.CLICK,disableClick);
			btnDouble.addEventListener(MouseEvent.CLICK,doubleClick);
			stage.addEventListener(Event.ENTER_FRAME,gameLoop);
			
		}//end CONSTRUCTOR
		
		public function doubleClick(e:MouseEvent)
		{
			if (likes>multipliercost)
			{
				likenum=likenum*2;//the multiplier for likes
				multiplier.text=("Multiplier: "+likenum);
				likes=likes-multipliercost;
				multipliercost=multipliercost*10;//actual cost to get next multiplier
			}
			
			
		}
		public function disableClick(e:MouseEvent)
		{
			btnLike.removeEventListener(MouseEvent.CLICK,likeClick);
			btnDislike.removeEventListener(MouseEvent.CLICK,dislikeClick);
			btnLike.alpha=0.4;
			btnDislike.alpha=0.4;
			logomove=false;
			trace("DISABLE the trumpster")
		}
		
		public function resetClick(e:MouseEvent)
		{
			likes=0;
			dislikes=0;
			trace("Reset mother huggers");
			btnLike.addEventListener(MouseEvent.CLICK,likeClick);
			btnDislike.addEventListener(MouseEvent.CLICK,dislikeClick);
			btnLike.alpha=1;
			btnDislike.alpha=1;
			l.x=-20;
			logomove=true;
		}
		
		public function likeClick(e:MouseEvent)
		{
			likes+=likenum;
			trace("Likes: ",likes);
			l.x+=10;
		}
		
		public function dislikeClick(e:MouseEvent)
		{
			dislikes++;
			trace("Dislikes: ",dislikes);
			l.x+=-20;
		}
		public function gameLoop(e:Event)
		{
			if (logomove==true)
			{
				l.x+=1
			if (l.x>575)
			{
				l.x=-20;
			}
			if (l.x<-30)
			{
				l.x=550;
			}
			}
			Score.text ="Likes: "+likes.toString();
			
			if (likes>50)
			{
				stage.addChild(btnDouble);
				multiplier.text ="Multiplier: "+likenum.toString();
				multiplier.x=200;
				multiplier.y=300;
				stage.addChild(multiplier);
				
			}

		}
	}//end class
}//end package