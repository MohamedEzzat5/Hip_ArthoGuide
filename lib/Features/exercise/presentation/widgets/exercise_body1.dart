import 'package:flutter/material.dart';
import 'package:physical_therapy_app/Features/exercise/presentation/widgets/custom_divider.dart';
import 'package:physical_therapy_app/Features/exercise/presentation/widgets/custom_exercise_row.dart';
import 'package:physical_therapy_app/core/utils/strings.dart';
import 'package:physical_therapy_app/generated/assets.dart';

import '../../../../core/widgets/default_text.dart';

class ExerciseBody1 extends StatelessWidget {
  const ExerciseBody1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        title: const DefaultText(
          text: 'تمارين التمدد',
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child:  Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomExerciseRow(
                image: Assets.imagesExercise1,
                text1: AppStrings.exerciseText2,
                text2: AppStrings.exerciseText3,
              ),
              CustomDivider(),
              CustomExerciseRow(
                image: Assets.imagesExercise2,
                text1: AppStrings.exerciseText4,
                text2: AppStrings.exerciseText5,
              ),
              CustomDivider(),
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
            ],
          ),
        ),
      ),
    );
  }
}