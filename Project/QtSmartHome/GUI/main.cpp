#include <QFont>
#include <QFontDatabase>
#include <QtQuick/QQuickView>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "application.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QFontDatabase::addApplicationFont(":/SmartHome/Fonts/Lato-Regular.ttf");
    QFont font("Lato");
    font.setPointSize(16);
    // font.setPixelSize(16);
    QGuiApplication::setFont(font);

    QQmlApplicationEngine engine;
    engine.addImportPath("qrc:/");  // Install SmartHome modules

    Application viewer;
    viewer.setSource(QUrl(QStringLiteral("qrc:/main.qml")));
    QObject::connect((QObject*)viewer.engine(), SIGNAL(quit()), &app, SLOT(quit()));
    viewer.resize(800, 480);
    viewer.setResizeMode(QQuickView::SizeRootObjectToView);
    viewer.show();

    return app.exec();
}
