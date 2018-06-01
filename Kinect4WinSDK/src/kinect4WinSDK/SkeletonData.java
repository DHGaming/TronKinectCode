package kinect4WinSDK;

import processing.core.PVector;

public class SkeletonData implements KinectConstants {

	//note that all these variables are public so you may directly access these values within the class
	public int trackingState;
	public int dwTrackingID;
	public PVector position;
	public PVector[] skeletonPositions;
	public int[] skeletonPositionTrackingState;

	public SkeletonData() {
		trackingState = 0;
		dwTrackingID = 0;
		position = new PVector(0.0f, 0.0f, 0.0f);
		
		//makes an empty arry for all joints 		
		skeletonPositions = new PVector[NUI_SKELETON_POSITION_COUNT];
		
		//makes an empty array for the tracked positon of all joints 
		skeletonPositionTrackingState = new int[NUI_SKELETON_POSITION_COUNT];
		
		//runs for every joint
		for (int i = 0; i < NUI_SKELETON_POSITION_COUNT; i++) {
			
			//each element in the array is initiialized to a position for that joint 
			skeletonPositions[i] = new PVector(0.0f, 0.0f, 0.0f);
			
			//each element in this array is intialized to a tracked position for that joint 
			skeletonPositionTrackingState[i] = 0;
		}
	}

	public void copy(SkeletonData _s) {
		this.trackingState = _s.trackingState;
		this.dwTrackingID = _s.dwTrackingID;

		this.position.x = _s.position.x;
		this.position.y = _s.position.y;
		this.position.z = _s.position.z;

		for (int i = 0; i < NUI_SKELETON_POSITION_COUNT; i++) {
			this.skeletonPositions[i].x = _s.skeletonPositions[i].x;
			this.skeletonPositions[i].y = _s.skeletonPositions[i].y;
			this.skeletonPositions[i].z = _s.skeletonPositions[i].z;
			this.skeletonPositionTrackingState[i] = _s.skeletonPositionTrackingState[i];
		}
	}
}
