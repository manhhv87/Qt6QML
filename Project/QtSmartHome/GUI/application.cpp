#include "application.h"

Application::Application(QWindow *parent)
    : QQuickView{parent}
{
    connect(this, SIGNAL(afterRendering()), this, SLOT(afterRendering()));
    rendered = false;
    elapsedTimer.start();
}

void Application::afterRendering()
{
    if(!rendered) {
        rendered = true;
    }
}
