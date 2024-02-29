import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:physical_therapy_app/core/utils/app_router.dart';
import 'package:physical_therapy_app/core/utils/constances.dart';
import 'package:physical_therapy_app/core/widgets/default_button.dart';
import 'package:physical_therapy_app/core/widgets/default_text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../core/utils/strings.dart';

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
      initialVideoId:
          YoutubePlayer.convertUrlToId('https://youtu.be/j5EfDxKFruU') ??
              'X7xtJIRF0NI',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            YoutubePlayer(
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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const DefaultText(
                      text: AppStrings.exerciseText1,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                  const SizedBox(
                    height: 15,
                  ),
                  DefaultMaterialButton(
                      text: 'تمارين التمدد',
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kExerciseBody1);
                      },
                      height: 60,
                      elevation: 3,
                      fontSize: 16),
                  const SizedBox(
                    height: 15,
                  ),
                  DefaultMaterialButton(
                      text: 'تمارين التقوية',
                      onPressed: () {GoRouter.of(context).push(AppRouter.kExerciseBody2);},
                      height: 60,
                      elevation: 3,
                      fontSize: 16),
                  const SizedBox(
                    height: 15,
                  ),
                  DefaultMaterialButton(
                      text: 'تمارين لإستعادة المدي الحركي',
                      onPressed: () {GoRouter.of(context).push(AppRouter.kExerciseBody3);},                      height: 60,
                      elevation: 3,
                      fontSize: 16),
                  const SizedBox(
                    height: 15,
                  ),
                  DefaultMaterialButton(
                      text: 'تمارين لتحسين التوازن',
                      onPressed: () {GoRouter.of(context).push(AppRouter.kExerciseBody4);},                      height: 60,
                      elevation: 3,
                      fontSize: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
