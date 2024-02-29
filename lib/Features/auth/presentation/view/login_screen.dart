// ignore_for_file: deprecated_member_use

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:physical_therapy_app/Features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:physical_therapy_app/Features/auth/presentation/manger/login_cubit/login_state.dart';
import 'package:physical_therapy_app/core/utils/app_router.dart';
import 'package:physical_therapy_app/core/utils/constances.dart';
import 'package:physical_therapy_app/core/utils/media_query_values.dart';
import 'package:physical_therapy_app/core/utils/style.dart';
import 'package:physical_therapy_app/core/widgets/alert_dialog.dart';
import 'package:physical_therapy_app/core/widgets/default_button.dart';
import 'package:physical_therapy_app/core/widgets/default_form_field.dart';
import 'package:physical_therapy_app/core/widgets/default_text.dart';


class LoginPage extends StatelessWidget {
  final TextEditingController emailController =TextEditingController();
  final TextEditingController passwordController =TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  LoginPage({super.key});
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
    bool isLoaded = false;

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginLoading) {
          isLoaded = true;
        } else if (state is LoginSuccess) {
            GoRouter.of(context).push(AppRouter.kHomeView);
          isLoaded = false;
        } else if (state is LoginFailure) {
          isLoaded = false;
          customAwesomeDialog(
            buildContext: context,
            title: 'خطأ',
            dialogType: DialogType.error,
            animType: AnimType.scale,
            description: state.error,
          );
        }
      },
        builder: (context, state) {
      return ModalProgressHUD(
        inAsyncCall: isLoaded,
        child: WillPopScope(
          onWillPop: onWillPop,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: const DefaultText(
                text: 'تسجيل الدخول',
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/login.jpg',height: context.height*0.35,),
                        const SizedBox(height: 5,),
                        DefaultFormField(
                          controller: emailController,
                          //focusNode: emailFocus,
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'البريد الالكتروني',
                          textAlign: TextAlign.right,
                          suffixIcon: const Icon(
                            Icons.email_rounded,
                            size: 20,
                            //color: nameFocus.hasFocus ? kPrimaryColor : Colors.grey,
                          ),
                        ),
                       const SizedBox(height: 16.0),
                        DefaultFormField(
                          controller: passwordController,
                          obscureText: true,
                          maxLines: 1,
                          //focusNode: passwordFocus,
                          keyboardType: TextInputType.visiblePassword,
                          hintText: 'كلمة المرور',
                          textAlign: TextAlign.right,
                          suffixIcon:const  Icon(
                            Icons.password_outlined,
                            size: 20,
                            //color: nameFocus.hasFocus ? kPrimaryColor : Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        DefaultMaterialButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<LoginCubit>(context).loginUser(
                                  email: emailController.text,
                                  password: passwordController.text);
                            } else {}
                          },
                          text: 'تسجيل الدخول',
                          fontSize: 18,
                          radius: 15,
                          fontWeight: FontWeight.w500,
                          splashColor: darkBlueGray,
                        ),
                        const SizedBox(height: 10,),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<LoginCubit>(context).loginWithGoogle();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade700,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            padding: EdgeInsets.all(context.height * 0.016),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'assets/images/google.png',
                                height: 30,
                              ),
                              Text(
                                'تسجيل الدخول بواسطة جوجل',
                                style: Styles.textStyle18.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontFamily: 'Tajawal'
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 6.0),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context).push(AppRouter.kRegisterView);
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DefaultText(
                                text: 'سجل هنا.',
                                color: kPrimaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,

                              ),
                              DefaultText(
                                text: 'ليس لديك حساب؟ ',
                                color: darkBlueGray,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,

                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
        },
    );
  }
}