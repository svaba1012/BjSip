#include "bjsip.h"

BjSip::BjSip(QObject *parent)
    : QObject{parent}
{
    this->hasIncomingCall = false;
    this->incomingBuddyUri = "";
    BjEndpoint* ep = new BjEndpoint();
    try {
        ep->libCreate();
    } catch(Error& err) {
        cout << "Startup error: " << err.info() << endl;
    }
    try {
        EpConfig ep_cfg;
        // Specify customization of settings in ep_cfg
        ep->libInit(ep_cfg);
    } catch(Error& err) {
        cout << "Initialization error: " << err.info() << endl;
    }

    try {
        TransportConfig tcfg;
        tcfg.port = 5060;
        TransportId tid = ep->transportCreate(PJSIP_TRANSPORT_UDP, tcfg);
    } catch(Error& err) {
        cout << "Transport creation error: " << err.info() << endl;
    }

    try {
        ep->libStart();
    } catch(Error& err) {
        cout << "Startup error: " << err.info() << endl;
    }
    this->bjEndpoint = ep;
}


void BjSip::registerAccount(QString extension){
    AccountConfig acc_cfg;
    acc_cfg.idUri = "sip:" + extension.toStdString() + "@" + "192.168.43.43";
    acc_cfg.regConfig.registrarUri = "sip:192.168.43.43";
    acc_cfg.sipConfig.authCreds.push_back(AuthCredInfo("digest", "*", extension.toStdString(), 0, "123") );
    BjAccount *acc = new BjAccount(this);
    try {
        acc->create(acc_cfg);
    } catch(Error& err) {
        cout << "Account creation error: " << err.info() << endl;
    }
    this->bjAccount = acc;

}

void BjSip::makeCall(int extension){
    QString buddyExtension = QString::number(extension);
    BjCall *call = new BjCall(*this->bjAccount, this);
    CallOpParam prm(true); // Use default call settings
    try {
        call->makeCall("sip:" + buddyExtension.toStdString() + "@" + "192.168.43.43", prm);
    } catch(Error& err) {
        cout << err.info() << endl;
    }
    this->bjCall = call;
}


void BjSip::answerIncomingCall(){
    CallOpParam prm;
    prm.statusCode = (pjsip_status_code)200;
    CallInfo callInfo = this->bjAccount->incomingCall->getInfo();
    int extension = stoi(callInfo.remoteUri.substr(1, 1));
    this->bjAccount->incomingCall->answer(prm);
    this->setHasIncomingCall(false);


    //! NOT TESTED


}

void BjSip::cancelIncomingCall(){
    CallOpParam prm;
    prm.statusCode = (pjsip_status_code)603;
    this->bjAccount->incomingCall->hangup(prm);
    this->setHasIncomingCall(false);
}


//QML properties seters and geters
void BjSip::setHasIncomingCall(bool hasIncoming){
    this->hasIncomingCall = hasIncoming;
    emit hasIncomingCallChanged();
}
bool BjSip::getHasIncomingCall(){
    return this->hasIncomingCall;
}

string BjSip::getIncomingBuddyUri(){
    return this->incomingBuddyUri;
}
void BjSip::setIncomingBuddyUri(string uri){
    this->incomingBuddyUri = uri;
    emit incomingBuddyUriChanged();
}



