import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;
 
//variables for transformations 
int dialation;
int translationX;
int translationY;

Kinect kinect;
ArrayList <SkeletonData> bodies;

 //this is the first method that is called in processing
 //it only runs once 
void setup()
{
  size(640, 480);
  background(0);
  kinect = new Kinect(this);
  smooth();
  bodies = new ArrayList<SkeletonData>();
  
  //set up dialation and translation for skeleton joints
  //never set dialtion equal to zero
  //if you want the skelton to be original size set it equal to 0
  dialation =1;
  translationX=0;
  translationY=0;
}
 
 /*
 This countiously runs 
 it draws 
 */
void draw()
{
  background(100,255,100);
 image(kinect.GetImage(), 320, 0, 320, 240);
 image(kinect.GetDepth(), 320, 240, 320, 240);
 image(kinect.GetMask(), 0, 240, 320, 240);
  for (int i=0; i<bodies.size (); i++) 
  {
    drawSkeleton(bodies.get(i));
   drawPosition(bodies.get(i));
   getDirection(bodies.get(i));
  }
  
}
 
void drawPosition(SkeletonData _s) 
{
  noStroke();
  fill(0, 100, 255);
  String s1 = str(_s.dwTrackingID);
  
  text(s1, _s.position.x*width/dialation+translationX, _s.position.y*height/dialation+translationY);
}
 
void drawSkeleton(SkeletonData _s) 
{
  // Body
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HEAD, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
  Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 
  Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SPINE, 
  Kinect.NUI_SKELETON_POSITION_HIP_CENTER);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 
  Kinect.NUI_SKELETON_POSITION_HIP_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 
  Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 
  Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);
 
  // Left Arm
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT, 
  Kinect.NUI_SKELETON_POSITION_WRIST_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_WRIST_LEFT, 
  Kinect.NUI_SKELETON_POSITION_HAND_LEFT);
 
  // Right Arm
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_HAND_RIGHT);
 
  // Left Leg
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 
  Kinect.NUI_SKELETON_POSITION_KNEE_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_KNEE_LEFT, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT, 
  Kinect.NUI_SKELETON_POSITION_FOOT_LEFT);
 
  // Right Leg
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_FOOT_RIGHT);
}

//A BONE CONNNECTS TWO JOINTS 
//here is where you can do transformations on the joints 
void DrawBone(SkeletonData _s, int _j1, int _j2) 
{
  noFill();
  stroke(255, 0, 0);
  
  if (_s.skeletonPositionTrackingState[_j1] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED &&
    _s.skeletonPositionTrackingState[_j2] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED) 
    {
      line(_s.skeletonPositions[_j1].x*width/dialation+translationX, 
      _s.skeletonPositions[_j1].y*height/dialation+translationY,     
      _s.skeletonPositions[_j2].x*width/dialation+translationX,  
      _s.skeletonPositions[_j2].y*height/dialation+translationY);
  }
}

 /*
 -this method is probably overriden 
 preconditon:
 -if a new skeletonData object appears this method is called 
 postconditon: 
 -calls a synchronized function on arraylist of bodies 
 within the synchronized function, the newfound data skeleton object is added to bodies 
 */
void appearEvent(SkeletonData _s) 
{
  if (_s.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    bodies.add(_s);
  }
}
 
 /*
 -this method is probably overriden 
 Precondition:
 -if a new skeletonData object disappears this method is called 
 Postconditon: 
 -calls a synchronized function on arraylist of bodies 
 within the synchronized function, the lost dataskeleton object is removed from bodies
 */
void disappearEvent(SkeletonData _s) 
{
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_s.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.remove(i);
      }
    }
  }
}


void moveEvent(SkeletonData _b, SkeletonData _a) 
{
  if (_a.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_b.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.get(i).copy(_a);
        break;
      }
    }
  }
}

void getDirection(SkeletonData _s)
{
   //here we retrieve the vectors of each 
   PVector leftHand = _s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_LEFT];
   PVector rightHand =_s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_RIGHT];
   PVector torso = _s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER];
   
  //breaking down positions into basic controls 
  boolean leftUp = leftHand.y<torso.y;
  boolean rightUp= rightHand.y<torso.y;
<<<<<<< HEAD
  /*
  if(leftUp&&!rightUp)
  {
   // playerId.changeDirection(0);
    System.out.println(0);
  }
   if(!leftUp&&rightUp){
   //playerId.changeDirection(1)//car rif (leftUp) 
   System.out.println(1);
  {//car Dight
 }
  if(leftUp&&rightUp) {
    //playerId.changeDirection(2)
    System.out.println(2);
  }
  if(!(leftUp&&rightUp))
  {
    //playerId.changeDirection(3)
    System.out.println(3);
  }
  */
=======
>>>>>>> a2cae4b240a05b7f5eca12886e0af311f0df067b
  if(leftUp)
  {
    if(rightUp)
    {
      System.out.println("Up");
    }
    else
    {
      System.out.println("Left");
    }
  }
  else
  {
    if (rightUp)
    {
      System.out.println("Right");
    }
  
  }
  if(!rightUp&&!leftUp)
  {
       System.out.println("Down");
  }
}
