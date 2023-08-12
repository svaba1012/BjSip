#include "bjcall.h"

BjCall::BjCall(Account &acc,BjSip* bjSip, int call_id) : Call(acc, call_id){
//    wav_player = NULL;
//    med_port = NULL;
    myAcc = (BjAccount *)&acc;
    this->bjSip = bjSip;
    this->aud_med = NULL;
    this->speaker_media = &Endpoint::instance().audDevManager().getPlaybackDevMedia();
    this->mic_media = &Endpoint::instance().audDevManager().getCaptureDevMedia();
}

BjCall::~BjCall(){
//    if (wav_player)
//        delete wav_player;
//    if (med_port)
//        delete med_port;
    if (aud_med){
//        this->mic_media->stopTransmit(*this->aud_med);
//        this->aud_med->stopTransmit(*this->speaker_media);
    }
}


void BjCall::onCallState(OnCallStateParam &prm){
    PJ_UNUSED_ARG(prm);

    CallInfo ci = getInfo();
    std::cout << "*** Call: " <<  ci.remoteUri << " [" << ci.stateText
              << "]" << std::endl;

    pjsip_status_code status = ci.lastStatusCode;
    std::cout << "---Code---" << status << "---Code---" <<std::endl;

    if(this->bjSip->hasIncomingCall && this->bjSip->bjCall == NULL){
        if(status == PJSIP_SC_REQUEST_TERMINATED || status == PJSIP_SC_REJECTED){
            this->bjSip->setHasIncomingCall(false);
            delete this->bjSip->incomingCall;
            this->bjSip->incomingCall = NULL;
        }
        return;
    }


    if(this != this->bjSip->incomingCall && this != this->bjSip->bjCall){
        //this call is not ongoing
        return;
    }



    this->bjSip->setCallStatus(status);

    if (ci.state == PJSIP_INV_STATE_DISCONNECTED) {
        emit this->bjSip->callDeclined();
//        if(status == 480 || status == 486 || status == 487 || status == 503 || status == 603){
//            emit this->bjSip->busyBuddyCalled();
//        }

        if(this->bjSip->bjCall != NULL){
            delete this->bjSip->bjCall;
            this->bjSip->bjCall = NULL;
        }
        if(this->bjSip->incomingCall != NULL){
            delete this->bjSip->incomingCall;
            this->bjSip->incomingCall = NULL;
            this->bjSip->setHasIncomingCall(false);
        }



//        CallOpParam prm;
//        prm.statusCode = (pjsip_status_code)603;
//        this->bjSip->bjAccount->incomingCall->hangup(prm);

        //myAcc->removeCall(this);
        /* Delete the call */
        //delete this;
    }

    if(ci.state == PJSIP_INV_STATE_CONFIRMED){
        //Call accepted
        emit this->bjSip->callAccepted();
    }    
}

void BjCall::onCallMediaState(OnCallMediaStateParam &prm){
//    PJ_UNUSED_ARG(prm);

//    CallInfo ci = getInfo();
//    AudioMedia aud_med;
//    AudioMedia& play_dev_med =
//        BjEndpoint::instance().audDevManager().getPlaybackDevMedia();

//    try {
//        // Get the first audio media
//        aud_med = getAudioMedia(-1);
//    } catch(...) {
//        std::cout << "Failed to get audio media" << std::endl;
//        return;
//    }

//    if (!wav_player) {
//        wav_player = new AudioMediaPlayer();
//        try {
//            wav_player->createPlayer(
//                "../../../../tests/pjsua/wavs/input.16.wav", 0);
//        } catch (...) {
//            std::cout << "Failed opening wav file" << std::endl;
//            delete wav_player;
//            wav_player = NULL;
//        }
//    }

//    // This will connect the wav file to the call audio media
//    if (wav_player)
//        wav_player->startTransmit(aud_med);

//    if (!med_port) {
//        med_port = new BjAudioMediaPort();

//        MediaFormatAudio fmt;
//        fmt.type = PJMEDIA_TYPE_AUDIO;
//        fmt.clockRate = 16000;
//        fmt.channelCount = 1;
//        fmt.bitsPerSample = 16;
//        fmt.frameTimeUsec = 20000;

//        med_port->createPort("med_port", fmt);

//        // Connect the media port to the call audio media in both directions
//        med_port->startTransmit(aud_med);
//        aud_med.startTransmit(*med_port);
//    }

//    // And this will connect the call audio media to the sound device/speaker
//    aud_med.startTransmit(play_dev_med);


    CallInfo ci = getInfo();

//    for (unsigned i = 0; i < ci.media.size(); i++) {
//        if (ci.media[i].type==PJMEDIA_TYPE_AUDIO && getMedia(i)) {
//            this->aud_med = (AudioMedia *)getMedia(i);

//            // Connect the call audio media to sound device
//            AudDevManager &mgr = Endpoint::instance().audDevManager();
//            this->aud_med->startTransmit(mgr.getPlaybackDevMedia());
//            mgr.getCaptureDevMedia().startTransmit(*this->aud_med);
//        }
//    }

    for (unsigned i=0; i<ci.media.size(); ++i) {
        if (ci.media[i].type == PJMEDIA_TYPE_AUDIO) {
            this->aud_med = (AudioMedia *)this->getMedia(i);
            break;
        }
    }

    if (aud_med) {
        this->mic_media->startTransmit(*this->aud_med);
        this->aud_med->startTransmit(*this->speaker_media);
    }


}

void BjCall::onCallTransferRequest(OnCallTransferRequestParam &prm){
    /* Create new Call for call transfer */
    prm.newCall = new BjCall(*myAcc, this->bjSip);
}

void BjCall::onCallReplaceRequest(OnCallReplaceRequestParam &prm){
    /* Create new Call for call replace */
    prm.newCall = new BjCall(*myAcc, this->bjSip);
}

