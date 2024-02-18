import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:physical_therapy_app/Features/auth/presentation/manger/register_cubit/register_cubit.dart';
import 'package:physical_therapy_app/Features/auth/presentation/manger/register_cubit/register_state.dart';
import 'package:physical_therapy_app/core/utils/app_router.dart';
import 'package:physical_therapy_app/core/utils/constances.dart';
import 'package:physical_therapy_app/core/widgets/alert_dialog.dart';
import 'package:physical_therapy_app/core/widgets/default_button.dart';
import 'package:physical_therapy_app/core/widgets/default_form_field.dart';
import 'package:physical_therapy_app/core/widgets/default_text.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  List<String> dropMenu = [
    'Anterior approach',
    'Posterior approach',
    'Lateral approach'
  ];
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    bool isLoaded = false;
    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
      if (state is RegisterLoading) {
        isLoaded = true;
      } else if (state is RegisterSuccess) {
        GoRouter.of(context).push(AppRouter.kHomeView,);
        isLoaded = false;
      } else if (state is RegisterFailure) {
        isLoaded = false;
        customAwesomeDialog(
            buildContext: context,
            title: 'خطأ',
            dialogType: DialogType.error,
            animType: AnimType.scale,
            description: state.error);
      }
    },
    builder: (context, state) {
    return ModalProgressHUD(
      inAsyncCall: isLoaded,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
          backgroundColor: kPrimaryColor,
          title: const DefaultText(
            text: 'تسجيل حساب جديد',
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/register.jpg',scale: 6,),
                  DefaultFormField(
                    controller: nameController,
                    //focusNode: nameFocus,
                    keyboardType: TextInputType.text,
                    hintText: 'الاسم بالكامل',
                    textAlign: TextAlign.right,
                    suffixIcon: const Icon(
                      Icons.person,
                      size: 20,
                      //color: nameFocus.hasFocus ? kPrimaryColor : Colors.grey,
                    ),
                    inputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    inputFocusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: kPrimaryColor,
                        )),
                  ),
                  const SizedBox(height: 16.0),
                  DefaultFormField(
                    controller: phoneController,
                    //focusNode: emailFocus,
                    keyboardType: TextInputType.number,
                    hintText: 'رقم الهاتف',
                    textAlign: TextAlign.right,
                    suffixIcon: const Icon(
                      Icons.phone_android,
                      size: 20,
                      //color: nameFocus.hasFocus ? kPrimaryColor : Colors.grey,
                    ),
                    inputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    inputFocusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: kPrimaryColor,
                        )),
                  ),
                  const SizedBox(height: 16.0),
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
                    inputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    inputFocusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: kPrimaryColor,
                        )),
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
                    suffixIcon: const Icon(
                      Icons.password_outlined,
                      size: 20,
                      //color: nameFocus.hasFocus ? kPrimaryColor : Colors.grey,
                    ),
                    inputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    inputFocusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: kPrimaryColor,
                        )),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DropdownButton(
                        hint:
                        const DefaultText(
                          text: 'اختر نوع العملية',
                          fontSize: 16,
                          textAlign: TextAlign.start,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                        value: selectedItem,
                        onChanged: (value) {
                          setState(() {
                            selectedItem = value;
                          });
                        },
                        items: dropMenu.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child:  Text(e),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  DefaultMaterialButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<RegisterCubit>(context)
                            .registerUser(
                          email: emailController.text,
                          password: passwordController.text,
                          phoneNumber: phoneController.text,
                          userName: nameController.text,
                        );
                      } else {}
                    },
                    text: 'تسجيل حساب جديد',
                    fontSize: 19,
                    radius: 15,
                    fontWeight: FontWeight.w500,
                    splashColor: darkBlueGray,
                  ),
                  const SizedBox(height: 8.0),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefaultText(
                          text: 'قم بتسجيل الدخول هنا.',
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        DefaultText(
                          text: 'هل لديك حساب بالفعل؟ ',
                          color: darkBlueGray,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
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
    );
    },
    );
  }
}
