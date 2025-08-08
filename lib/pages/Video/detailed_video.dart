import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

//import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
class DetailedVideo extends StatefulWidget {
  final String VideoTitle;
  final String VideoTopic;
  final String VideoUrl;

  const DetailedVideo({
    Key? key,
    required this.VideoTopic,
    required this.VideoUrl,
    required this.VideoTitle,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DetailedVideoState();
  }
}

class DetailedVideoState extends State<DetailedVideo> {
  late YoutubePlayerController controller;

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  late AudioCache audioCache;

  @override
  void initState() {
    String url = widget.VideoUrl;
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(mute: false, loop: false, autoPlay: true),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: controller),
      builder: (context, player) => Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              Center(
                child: Text(
                  '\nDIVINE VIDEO',
                  style: TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffe00040),
                    //// fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              player,
              SizedBox(height: 16),
              const SizedBox(height: 32),
              Text(
                widget.VideoTitle,
                style: TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 16,
                  color: Colors.black,

                  //// fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                widget.VideoTopic,
                style: TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 13,
                  color: Colors.grey[700],
                  //// fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              /* ElevatedButton(onPressed: () {
                          if (controller.value.isPlaying) {
                            controller.pause();
                          }
                          else {
                            controller.play();
                          }
                        }, child: const Text("Play"))*/
            ],
          ),
        ),
      ),
    );
  }
}
