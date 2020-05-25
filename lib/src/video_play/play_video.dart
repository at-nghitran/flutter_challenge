import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';

class PlayVideoPage extends StatefulWidget {
  @override
  PlayVideoPageState createState() => PlayVideoPageState();
}

class PlayVideoPageState extends State<PlayVideoPage> {
  double _start = 0.0;
  double _end = 60.0;
  double _endStartPick = 0.0;
  int currentIndex = 0;
  bool _isloading = false;
  static List<String> _videoList = [
    "http://techslides.com/demos/sample-videos/small.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"
  ];
  final FlutterFFmpeg _flutterFFmpeg = new FlutterFFmpeg();
  final FlutterFFmpegConfig _flutterFFmpegConfig = new FlutterFFmpegConfig();
  final FlutterFFprobe _flutterFFprobe = new FlutterFFprobe();

  // var arguments = ["-i", _videoList[0]];

  VideoPlayerController _videoPlayerController;
  // VideoPlayerController _videoPlayerController = VideoPlayerController.asset(
  //   "assets/videos/video3.mp4",
  // );

  @override
  void initState() {
    super.initState();
    _getFile();
    // _videoPlayerController
    //   ..initialize().then((_) {
    //     setState(() {
    //       _end = _videoPlayerController.value.duration.inSeconds.toDouble();
    //     });
    //     print('Size: ${_videoPlayerController.value.size}');
    //     print('Duaration: ${_videoPlayerController.value.duration.inSeconds}');
    //     print('Volume: ${_videoPlayerController.value.volume}');
    //   });

    // _videoPlayerController
    //   ..addListener(() {
    //     _onVideoChange();
    //     setState(() {});
    //   });
  }

  _getFile() async {
    setState(() {
      _isloading = true;
    });
    // await _flutterFFmpeg
    //     .executeWithArguments(arguments)
    //     .then((rc) => print("FFmpeg process exited with rc $rc"));
    // await _flutterFFmpegConfig.getLastReturnCode().then((rc) => print("Last rc: $rc"));
    // await _flutterFFmpegConfig.getLastCommandOutput().then((output) => print("Last command output: $output"));
    // await _flutterFFmpegConfig.registerNewFFmpegPipe().then((path) {
    //   print("New ffmpeg pipe at $path");
    //   _videoPlayerController = VideoPlayerController.network('$path')
    //     ..initialize().then((_) {
    //       setState(() {
    //         _end = _videoPlayerController.value.duration.inSeconds.toDouble();
    //       });
    //     })
    //     ..addListener(() {
    //       _onVideoChange();
    //       setState(() {});
    //     });
    // });
    await _flutterFFmpegConfig.registerNewFFmpegPipe().then((val) async {
      try {
        var arguments = ["-i", 'assets/videos/file.txt', "-c:v", "mpeg4", "output.mp4"];
        await _flutterFFmpeg.executeWithArguments(arguments).then((rc) {
          debugPrint("result ${rc == 0 ? true : false}");
          debugPrint("______PIPE ADDRESS______ = $val");
        });
        _flutterFFmpegConfig.getLastCommandOutput().then((output) => print("Last command output: $output"));
      } catch (e) {
        print(e);
      }

      _videoPlayerController = VideoPlayerController.network('$val')
        ..initialize().then((_) {
          setState(() {
            _end = _videoPlayerController.value.duration.inSeconds.toDouble();
          });
        })
        ..addListener(() {
          _onVideoChange();
          setState(() {});
        });
    });
    setState(() {
      _isloading = false;
    });
  }

  _onVideoChange() {
    setState(() {
      _start = _videoPlayerController.value.position.inSeconds.toDouble();
    });
    if (_videoPlayerController.value.position.inSeconds.toDouble() >= _end) {
      _videoPlayerController.pause();
    }
  }

  _changeVideoToure(double value) {
    print('change start $value');
    _videoPlayerController.seekTo(Duration(seconds: value.toInt()));
  }

  @override
  void dispose() {
    _videoPlayerController.removeListener(() {});
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black12,
      ),
      body: _isloading
          ? Center(child: CircularProgressIndicator())
          : CustomScrollView(
              slivers: <Widget>[
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: <Widget>[
                      _videoPlayerController.value.initialized
                          ? AspectRatio(
                              aspectRatio:
                                  _videoPlayerController.value.aspectRatio,
                              child: VideoPlayer(_videoPlayerController),
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width <
                                      MediaQuery.of(context).size.height
                                  ? MediaQuery.of(context).size.width
                                  : 400,
                              color: Colors.black26,
                              child: Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.black,
                                  strokeWidth: 1,
                                ),
                              ),
                            ),
                      SizedBox(height: 50),
                      if (_videoPlayerController.value.initialized)
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 30,
                          child: RangeSlider(
                            labels:
                                RangeLabels(_start.toString(), _end.toString()),
                            // onChangeEnd: (value) {
                            //   setState(() {
                            //     _end = value.end;
                            //   });
                            // },
                            // onChangeStart: (value) {
                            //   setState(() {
                            //     _start = value.start;
                            //   });
                            // },
                            onChanged: (value) {
                              print('valueEnd: ${value.end} end: $_end');
                              print(
                                  'valueStart: ${value.start} start: $_start');
                              if (value.end != _end) {
                                setState(() {
                                  _end = value.end;
                                });
                              }
                              if (value.start != _start) {
                                setState(() {
                                  _start = value.start;
                                  _endStartPick = value.start;
                                  _changeVideoToure(_start);
                                });
                              }
                            },
                            min: 0,
                            max: _videoPlayerController.value.duration.inSeconds
                                .toDouble(),
                            values: RangeValues(_start, _end),
                            inactiveColor: Colors.blueGrey,
                            divisions:
                                _videoPlayerController.value.duration.inSeconds,
                          ),
                        ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            // _buildButton(() {}, FontAwesomeIcons.backward),
                            _buildButton(() {
                              _videoPlayerController.value.isPlaying
                                  ? _videoPlayerController.pause()
                                  : _videoPlayerController.play();
                            }, FontAwesomeIcons.playCircle),
                            _buildButton(
                              () {
                                setState(() {
                                  _start = _endStartPick;
                                });
                                _videoPlayerController
                                  ..seekTo(
                                      Duration(seconds: _endStartPick.toInt()))
                                  ..play();
                              },
                              FontAwesomeIcons.undoAlt,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Stack _buildButton(Function onTap, IconData icon) {
    return Stack(
      children: <Widget>[
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Positioned(
          top: 5,
          left: 5,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 5.0),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 10.0),
                    blurRadius: 10,
                  ),
                ]),
            child: IconButton(
              icon: FaIcon(icon),
              color: Colors.blue,
              onPressed: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
