import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';
import 'package:flutter_getx_project_template/controllers/auth_controller.dart';
import 'package:get/get.dart';

class LoginFormFields extends StatelessWidget {
  final AuthController controller;

  const LoginFormFields({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email / Username',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.instance.primaryTextColor,
            letterSpacing: -0.1,
          ),
        ),
        const SizedBox(height: 7),
        TextFormField(
          controller: controller.usernameController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.instance.primaryTextColor,
          ),
          decoration: InputDecoration(
            hintText: 'Enter username or email',
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 12, right: 10),
              child: Icon(
                Icons.mail_outline_rounded,
                size: 20,
                color: AppColors.instance.primary,
              ),
            ),
            prefixIconConstraints: const BoxConstraints(minWidth: 44, minHeight: 44),
          ),
          validator: (v) =>
              (v == null || v.trim().isEmpty) ? 'Username or email is required' : null,
        ),
        const SizedBox(height: 18),
        Text(
          'Password',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.instance.primaryTextColor,
            letterSpacing: -0.1,
          ),
        ),
        const SizedBox(height: 7),
        Obx(
          () => TextFormField(
            controller: controller.passwordController,
            obscureText: !controller.isPasswordVisible.value,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => controller.login(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.instance.primaryTextColor,
            ),
            decoration: InputDecoration(
              hintText: 'Enter account password',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 12, right: 10),
                child: Icon(
                  Icons.lock_outline_rounded,
                  size: 20,
                  color: AppColors.instance.primary,
                ),
              ),
              prefixIconConstraints: const BoxConstraints(minWidth: 44, minHeight: 44),
              suffixIcon: IconButton(
                icon: Icon(
                  controller.isPasswordVisible.value
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  size: 20,
                  color: AppColors.instance.subTextColor,
                ),
                onPressed: controller.togglePasswordVisibility,
              ),
            ),
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Password is required' : null,
          ),
        ),
      ],
    );
  }
}
