#ifndef BJACCOUNT_H
#define BJACCOUNT_H

#include <pjsua2.hpp>
#include <iostream>
#include "./bjcall.h"
#include "./bjsip.h"


using namespace  pj;

class BjSip;

class BjAccount :  public Account {
    public:
        std::vector<Call *> calls;
        Call* incomingCall;
        bool hasIncomingCall;
        BjSip* bjSip;
    public:
        BjAccount(BjSip* bjSip);
        ~BjAccount();
        void removeCall(Call *call);
        virtual void onRegState(OnRegStateParam &prm);
        virtual void onIncomingCall(OnIncomingCallParam &iprm);

};

#endif // BJACCOUNT_H



