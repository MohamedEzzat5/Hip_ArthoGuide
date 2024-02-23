import 'package:flutter/material.dart';
import 'package:physical_therapy_app/Features/exercise/presentation/widgets/exercise_body.dart';
import 'package:physical_therapy_app/core/utils/constances.dart';
import 'package:physical_therapy_app/core/utils/media_query_values.dart';
import 'package:physical_therapy_app/core/widgets/default_text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({
    super.key,
  });

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  late YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    super.initState();
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
              'https://youtu.be/5zcz-VuCgyY') ??
          'X7xtJIRF0NI',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        loop: true,
        hideThumbnail: true,
        isLive: false,
        forceHD: false,
        useHybridComposition: false,
      ),
    );
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _youtubePlayerController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: const DefaultText(
          text: 'التمارين',
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: context.height * 1 / 3.7,
            child: YoutubePlayer(
             // aspectRatio: 16 / 9,
              controller: _youtubePlayerController,
              showVideoProgressIndicator: true,
              progressColors: const ProgressBarColors(
                  playedColor: kPrimaryColor, handleColor: kPrimaryColor),
              progressIndicatorColor: kPrimaryColor,
              bottomActions: [
                CurrentPosition(),
                ProgressBar(
                  isExpanded: true,
                  colors: const ProgressBarColors(
                    playedColor: kPrimaryColor,
                    handleColor: kPrimaryColor,
                  ),
                ),
                RemainingDuration(),
              ],
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: ExerciseBody()),
          ),
        ],
      ),
    );
  }
}
