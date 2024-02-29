import 'package:flutter/material.dart';
import 'package:physical_therapy_app/Features/exercise/presentation/widgets/custom_exercise_row.dart';
import 'package:physical_therapy_app/core/utils/strings.dart';
import 'package:physical_therapy_app/generated/assets.dart';
import '../../../../core/widgets/default_text.dart';

class ExerciseBody4 extends StatelessWidget {
  const ExerciseBody4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        title: const DefaultText(
          text: 'تمارين لتحسين التوازن',
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
                image: Assets.imagesExercise7,
                text1: AppStrings.exerciseText14,
                text2: AppStrings.exerciseText15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}