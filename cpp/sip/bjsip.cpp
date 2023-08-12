#include "bjsip.h"

BjSip::BjSip(QObject *parent)
    : QObject{parent}
{
    this->bjAccount = NULL;
    this->hasIncomingCall = false;
    this->incomingBuddyUri = "";
    this->incomingBuddyExtension = -1;
    this->incomingCall = NULL;
    this->bjCall = NULL;

    BjEndpoint* ep = new BjEndpoint();
    try {
        ep->libCreate();
    } catch(Error& err) {
        cout << "Startup error: " << err.info() << endl;
    }
    try {
        EpConfig ep_cfg;
        // Specify customization of settings in ep_cfg
        ep_cfg.medConfig.sndAutoCloseTime = 0;
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

BjSip::~BjSip(){
    cout << "Ende" << endl;
    if(this->bjAccount == NULL){
        return;
    }
    if(this->bjCall != NULL){
        this->hangOnOngoingCall();
    }
    if(this->hasIncomingCall){
        this->cancelIncomingCall();
    }
    delete this->bjAccount;
}

void BjSip::setApp(QGuiApplication* app){
    this->app = app;
    this->srCyTranslator.load(":/translation/translationSRC");
    app->installTranslator(&this->srCyTranslator);
}

void BjSip::registerAccount(QString extension){
    AccountConfig acc_cfg;
    acc_cfg.idUri = "sip:" + extension.toStdString() + "@" + "192.168.1.43";
    acc_cfg.regConfig.registrarUri = "sip:192.168.1.43";
    acc_cfg.sipConfig.authCreds.push_back(AuthCredInfo("digest", "*", extension.toStdString(), 0, "123") );
    BjAccount *acc = new BjAccount(this);
    try {
        acc->create(acc_cfg);
    } catch(Error& err) {
        //Neuspesna prijava pokusaj opet kasnije, vrv server nedostupan
        cout << "Account creation error: " << err.info() << endl;
    }
    this->bjAccount = acc;
}




void BjSip::makeCall(int extension){
    QString buddyExtension = QString::number(extension);
    BjCall *call = new BjCall(*this->bjAccount, this);
    CallOpParam prm(true); // Use default call settings
    try {
        call->makeCall("sip:" + buddyExtension.toStdString() + "@" + "192.168.1.43", prm);
    } catch(Error& err) {
        cout << err.info() << endl;
    }
    this->bjCall = call;
    emit this->callStarted();
}


void BjSip::answerIncomingCall(){
    CallOpParam prm;
    prm.statusCode = (pjsip_status_code)200;
    CallInfo callInfo = this->incomingCall->getInfo();

//    int extension = stoi(callInfo.remoteUri.substr(1, 1));
    this->incomingCall->answer(prm);
    this->setHasIncomingCall(false);
    this->bjCall = (BjCall*) this->incomingCall;
    this->incomingCall = NULL;
    //! NOT TESTED
}

void BjSip::cancelIncomingCall(){
    CallOpParam prm;
    prm.statusCode = (pjsip_status_code)603;
    this->incomingCall->hangup(prm);
    this->setHasIncomingCall(false);
    delete this->incomingCall;
    this->incomingCall = NULL;
}

void BjSip::hangOnOngoingCall(){
    CallOpParam prm;
    prm.statusCode = (pjsip_status_code)608;
    this->bjCall->hangup(prm);
    delete this->bjCall;
    this->bjCall = NULL;
}

void BjSip::changeLanguage(QString language){
    if(language == QString("en")){
        cout << "Menjam jezik " << language.toStdString() << endl;
        app->removeTranslator(&this->srCyTranslator);
        app->removeTranslator(&this->srLatTranslator);
    }else if(language == QString("src")){
        this->srCyTranslator.load(":/translation/translationSRC");
        app->installTranslator(&this->srCyTranslator);
    }else if(language == QString("sr")){
        this->srLatTranslator.load(":/translation/translationSR");
        app->installTranslator(&this->srLatTranslator);
    }
    emit languageChanged();
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

int BjSip::getIncomingBuddyExtension(){
    return this->incomingBuddyExtension;
}
void BjSip::setIncomingBuddyExtension(int ext){
    this->incomingBuddyExtension = ext;
    emit incomingBuddyExtensionChanged();
}

int BjSip::getCallStatus(){
    return this->callStatus;
}
void BjSip::setCallStatus(int status){
    this->callStatus = status;
    emit callStatusChanged();
}

QString BjSip::getEmptyString(){
    return "";
}
