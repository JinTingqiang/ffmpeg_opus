#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    // 设置窗口图标（路径必须是 qrc 资源）
    app.setWindowIcon(QIcon(":/res/ffmpeg_ico.png"));

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/MyQmlApp/qml/main.qml"_qs);

    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection
    );

    engine.load(url);

    return app.exec();
}
