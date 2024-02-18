import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:physical_therapy_app/core/utils/constances.dart';
import 'package:physical_therapy_app/core/utils/style.dart';
import 'package:physical_therapy_app/generated/assets.dart';


class HelloContainer extends StatelessWidget {
  const HelloContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var userData = snapshot.data?.data() as Map<String, dynamic>;
            return Container(
              padding: const EdgeInsets.all(16),
              //margin: const EdgeInsets.all(16),
             // height: context.height*0.12,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(Assets.imagesHealthy),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                         '${userData['username']} أهلاً بك',
                        style: Styles.textStyle18.copyWith(color: Colors.white),
                      ),
                      Text(
                        'نتمني لك الشفاء العاجل',
                        style: Styles.textStyle16.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const SpinKitFadingCircle(color: kPrimaryColor,);
          }
        });
  }
}
