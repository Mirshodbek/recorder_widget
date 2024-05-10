import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:render/render.dart';

import 'nav_bar/nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MotionRecorder<MotionFormat>? stream;
  RenderResult? result;
  final RenderController renderController =
      RenderController(logLevel: LogLevel.debug);
  int currentIndex = 0;

  void switchTab(int value) {
    setState(() => currentIndex = value);
    switch (value) {
      case 0:
        context.goNamed('/');
        break;
      case 1:
        context.goNamed('order');
        break;
      case 2:
        context.goNamed('video', extra: result);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Render(
      controller: renderController,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            stream == null ? '' : 'Recording',
            style: const TextStyle(fontSize: 10, color: Colors.red),
          ),
          actions: [
            if (stream == null)
              TextButton(
                onPressed: () {
                  setState(() {});
                  stream = renderController.recordMotion();
                },
                child: const Text('Start'),
              )
            else
              TextButton(
                onPressed: () async {
                  result = await stream!.stop();
                  setState(() {
                    stream = null;
                  });
                  // GallerySaver.saveVideo(result.output.path);
                },
                child: const Text('Stop'),
              ),
          ],
        ),
        body: widget.child,
        bottomNavigationBar: NavBar(
          current: currentIndex,
          switchTo: switchTab,
        ),
      ),
    );
  }
}
