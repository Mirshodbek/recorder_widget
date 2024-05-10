# test_app_recorder

A new Flutter project.

## Getting Started

Для запись видео использован пакет - [render](https://pub.dev/packages/render).

В папке home_screen установлен пакет запись видео, чтобы мог записывать вес процесс приложение. А
все
экраны связаны с экраном home_screen.

Использование:

    final RenderController renderController = RenderController(logLevel: LogLevel.debug);

    MotionRecorder<MotionFormat>? stream;

    RenderResult? result;

    @override
    Widget build(BuildContext context) {
        return Render(
            controller: renderController,
            child:...
            );


Через renderController.recordMotion() начинает запись видео. А он возвращает класс MotionRecorder. "
stream = renderController.recordMotion();"

И при остановке запись возвращает класс RenderResult. И там находится все данные файлы. "result = await stream?.stop();""