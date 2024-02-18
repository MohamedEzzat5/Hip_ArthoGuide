import 'package:flutter/material.dart';
import 'package:physical_therapy_app/Features/warning/presentation/widgets/custom_warning_row.dart';
import 'package:physical_therapy_app/core/utils/media_query_values.dart';
import 'package:physical_therapy_app/core/utils/strings.dart';
import 'package:physical_therapy_app/generated/assets.dart';

class SeventhWarning extends StatelessWidget {
  const SeventhWarning({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Assets.imagesWarning7,
          height: context.height * 0.25,
        ),
        const SizedBox(
          height: 15,
        ),
        const CustomWarningRow(text: AppStrings.warningText18),
        const SizedBox(
          height: 5,
        ),
        const CustomWarningRow(text: AppStrings.warningText19),
        const SizedBox(
          height: 5,
        ),
        const CustomWarningRow(text: AppStrings.warningText20),
      ],
    );
  }
}
