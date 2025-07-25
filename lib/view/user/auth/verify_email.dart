import 'package:dine_dash/view/res/colors.dart';
import 'package:dine_dash/view/res/commonWidgets.dart';
import 'package:dine_dash/view/res/image_paths.dart';
import 'package:dine_dash/view/user/root_page.dart';
import 'package:flutter/material.dart';

class UserEmailVerificationScreen extends StatefulWidget {

  UserEmailVerificationScreen({super.key});

  @override
  State<UserEmailVerificationScreen> createState() => _UserEmailVerificationScreenState();
}

class _UserEmailVerificationScreenState extends State<UserEmailVerificationScreen> {
  final List<TextEditingController> otpControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.clear();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Verify Email",textColor: AppColors.white,backGroundColor: AppColors.primaryColor),
backgroundColor: AppColors.primaryColor,
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Image.asset(ImagePaths.verificationPageImage),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      const TextSpan(
                        text: "Enter ",
                        style: TextStyle(color: Colors.black),
                      ),
                  
                        const TextSpan(
                        text: "Verification ",
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                      const TextSpan(
                        text: " Code.",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                commonText(
                  "Enter the code that was sent to your email.",
                  size: 14.0,
                ),
                const SizedBox(height: 20),
            
                // OTP Fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: buildOTPTextField(
                        otpControllers[index],
                        index,
                        context,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
            
                // Resend Code
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    commonText(
                      "Didn't receive the code? ",
                      size: 14.0,
                    
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: commonText(
                        "Resend",
                        size: 14.0,
                        color: Colors.black,
                        isBold: true,
                      ),
                    ),
                  ],
                ),
                   SizedBox(height: 20,),
            
                // Verify Button
                commonButton(
                  "Verify",
            
                  textColor: Colors.white,
                  onTap: () {
               navigateToPage(UserRootPage());
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}