// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:physical_therapy_app/Features/home/presentaion/widgets/custom_hello_container.dart';
import 'package:physical_therapy_app/Features/home/presentaion/widgets/home_page_container.dart';
import 'package:physical_therapy_app/core/utils/app_router.dart';
import 'package:physical_therapy_app/core/utils/constances.dart';
import 'package:physical_therapy_app/core/utils/style.dart';
import 'package:physical_therapy_app/core/widgets/default_text.dart';
import 'package:physical_therapy_app/generated/assets.dart';


class HomePage extends StatelessWidget {
   const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() async {
      bool type =false;
      await Future.delayed(Duration.zero,() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor:Colors.white ,
              title: Text('هل تريد الخروج من البرنامج؟',style: Styles.textStyle22.copyWith(fontWeight: FontWeight.w500,color: Colors.black),textAlign: TextAlign.end,),
              actions: [
                TextButton(onPressed: (){type = false ;
                Navigator.pop(context);
                }, child: const Text('لا',style: Styles.textStyle16)),
                TextButton(onPressed: (){type = true ; SystemNavigator.pop();}, child: const Text('نعم',style: Styles.textStyle16,)),

              ],
            );
          },
        );
      },);
      return type;

    }
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [IconButton(onPressed: (){GoRouter.of(context).push(AppRouter.kProfileView);}, icon: const Icon(Icons.settings_rounded))],
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
          backgroundColor: kPrimaryColor,
          title: const DefaultText(
            text: 'الصفحة الرئيسية',
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
            child: Column(
              children: [
               const HelloContainer(),
                const SizedBox(height: 25,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     DefaultText(
                        text: 'Posterior approach',
                        color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                InkWell(
                  onTap: (){
                    GoRouter.of(context).push(AppRouter.kWarningView);
                  },
                  child: const MainContainer(
                      image: Assets.imagesWarning,
                      title: 'ارشادات السلامة'),
                ),

               const  SizedBox(height: 12,),
                InkWell(
                  onTap: (){
                    GoRouter.of(context).push(AppRouter.kExerciseView);
                  },
                  child: const MainContainer(
                      image: Assets.imagesExercise,
                      title: 'تمارين'),
                ),
                const SizedBox(height: 12,),
                InkWell(
                  onTap: (){
                    GoRouter.of(context).push(AppRouter.kAbstractView);
                  },
                  child: const MainContainer(
                      image: Assets.imagesSummary,
                      title: 'نبذة عن العملية'),
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


