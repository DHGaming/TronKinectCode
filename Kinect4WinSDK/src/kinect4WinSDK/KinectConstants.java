package kinect4WinSDK;

public interface KinectConstants {
	// These are constants for the joints 
	//each joint has a corresponding value 
	//the position count is a count of all the joints 
	public final static int NUI_SKELETON_POSITION_HIP_CENTER = 0;
	public final static int NUI_SKELETON_POSITION_SPINE = 1;
	public final static int NUI_SKELETON_POSITION_SHOULDER_CENTER = 2;
	public final static int NUI_SKELETON_POSITION_HEAD = 3;
	public final static int NUI_SKELETON_POSITION_SHOULDER_LEFT = 4;
	public final static int NUI_SKELETON_POSITION_ELBOW_LEFT = 5;
	public final static int NUI_SKELETON_POSITION_WRIST_LEFT = 6;
	public final static int NUI_SKELETON_POSITION_HAND_LEFT = 7;
	public final static int NUI_SKELETON_POSITION_SHOULDER_RIGHT = 8;
	public final static int NUI_SKELETON_POSITION_ELBOW_RIGHT = 9;
	public final static int NUI_SKELETON_POSITION_WRIST_RIGHT = 10;
	public final static int NUI_SKELETON_POSITION_HAND_RIGHT = 11;
	public final static int NUI_SKELETON_POSITION_HIP_LEFT = 12;
	public final static int NUI_SKELETON_POSITION_KNEE_LEFT = 13;
	public final static int NUI_SKELETON_POSITION_ANKLE_LEFT = 14;
	public final static int NUI_SKELETON_POSITION_FOOT_LEFT = 15;
	public final static int NUI_SKELETON_POSITION_HIP_RIGHT = 16;
	public final static int NUI_SKELETON_POSITION_KNEE_RIGHT = 17;
	public final static int NUI_SKELETON_POSITION_ANKLE_RIGHT = 18;
	public final static int NUI_SKELETON_POSITION_FOOT_RIGHT = 19;
	public final static int NUI_SKELETON_POSITION_COUNT = 20;

	//skeleton count is probably the max number of skeletons available 
	public final static int NUI_SKELETON_COUNT = 6;
	
	//this is probably the largest picture that can be projected 
	public final static int WIDTH = 640;
	public final static int HEIGHT = 480;

	// these are probably different types of tracked states 
	public final static int NUI_SKELETON_NOT_TRACKED = 0;
	public final static int NUI_SKELETON_POSITION_ONLY = 1;
	public final static int NUI_SKELETON_TRACKED = 2;
	
	// thes probably tell whether a specific joint is being tracked or not 
	public final static int NUI_SKELETON_POSITION_NOT_TRACKED = 0;
	public final static int NUI_SKELETON_POSITION_INFERRED = 1;
	public final static int NUI_SKELETON_POSITION_TRACKED = 2;
}
