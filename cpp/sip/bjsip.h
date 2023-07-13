#ifndef BJSIP_H
#define BJSIP_H

#include <QObject>
#include <pjsua2.hpp>
#include "./bjendpoint.h"
#include "./bjaccount.h"
#include "./bjcall.h"

#define SIP_SERVER_DOMAIN "192.168.1.43"

using namespace std;

class BjAccount;
class BjCall;

class BjSip : public QObject{
    Q_OBJECT
    Q_PROPERTY(bool hasIncomingCall READ getHasIncomingCall WRITE setHasIncomingCall NOTIFY hasIncomingCallChanged)
    Q_PROPERTY(string incomingBuddyUri READ getIncomingBuddyUri WRITE setIncomingBuddyUri NOTIFY incomingBuddyUriChanged)
    private:
        BjEndpoint* bjEndpoint;
        BjCall* bjCall;
    public:
        BjAccount* bjAccount;
        bool hasIncomingCall;
        string incomingBuddyUri;
        bool getHasIncomingCall();
        void setHasIncomingCall(bool call);
        string getIncomingBuddyUri();
        void setIncomingBuddyUri(string uri);

    signals:
        void hasIncomingCallChanged();
        void incomingBuddyUriChanged();

        void callAccepted();
        void callDeclined();

    public:
        explicit BjSip(QObject *parent = nullptr);

    public slots:
        void registerAccount(QString extension);
        void makeCall(int buddyExtension);
        void answerIncomingCall();
        void cancelIncomingCall();

};

#endif // BJSIP_H
