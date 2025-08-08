import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

//import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
class DetailedMusic extends StatefulWidget {
  final String MusicTitle;
  final String MusicTopic;
  final String MusicThumbUrl;
  final String MusicUrl;

  const DetailedMusic({
    Key? key,
    required this.MusicTitle,
    required this.MusicTopic,
    required this.MusicThumbUrl,
    required this.MusicUrl,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DetailedMusicState();
  }
}

class DetailedMusicState extends State<DetailedMusic> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  late AudioCache audioCache;

  @override
  void initState() {
    ///Listen to states
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    /// Listen  to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    /// Listen  to audio position
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
    super.initState();
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
          child: Column(
            children: [
              Center(
                child: Text(
                  '\nMUSIC DETAILS',
                  style: TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffe00040),
                    //// fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.MusicThumbUrl,
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                widget.MusicTopic,
                style: TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 15,
                  color: Colors.black,
                  //// fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.MusicTitle,
                style: TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 13,
                  color: Colors.grey[700],
                  //// fontWeight: FontWeight.bold,
                ),
              ),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(formatTime(position)),
                    Text(formatTime(duration - position)),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 35,
                child: IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  iconSize: 50,
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      String url = widget.MusicUrl;
                      print(url);
                      await audioPlayer.play(UrlSource(url));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
