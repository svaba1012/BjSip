#ifndef BJSIP_H
#define BJSIP_H

#include <QObject>
#include <QGuiApplication>
#include <QTranslator>
#include <pjsua2.hpp>
#include <iostream>
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
    Q_PROPERTY(int incomingBuddyExtension READ getIncomingBuddyExtension WRITE setIncomingBuddyExtension NOTIFY incomingBuddyExtensionChanged)
    Q_PROPERTY(int callStatus READ getCallStatus WRITE setCallStatus NOTIFY callStatusChanged)
    Q_PROPERTY(QString emptyString READ getEmptyString NOTIFY languageChanged)

    private:
    public:
        BjEndpoint* bjEndpoint;
        BjCall* bjCall;
        BjAccount* bjAccount;
        Call* incomingCall;
        bool isBusy;
        QTranslator srCyTranslator;
        QTranslator srLatTranslator;

        QGuiApplication* app;
        void setApp(QGuiApplication* app);

        bool hasIncomingCall;
        bool getHasIncomingCall();
        void setHasIncomingCall(bool call);

        string incomingBuddyUri;
        string getIncomingBuddyUri();
        void setIncomingBuddyUri(string uri);

        int incomingBuddyExtension;
        int getIncomingBuddyExtension();
        void setIncomingBuddyExtension(int ext);

        int callStatus;
        int getCallStatus();
        void setCallStatus(int status);

        QString getEmptyString();

        ~BjSip();

    signals:
        void hasIncomingCallChanged();
        void incomingBuddyUriChanged();
        void incomingBuddyExtensionChanged();
        void callStatusChanged();

        void callStarted();
        void callAccepted();
        void callDeclined();
        void busyBuddyCalled();
        void languageChanged();


    public:
        explicit BjSip(QObject *parent = nullptr);

    public slots:
        void registerAccount(QString extension);
        void makeCall(int buddyExtension);
        void answerIncomingCall();
        void cancelIncomingCall();
        void hangOnOngoingCall();
        void changeLanguage(QString language);
};

#endif // BJSIP_H
