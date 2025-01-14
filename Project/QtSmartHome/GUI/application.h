#ifndef APPLICATION_H
#define APPLICATION_H

#include <QtQuick/QQuickView>
#include <QElapsedTimer>

class Application : public QQuickView
{
    Q_OBJECT
public:
    explicit Application(QWindow *parent = 0);

private:
    bool rendered;
    QElapsedTimer elapsedTimer;

signals:

public slots:
    void afterRendering();

};

#endif // APPLICATION_H
