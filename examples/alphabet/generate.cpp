// #ifdef make_alphabet_example
// #ifdef cairo
#include <opencv2/opencv.hpp>
#include <string>
#include <stdlib.h> // system
#include <cairo/cairo.h>

  
void putTextCairo(
        cv::Mat &targetImage,
        std::string const& text,
        cv::Point2d centerPoint,
        std::string const& fontFace,
        double fontSize,
        cv::Scalar textColor,
        bool fontItalic,
        bool fontBold)
{
    // Create Cairo
    cairo_surface_t* surface =
            cairo_image_surface_create(
                CAIRO_FORMAT_ARGB32,
                targetImage.cols,
                targetImage.rows);

    cairo_t* cairo = cairo_create(surface);

    // Wrap Cairo with a Mat
    cv::Mat cairoTarget(
                cairo_image_surface_get_height(surface),
                cairo_image_surface_get_width(surface),
                CV_8UC4,
                cairo_image_surface_get_data(surface),
                cairo_image_surface_get_stride(surface));

    // Put image onto Cairo
    cv::cvtColor(targetImage, cairoTarget, cv::COLOR_BGR2BGRA);

    // Set font and write text
    cairo_select_font_face (
                cairo,
                fontFace.c_str(),
                fontItalic ? CAIRO_FONT_SLANT_ITALIC : CAIRO_FONT_SLANT_NORMAL,
                fontBold ? CAIRO_FONT_WEIGHT_BOLD : CAIRO_FONT_WEIGHT_NORMAL);

    cairo_set_font_size(cairo, fontSize);
    cairo_set_source_rgb(cairo, textColor[2], textColor[1], textColor[0]);

    cairo_text_extents_t extents;
    cairo_text_extents(cairo, text.c_str(), &extents);

    // cairo_move_to(
    //              cairo,
    //              centerAnchor.x - extents.width/2 - extents.x_bearing,
    //              centerAnchor.y - extents.height/2- extents.y_bearing);
    cairo_show_text(cairo, text.c_str());

    // Copy the data to the output image
    cv::cvtColor(cairoTarget, targetImage, cv::COLOR_BGRA2BGR);

    cairo_destroy(cairo);
    cairo_surface_destroy(surface);
}
int main(){
  cv::Mat targetImage(512,512,CV_8UC4);
  std::string const text="HILLO!!!";
  cv::Point2d centerPoint(100,100);
  std::string const fontFace="Arial";
  double fontSize=8;
  cv::Scalar textColor(40,100,200);
  bool fontItalic=false;
  bool fontBold=false;
  putTextCairo(targetImage,text,centerPoint,fontFace,fontSize,textColor,fontItalic,fontBold) ; 
  // int text_font = cv::initFont(cv::CV_FONT_HERSHEY_DUPLEX, 10, 10) 
  // putText(Mat& img, const string& text, Point org, int fontFace, double fontScale, Scalar color, int thickness=1, int lineType=8, bool bottomLeftOrigin=false )¶
  int text_font=cv::FONT_HERSHEY_PLAIN;//FONT_HERSHEY_DUPLEX;
  //http://docs.opencv.org/modules/core/doc/drawing_functions.html#void%20cvPutText%28CvArr*%20img,%20const%20char*%20text,%20CvPoint%20org,%20const%20CvFont*%20font,%20CvScalar%20color%29
  CvFont font=cv::fontQt("Arial");
  cv::putText(targetImage,text,centerPoint, text_font,fontSize,textColor);
  cv::addText(targetImage,text,centerPoint, font);
  // display image in a window
  cv::namedWindow("generate", CV_WINDOW_AUTOSIZE); // creating a new window each time

  system("/usr/bin/osascript -e 'tell app \"Finder\" to set frontmost of process \"generate\" to true'");

  
  // cvNamedWindow("generate", CV_WINDOW_AUTOSIZE); // creating a new window each time
  //  cvMoveWindow("generate",100,100);
  //  cvResizeWindow("generate",100,100);
  IplImage image=targetImage;      
  
  cv::VideoCapture camera;
  cv::Mat frame;
  cv::Mat last;
  camera.open(0);
  while(1){
   // = *cvQueryFrame(fc);
   camera.grab(); 
   last=frame;
   camera.retrieve(frame);
   
  putTextCairo(frame,text,centerPoint,fontFace,fontSize,cv::Scalar(0,0,255),fontItalic,fontBold) ;  

  // IplImage* frame = cv::QueryFrame(fc);
  // if (!frame) printf("NO FRame!");
  // cv::imshow("generate", frame);
    cv::imshow("generate", targetImage);
  // cv::imshow("generate", (frame+last)/2);
  // if( cvWaitKey(10)>0)return 0;
  if(cv::waitKey(1)>0)return 0;
  }
  cv::waitKey(0);
        // wait for keypress  
}
// #else
// int main(){}
// #endif