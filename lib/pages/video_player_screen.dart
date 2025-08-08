/*
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      'https://www.youtube.com/watch?v=QHJ9Yp_OKd4',
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(''),
      // ),
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return AspectRatio(
              //aspectRatio: _controller.value.aspectRatio,
              aspectRatio:16/10,
              // Use the VideoPlayer widget to display the video.
              child:
              Stack(children:[
              VideoPlayer(_controller),
              Align(alignment: Alignment.center, child:
              OutlinedButton(
                onPressed: () {setState(() {
                      if (_controller.value.isPlaying) {
                      _controller.pause();
                      } else {
                      _controller.play();
                      }});},
                child:  Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow,color: Colors.white,size:40,),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 4.0, color: Colors.white),
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                ),
              ))


              ]),

            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),


    );
  }
}
*/
