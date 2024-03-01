import 'package:flutter/material.dart';
import 'package:physical_therapy_app/Features/exercise/presentation/widgets/custom_divider.dart';
import 'package:physical_therapy_app/Features/exercise/presentation/widgets/custom_exercise_row.dart';
import 'package:physical_therapy_app/core/utils/strings.dart';
import 'package:physical_therapy_app/generated/assets.dart';

import '../../../../core/widgets/default_text.dart';

class ExerciseBody2 extends StatelessWidget {
  const ExerciseBody2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        title: const DefaultText(
          text: 'تمارين التقوية',
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 8),
          child: Column(
            children: [
              CustomExerciseRow(
                image: Assets.imagesExercise3,
                text1: AppStrings.exerciseText6,
                text2: AppStrings.exerciseText7,
              ),
              CustomDivider(),
              CustomExerciseRow(
                image: Assets.imagesExercise4,
                text1: AppStrings.exerciseText8,
                text2: AppStrings.exerciseText9,
              ),
              CustomDivider(),
              CustomExerciseRow(
                image: Assets.imagesExercise5,
                text1: AppStrings.exerciseText10,
                text2: AppStrings.exerciseText11,
              ),
              CustomDivider(),
              CustomExerciseRow(
                image: Assets.imagesExercise6,
                text1: AppStrings.exerciseText12,
                text2: AppStrings.exerciseText13,
              ),
              CustomDivider(),
              CustomExerciseRow(
                image: Assets.imagesExercise13,
                text1: AppStrings.exerciseText24,
                text2: AppStrings.exerciseText25,
              ),
              CustomDivider(),
              CustomExerciseRow(
                image: Assets.imagesExercise14,
                text1: AppStrings.exerciseText26,
                text2: AppStrings.exerciseText27,
              ),
              CustomDivider(),
              CustomExerciseRow(
                image: Assets.imagesExercise15,
                text1: AppStrings.exerciseText28,
                text2: AppStrings.exerciseText29,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
