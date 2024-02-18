import 'package:flutter/material.dart';
import 'package:physical_therapy_app/Features/exercise/presentation/widgets/custom_divider.dart';
import 'package:physical_therapy_app/Features/warning/presentation/widgets/eighth_warning.dart';
import 'package:physical_therapy_app/Features/warning/presentation/widgets/fifth_warning.dart';
import 'package:physical_therapy_app/Features/warning/presentation/widgets/first_warning.dart';
import 'package:physical_therapy_app/Features/warning/presentation/widgets/fourth_warning.dart';
import 'package:physical_therapy_app/Features/warning/presentation/widgets/ninth_warning.dart';
import 'package:physical_therapy_app/Features/warning/presentation/widgets/second_warning.dart';
import 'package:physical_therapy_app/Features/warning/presentation/widgets/seventh_warning.dart';
import 'package:physical_therapy_app/Features/warning/presentation/widgets/sixth_warning.dart';
import 'package:physical_therapy_app/Features/warning/presentation/widgets/third_warning.dart';
import 'package:physical_therapy_app/core/utils/constances.dart';
import 'package:physical_therapy_app/core/utils/strings.dart';
import 'package:physical_therapy_app/core/widgets/default_text.dart';
import 'package:physical_therapy_app/core/widgets/main_screen_container.dart';

class WarningSreen extends StatelessWidget {
  const WarningSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          title: const DefaultText(
            text: 'ارشادات السلامة',
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                MainScreenContainer(text: AppStrings.warningText1),
                SizedBox(
                  height: 15,
                ),
                FirstWarning(),
                CustomDivider(),
                SecondWarning(),
                CustomDivider(),
                ThirdWarning(),
                CustomDivider(),
                FourthWarning(),
                CustomDivider(),
                FifthWarning(),
                CustomDivider(),
                SixthWarning(),
                CustomDivider(),
                SeventhWarning(),
                CustomDivider(),
                EighthWarning(),
                CustomDivider(),
                NinthWarning(),
              ],
            ),
          ),
        ));
  }
}


