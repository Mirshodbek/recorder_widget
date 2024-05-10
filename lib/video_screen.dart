import 'package:flutter/material.dart';
import 'package:render/render.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({
    super.key,
    required this.renderResult,
  });

  final RenderResult? renderResult;

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController? controller;

  @override
  Widget build(BuildContext context) {
    if (widget.renderResult == null) {
      return const SizedBox.shrink();
    }
    return FutureBuilder(
      future: () async {
        controller = VideoPlayerController.file(
          widget.renderResult!.output,
        );
        await controller!.initialize();
        await controller!.setLooping(true);
        controller!.play();
        return controller;
      }(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          final size =
              (widget.renderResult!.output.lengthSync() / (1024 * 1024));
          return Stack(
            children: [
              SizedBox(
                width: snapshot.data?.value.size.width ?? 0,
                height: snapshot.data?.value.size.height ?? 0,
                child: VideoPlayer(snapshot.data!),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    VideoProgressIndicator(
                      snapshot.data!,
                      allowScrubbing: true,
                      colors: const VideoProgressColors(
                        backgroundColor: Colors.red,
                        bufferedColor: Colors.black,
                        playedColor: Colors.blueAccent,
                      ),
                    ),
                    const Divider(thickness: 1),
                    Text(
                      "Total render time: ${widget.renderResult!.totalRenderTime.inMinutes}:"
                      "${widget.renderResult!.totalRenderTime.inSeconds}:"
                      "${widget.renderResult!.totalRenderTime.inMilliseconds}\n"
                      "Format: ${widget.renderResult!.format.extension}\n"
                      "Video duration: ${controller?.value.duration}\n"
                      "Size: ${(size < 1 ? size * 1024 : size).toStringAsFixed(3)} ${size < 1 ? 'kb' : 'MB'}",
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: Text(
              "Error loading file: ${snapshot.error}",
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
          );
        }
      },
    );
  }
}
