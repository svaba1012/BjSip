#include "bjaudiomediaport.h"

BjAudioMediaPort::BjAudioMediaPort()
{

}



void BjAudioMediaPort::onFrameRequested(MediaFrame &frame){
    // Give the input frame here
    frame.type = PJMEDIA_FRAME_TYPE_AUDIO;
    // frame.buf.assign(frame.size, 'c');
}

void BjAudioMediaPort::onFrameReceived(MediaFrame &frame){
        // Process the incoming frame here
}
