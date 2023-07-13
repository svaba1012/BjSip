#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include <QQmlContext>
#include <iostream>

#include "./cpp/sip/bjsip.h"

using namespace std;


int main(int argc, char *argv[])
{

    //loading fontawesome fonts
//    QFontDatabase fontDatabase;
//    if (fontDatabase.addApplicationFont(":/fonts/Fonts/fa-regular.otf") == -1)
//        qWarning() << "Failed to load fontawesome.otf";


    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    BjSip bjSip;

    engine.rootContext()->setContextProperty("bjSip", &bjSip);


    const QUrl url(u"qrc:/bjSip/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.load(url);
    //__________________________________________________________________________________
//    QObject * callView = engine.rootObjects().at(0)->findChild<QObject *>("callView");
//    if (callView) cout << "found it";


    return app.exec();
}
