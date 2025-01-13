#include <QFont>
#include <QFontDatabase>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>

#include "application.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
<<<<<<< HEAD

    int latoID = QFontDatabase::addApplicationFont(":/SmartHome/Fonts/Lato-Regular.ttf");
    QStringList loadedFontFamilies = QFontDatabase::applicationFontFamilies(latoID);
    if (!loadedFontFamilies.empty()) {
        QString fontName = loadedFontFamilies.at(0);
        QGuiApplication::setFont(QFont(fontName));
    } else {
        qWarning("Error: fail to load Lato font");
    }
=======
    QQuickStyle::setStyle("Basic");

    QFontDatabase::addApplicationFont(":/SmartHome/Fonts/Lato-Regular.ttf");
    QFont font("Lato");
    font.setPointSize(16);
    QGuiApplication::setFont(font);
>>>>>>> 16d3e44a7dcd16bd3ec27412e3a2b136a1e36860

    Application *_app = new Application();
    Q_UNUSED(_app)

    QQmlApplicationEngine engine;
    engine.addImportPath(QStringLiteral("qrc:/"));  // Install SmartHome modules

    const QUrl url(QStringLiteral("qrc:/main/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
