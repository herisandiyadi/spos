import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/presentation/controllers/auth/c_sign_in.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final signInController = Get.find<SignInController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    debugPrint("presentation>screens>auth>sign_in page");
    return GestureDetector(
      onTap: () => signInController.dismissKeyboardIfFocused(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            width: 220.w,
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: ' Login to ',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontFamily: 'UbuntuBold',
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Squadra ',
                            style: TextStyle(
                              fontSize: 30,
                              color: primaryColor,
                              fontFamily: 'UbuntuBold',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Obx(() {
                  final state = signInController.status.value;

                  if (state.isError) {
                    return Container(
                      width: size.width,
                      margin: const EdgeInsets.only(bottom: 15.0),
                      padding: const EdgeInsets.fromLTRB(15, 8, 15, 10),
                      decoration: BoxDecoration(
                        color: Colors.red.shade700,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.warning,
                                  size: 20, color: Colors.white),
                              SizedBox(width: 5.0),
                              Expanded(
                                child: Text(
                                  "Terjadi Kesalahan",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            signInController.status.value.errorMessage ?? "-",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }),
                Form(
                  key: signInController.signInKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          String val = value ?? '';

                          return val.isEmpty
                              ? 'Username cannot be empty'
                              : null;
                        },
                        focusNode: signInController.usernameFocusNode,
                        controller: signInController.usernameController,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: customLightGrey,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 16.0,
                          ),
                          labelText: 'Enter your Username',
                          labelStyle: TextStyle(
                            fontFamily: 'NanumGothic',
                            color: customBodyText,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              width: 1,
                              color: customLightGrey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              width: 1,
                              color: customLightGrey,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              width: 1,
                              color: customRed1,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              width: 1,
                              color: customLightGrey,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Obx(() {
                        bool obsecure =
                            signInController.isObscurePassword.value;

                        return TextFormField(
                          validator: (value) {
                            String val = value ?? '';

                            return val.isEmpty
                                ? 'Password cannot be empty'
                                : null;
                          },
                          focusNode: signInController.passwordFocusNode,
                          controller: signInController.passwordController,
                          obscureText: signInController.isObscurePassword.value,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: customLightGrey,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 16.0,
                            ),
                            labelText: 'Enter your Password',
                            labelStyle: TextStyle(
                              fontFamily: 'NanumGothic',
                              color: customBodyText,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () =>
                                  signInController.isObscurePassword.value =
                                      !signInController.isObscurePassword.value,
                              icon: Icon(
                                  obsecure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size: 22,
                                  color: obsecure ? Colors.grey : customBlack),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                width: 1,
                                color: customLightGrey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                width: 1,
                                color: customLightGrey,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                width: 1,
                                color: customRed1,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                width: 1,
                                color: customLightGrey,
                              ),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: null,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password ?',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'NanumGothic',
                        color: customBodyText,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () async => await signInController.signInCall(),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    fixedSize: Size(size.width, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'UbuntuBold',
                      color: customButtonText,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    fixedSize: Size(size.width, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                        width: 2,
                        color: customRegularGrey,
                      ),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'UbuntuBold',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
