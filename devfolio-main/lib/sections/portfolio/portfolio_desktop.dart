import 'package:flutter/material.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/constants.dart';
import 'package:folio/utils/project_utils.dart';
import 'package:folio/utils/utils.dart';
import 'package:folio/widget/custom_text_heading.dart';
import 'package:folio/widget/project_card.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../provider/app_provider.dart';
import '../../utils/about_utils.dart';
import 'new_portfolio.dart';

class PortfolioDesktop extends StatefulWidget {
  const PortfolioDesktop({Key? key}) : super(key: key);

  @override
  State<PortfolioDesktop> createState() => _PortfolioDesktopState();
}

class _PortfolioDesktopState extends State<PortfolioDesktop> {
  late VideoPlayerController _controller;
  late VideoPlayerController _controller1;
  late Future<void> _initializeVideoPlayerFuture;
  late Future<void> _initializeVideoPlayer1Future;

  late Size size;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('photos/Recommendation Systems.mp4');
    _controller1 = VideoPlayerController.asset('photos/app.mp4');
    _initializeVideoPlayerFuture = initializeVideoPlayer(_controller);
    _initializeVideoPlayer1Future = initializeVideoPlayer(_controller1);

    _controller.setLooping(true);
    _controller.setVolume(1.0);
    _controller1.setLooping(true);
    _controller1.setVolume(1.0);
  }

  Future<void> initializeVideoPlayer(VideoPlayerController controller) async {
    try {
      await controller.initialize();
      setState(() {
        controller.play();
      });
    } catch (error) {
      print('Error initializing video player: $error');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Duration _progressPosition = Duration.zero;
    final appProvider = Provider.of<AppProvider>(context);
    bool isHover = false;
    bool _isPlaying = false;

    size = MediaQuery.of(context).size;
    return Container(
      padding: Space.h!,
      child: Column(
        children: [
          const CustomSectionHeading(
            text: "\nPortfolio",
          ),
          const CustomSectionSubHeading(
            text: "Here are few samples of my previous work :)\n\n",
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Project-1",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                margin: Space.h,
                padding: Space.all(),
                // color: Colors.red,
                width: AppDimensions.normalize(250),
                height: AppDimensions.normalize(110),
                child: Text(
                  AboutUtils.aboutProject1,
                  style: AppText.b2!.copyWith(
                    height: 2,
                    letterSpacing: 1.1,
                    fontFamily: 'Montserrat',
                    fontSize: AppDimensions.normalize(5),
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                  margin: Space.h,
                  padding: Space.all(),
                  width: AppDimensions.normalize(250),
                  height: AppDimensions.normalize(110),
                  decoration: BoxDecoration(
                    color: appProvider.isDark ? Colors.grey[900] : Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: isHover
                        ? [
                            BoxShadow(
                              color: AppTheme.c!.primary!.withAlpha(100),
                              blurRadius: 12.0,
                              offset: const Offset(0.0, 0.0),
                            )
                          ]
                        : [
                            BoxShadow(
                              color: Colors.black.withAlpha(100),
                              blurRadius: 12.0,
                              offset: const Offset(0.0, 0.0),
                            )
                          ],
                  ),
                  child: FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (!_isPlaying) {
                          _controller
                              .play(); // Autoplay the video if not already playing
                          _isPlaying = true;
                        }

                        return AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: Stack(
                            children: [
                              VideoPlayer(_controller),
                            ],
                          ),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        // Display a progress indicator while waiting for the video to load
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        // Handle other connection states, such as ConnectionState.none or ConnectionState.active
                        return Text(
                            'Connection state: ${snapshot.connectionState}');
                      }
                    },
                  )),
              SizedBox(
                height: 30,
              ),
              Text(
                "Project-2",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                margin: Space.h,
                padding: Space.all(),
                // color: Colors.red,
                width: AppDimensions.normalize(250),
                height: AppDimensions.normalize(110),
                child: Text(
                  AboutUtils.aboutProject2,
                  style: AppText.b2!.copyWith(
                    height: 2,
                    letterSpacing: 1.1,
                    fontFamily: 'Montserrat',
                    fontSize: AppDimensions.normalize(5),
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                  margin: Space.h,
                  padding: Space.all(),
                  width: AppDimensions.normalize(110),
                  height: AppDimensions.normalize(140),
                  decoration: BoxDecoration(
                    color: appProvider.isDark ? Colors.grey[900] : Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: isHover
                        ? [
                            BoxShadow(
                              color: AppTheme.c!.primary!.withAlpha(100),
                              blurRadius: 12.0,
                              offset: const Offset(0.0, 0.0),
                            )
                          ]
                        : [
                            BoxShadow(
                              color: Colors.black.withAlpha(100),
                              blurRadius: 12.0,
                              offset: const Offset(0.0, 0.0),
                            )
                          ],
                  ),
                  child: FutureBuilder(
                    future: _initializeVideoPlayer1Future,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (!_isPlaying) {
                          _controller1
                              .play(); // Autoplay the video if not already playing
                          _isPlaying = true;
                        } // Autoplay the video if not already playing

                        return AspectRatio(
                          aspectRatio: _controller1.value.aspectRatio,
                          child: Stack(
                            children: [
                              VideoPlayer(_controller1),
                            ],
                          ),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        // Display a progress indicator while waiting for the video to load
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        // Handle other connection states, such as ConnectionState.none or ConnectionState.active
                        return Text(
                            'Connection state: ${snapshot.connectionState}');
                      }
                    },
                  ))
            ],
          ),
          Space.y2!,
          SizedBox(
            height: AppDimensions.normalize(14),
            width: AppDimensions.normalize(50),
            child: OutlinedButton(
              onPressed: () => openURL(StaticUtils.gitHub),
              child: Text(
                'See More',
                style: AppText.l1b,
              ),
            ),
          )
        ],
      ),
    );
  }
}
