import 'package:flutter/material.dart';
import 'package:physical_therapy_app/Features/warning/presentation/widgets/custom_warning_row.dart';
import 'package:physical_therapy_app/core/utils/media_query_values.dart';
import 'package:physical_therapy_app/core/utils/strings.dart';
import 'package:physical_therapy_app/generated/assets.dart';

class FourthWarning extends StatelessWidget {
  const FourthWarning({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Assets.imagesWarning4,
          height: context.height * 0.2,
        ),
        const SizedBox(
          height: 15,
        ),
        const CustomWarningRow(
          text: AppStrings.warningText7,
        ),
        const SizedBox(
          height: 5,
        ),
        const CustomWarningRow(
          text: AppStrings.warningText8,
        ),
        const SizedBox(
          height: 5,
        ),
        const CustomWarningRow(
          text: AppStrings.warningText9,
        ),
        const SizedBox(
          height: 5,
        ),
        const CustomWarningRow(
          text: AppStrings.warningText10,
        ),
        const SizedBox(
          height: 5,
        ),
        const CustomWarningRow(
          text: AppStrings.warningText11,
        ),
        const SizedBox(
          height: 5,
        ),
        const CustomWarningRow(
          text: AppStrings.warningText12,
        ),
      ],
    );
  }
}
