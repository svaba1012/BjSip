#ifndef BJAUDIOMEDIOPORT_H
#define BJAUDIOMEDIOPORT_H

#include <pjsua2.hpp>
#include <iostream>

using namespace pj;

class BjAudioMediaPort : public AudioMediaPort{
    public:
        BjAudioMediaPort();
        virtual void onFrameRequested(MediaFrame &frame);
        virtual void onFrameReceived(MediaFrame &frame);
};

#endif // BJAUDIOMEDIOPORT_H

