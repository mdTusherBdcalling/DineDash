import 'package:dine_dash/view/res/colors.dart';
import 'package:dine_dash/view/res/commonWidgets.dart';
import 'package:dine_dash/view/user_dealer_common/change_password.dart';
import 'package:flutter/material.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: commonText("General Settings", size: 18, isBold: true),
        centerTitle: true,
      ),

      bottomSheet: Container(
        color: AppColors.white,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Security
              _buildSettingOption(
                icon: "assets/images/Lock 3.png",
                title: "Change Password",
                iconColor: AppColors.primaryColor,
                haveArrow: true,
                onTap: () {
                  navigateToPage(ChangePasswordScreen());
                },
              ),

              // Help
              _buildSettingOption(
                icon: "assets/images/delete.png",
                title: "Delete Account",
                iconColor: Colors.red,
                onTap: () {
                  showDeleteAccountDialog(context, () {
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingOption({
    required String icon,
    required String title,
    required Color iconColor,
    required VoidCallback onTap,
    bool haveArrow = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),

        child: ListTile(
          leading: Image.asset(icon, color: iconColor, width: 24),
          title: commonText(title, size: 16, color: AppColors.black),
          trailing: (haveArrow) ? Icon(Icons.arrow_forward_ios_outlined) : null,
        ),
      ),
    );
  }

  Future<void> showDeleteAccountDialog(
    BuildContext context,
    VoidCallback onDelete,
  ) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: commonText(
            "Do you want to delete your account?",
            size: 18,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: commonButton(
                    "Cancel",
                    color: Color(0xFFDDDDDD),
                    textColor: Colors.black,
                    height: 40,
                    width: 100,boarderRadious: 10,
                    onTap: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: commonButton(
                    "Delete",
                    color: AppColors.red,
                    textColor: Colors.white,
                    height: 40,
                    boarderRadious: 10,
                    width: 100,
                    onTap: () {
                      Navigator.of(context).pop(); // Close the dialog
                      // onDelete(); // Perform the delete action
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}