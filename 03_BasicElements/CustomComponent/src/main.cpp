#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);    

    QQmlApplicationEngine engine;

    // Register classes
    qmlRegisterSingletonType(QUrl(QStringLiteral("qrc:/modules/Style/qml/AppStyle.qml")), "Style", 0, 1, "AppStyle");
    qmlRegisterSingletonType(QUrl(QStringLiteral("qrc:/modules/Style/qml/FontStyle.qml")), "Style", 0, 1, "FontStyle");

    const QUrl url(QStringLiteral("qrc:/qml/Main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
