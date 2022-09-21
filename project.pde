int drop_x,drop_y;       // Variables to store (x,y) position of drop
int ball_x = (int)random(400);          //ball drops from random pos in x axis
int ball_y = 50;
int direction_y =0;          //speed is set to 0
int score=0,lives=3;                   // Set initial score and number of lives
char gameState;              //variable used later on for the diff game states

void setup()
{
  size(400,400);                  // Create a window 400x400 pixels
  gameState='Z';              //starting value for gamestate
  //clearBackground();
  background(255,255,255);      //clears screen to white
  
  //starting screen where difficulty is selected
  textAlign(CENTER);
  textSize(18);
  fill(0,0,255);
  text("CATCH THE BALL\nPress left click then enter keys for difficulty\ns--slow\nn--normal\nf--fast as hell" , width/2, height/2);
}

void draw()
{
  difficulty(gameState);        //where the game state is drawn depending on the user input
  textSize(16);                
  fill(0,0,255);
  text("score:"+score, 60, 30);        // Display score
  text("lives:"+lives,width-65, 30);   // Display lives
}

void   difficulty(char gameState)
{
  
    if ( gameState == 's')
    {
       background(255,255,255);        // Clear screen to white  
  fill(139,69,19);                  // Set fill colour to brown
  arc(mouseX, 380, 70, 70, 0, PI); //Position semi circle using mouse
  
  fill(255,0,0);                  //ball is red
  ellipse(ball_x,ball_y,20,20);             // Draw ball centered on x,y diameter 20

  ball_y=ball_y+direction_y +3;        ///Update ball speed to 3
  
  if(ball_y>(height-10))           // If ball hits bottom of screen then miss..
  {
     ball_x=(int)random(400);     //Ball drops from random place
     ball_y=90;
     lives--;                  // Reduce lives by one  
     if(lives==0) exit();      // If lives is zero then quit
  }
  
  if((ball_y>(height-30))&&(abs(mouseX-ball_x)<30)) // If ball has entered basket then..
  {
    ball_x=(int)random(400);                //Ball drops from random place
    ball_y=90;
    score++;                              // Increase score by one
  }
  textSize(16);                
  fill(0,0,255);
  text("easy",width/2,30);
    }


    else if ( gameState == 'n')
    {
        background(255,255,255);        // Clear screen to white  
  fill(139,69,19);                  // Set fill colour to brown
  arc(mouseX, 380, 70, 70, 0, PI); //Position semi circle using mouse
  
  fill(255,0,0);
  ellipse(ball_x,ball_y,20,20);             // Draw ball centered on x,y diameter 20

  ball_y=ball_y+direction_y +5;        ///Update ball speed to 5
  
  if(ball_y>(height-10))           // If ball hits bottom of screen then miss..
  {
     ball_x=(int)random(400);     //Ball drops from random place
     ball_y=90;
     lives--;                  // Reduce lives by one  
     if(lives==0) exit();      // If lives is zero then quit
  }
  
  if((ball_y>(height-30))&&(abs(mouseX-ball_x)<30)) // If ball has entered basket then..
  {
    ball_x=(int)random(400);                //Ball drops from random place
    ball_y=90;
    score++;                              // Increase score by one
  }
  textSize(16);                
  fill(0,0,255);
  text("normal",width/2,30);
    }

    
    else if ( gameState == 'f')
    {
        background(255,255,255);        // Clear screen to white  
  fill(139,69,19);                  // Set fill colour to brown
  arc(mouseX, 380, 70, 70, 0, PI); //Position semi circle using mouse
  
  fill(255,0,0);
  ellipse(ball_x,ball_y,20,20);             // Draw ball centered on x,y diameter 20

  ball_y=ball_y+direction_y +10;        ///Update ball speed to 10
  
  if(ball_y>(height-10))           // If ball hits bottom of screen then miss..
  {
     ball_x=(int)random(400);     //Ball drops from random place
     ball_y=90;
     lives--;                  // Reduce lives by one  
     if(lives==0) exit();      // If lives is zero then quit
  }
  
  if((ball_y>(height-30))&&(abs(mouseX-ball_x)<30)) // If ball has entered basket then..
  {
    ball_x=(int)random(400);                //Ball drops from random place
    ball_y=90;
    score++;                              // Increase score by one
  }
  textSize(16);                
  fill(0,0,255);
  text("hard",width/2,30);
    }
}
void keyPressed()
{
if ( gameState == 'Z')          //game state for starter screen
  {
    if(key == 's')            //if s pressed, easy difficulty(ball moves slow)
    {
       gameState = 's';
    }
    else if(key == 'n')      //if n pressed, normal difficulty(ball moves at decent pace)
    {
       gameState = 'n';
    }
    else if(key == 'f')      //if f pressed, easy difficulty(ball moves fast 'as hell')
    {
       gameState = 'f';
    }
  }
}
