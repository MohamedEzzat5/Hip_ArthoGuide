import 'package:flutter/material.dart';
import 'package:physical_therapy_app/Features/warning/presentation/widgets/custom_warning_row.dart';
import 'package:physical_therapy_app/core/utils/media_query_values.dart';
import 'package:physical_therapy_app/core/utils/strings.dart';
import 'package:physical_therapy_app/generated/assets.dart';
class EighthWarning extends StatelessWidget {
  const EighthWarning({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Assets.imagesWarning8,
          height: context.height * 0.25,
        ),
        const SizedBox(
          height: 15,
        ),
        const CustomWarningRow(text: AppStrings.warningText21),
        const SizedBox(
          height: 5,
        ),
        const CustomWarningRow(text: AppStrings.warningText22),
        const SizedBox(
          height: 5,
        ),
        const CustomWarningRow(text: AppStrings.warningText23),
      ],
    );
  }
}