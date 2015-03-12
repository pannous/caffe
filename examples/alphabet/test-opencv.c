#include "cv.h"
#include "highgui.h"

int main(int argc, char** argv) {

    cvNamedWindow( "video", 0 );
    IplImage *im = cvCreateImage( cvSize(200,200), 8, 3 );
    while(1) {
    	cvShowImage( "video", im );
  	  if( cvWaitKey(10)>0)return 0;
    }

    return 0;
}