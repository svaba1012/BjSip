#include "bjaccount.h"

BjAccount::BjAccount(BjSip* bjSip){
    this->bjSip = bjSip;
}


BjAccount::~BjAccount(){
    this->shutdown();
//    std::cout << "*** Account is being deleted: No of calls="
//              << calls.size() << std::endl;

//    for (std::vector<Call *>::iterator it = calls.begin();
//         it != calls.end(); )
//    {
//        delete (*it);
//        it = calls.erase(it);
//    }
}

void BjAccount::removeCall(Call *call){
//    for (std::vector<Call *>::iterator it = calls.begin();
//         it != calls.end(); ++it)
//    {
//        if (*it == call) {
//            calls.erase(it);
//            break;
//        }
//    }
}

void BjAccount::onRegState(OnRegStateParam &prm){
    AccountInfo ai = getInfo();
    std::cout << (ai.regIsActive? "*** Register: code=" : "*** Unregister: code=")
              << prm.code << std::endl;
}

void BjAccount::onIncomingCall(OnIncomingCallParam &iprm){
    Call *call = new BjCall(*this, this->bjSip, iprm.callId);
    CallInfo ci = call->getInfo();
//    CallOpParam prm;

//    std::cout << "*** Incoming Call: " <<  ci.remoteUri << " ["
//              << ci.stateText << "]" << std::endl;

//    prm.statusCode = (pjsip_status_code)200;
//    calls.push_back(call);
    if(this->bjSip->hasIncomingCall || this->bjSip->bjCall != NULL){
        CallOpParam prm;
        prm.statusCode = PJSIP_SC_BUSY_HERE;
        call->hangup(prm);
        delete call;
        return;
    }
    this->bjSip->incomingCall = call;
    this->bjSip->setHasIncomingCall(true);
    this->bjSip->setIncomingBuddyUri(ci.remoteUri);
    this->bjSip->setIncomingBuddyExtension(stoi(ci.remoteUri.substr(1,2)));
//    call->answer(prm);
}
