import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:physical_therapy_app/Features/profile/presentation/views/widgets/custom_container.dart';
import 'package:physical_therapy_app/Features/profile/presentation/views/widgets/custom_align_text.dart';
import 'package:physical_therapy_app/Features/profile/presentation/views/widgets/custom_avatar.dart';
import 'package:physical_therapy_app/core/utils/app_router.dart';
import 'package:physical_therapy_app/core/utils/constances.dart';
import 'package:physical_therapy_app/core/utils/style.dart';
import 'package:physical_therapy_app/core/widgets/default_button.dart';
import 'package:physical_therapy_app/core/widgets/default_text.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key,});

  @override
  Widget build(BuildContext context) {
    navigateToLogin(){
      GoRouter.of(context).push(AppRouter.kLoginView);
    }
    return Scaffold(
      backgroundColor: const Color(0xffECF0F1),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: const DefaultText(
          text: 'الملف الشخصي',
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            const CustomAvatar(),
            const SizedBox(height: 5),
            FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var userData = snapshot.data?.data() as Map<String, dynamic>;
                  return Column(
                    children: [
                      Text(
                        FirebaseAuth.instance.currentUser!.email.toString(),
                        style: Styles.textStyle16,
                      ),
                      const SizedBox(height: 15),
                      const CustomAlignText(text: 'الاسم'),
                      const SizedBox(height: 5),
                      CustomContainer(
                        text: userData['username'].toString(),
                      ),
                      userData['phoneNumber'] == "" ? const SizedBox() :
                      Column(
                        children: [
                          const SizedBox(height: 15),
                          const CustomAlignText(text: 'رقم الهاتف'),
                          const SizedBox(height: 5),
                          CustomContainer(
                            text: userData['phoneNumber'].toString() ,
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DefaultMaterialButton(
                          background: Colors.red,
                          onPressed: () async {
                            GoogleSignIn googleSignIn = GoogleSignIn();
                            googleSignIn.disconnect();
                            await FirebaseAuth.instance.signOut();
                            navigateToLogin();
                          },
                          text: 'تسجيل الخروج',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  );
                } else {
                  return  const SpinKitFadingCircle(color: kPrimaryColor,);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
