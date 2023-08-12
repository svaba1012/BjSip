#ifndef BJCALL_H
#define BJCALL_H

#include <iostream>
#include <pjsua2.hpp>
#include "./bjaccount.h"
#include "./bjendpoint.h"
#include "./bjaudiomediaport.h"
#include "./bjsip.h"

using namespace pj;

class BjAccount;
class BjSip;

class BjCall : public Call{
    private:
        BjAccount *myAcc;
        BjSip* bjSip;
//        AudioMediaPlayer *wav_player;
//        AudioMediaPort *med_port;
        AudioMedia *aud_med;

        AudioMedia* speaker_media;
        AudioMedia* mic_media;

    public:
        BjCall(Account &acc, BjSip* bjSip, int call_id = PJSUA_INVALID_ID);
        ~BjCall();
        virtual void onCallState(OnCallStateParam &prm);
        virtual void onCallTransferRequest(OnCallTransferRequestParam &prm);
        virtual void onCallReplaceRequest(OnCallReplaceRequestParam &prm);
        virtual void onCallMediaState(OnCallMediaStateParam &prm);
};

#endif // BJCALL_H



