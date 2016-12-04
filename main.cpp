#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

//    QQmlApplicationEngine engine;
//    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    QQuickView *viewer = new QQuickView();

    viewer->setSource(QUrl(QStringLiteral("qrc:/main.qml")));
    viewer->show();

    return app.exec();
}
