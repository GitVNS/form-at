import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CheckboxPresenter extends StatefulWidget {
  const CheckboxPresenter({super.key});

  @override
  State<CheckboxPresenter> createState() => _CheckboxPresenterState();
}

class _CheckboxPresenterState extends State<CheckboxPresenter> {
  bool checkboxValue = false;
  bool? tristateValue;
  bool enable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkboxes"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        physics: const BouncingScrollPhysics(),
        children: [
          CheckboxListTile(
            value: checkboxValue,
            onChanged: (value) {
              setState(() {
                checkboxValue = value!;
              });
            },
            activeColor: AppColors.primary,
            checkColor: AppColors.secondary,
            enabled: enable,
            title: const Text("Checkbox"),
          ),
          const SizedBox(height: 16),
          CheckboxListTile(
            value: tristateValue,
            onChanged: (value) {
              setState(() {
                tristateValue = value;
              });
            },
            activeColor: AppColors.primary,
            checkColor: AppColors.secondary,
            enabled: enable,
            tristate: true,
            title: const Text("Tristate Checkbox"),
            tileColor: AppColors.secondary.shade700,
          ),
          const SizedBox(height: 16),
          CheckboxListTile(
            value: tristateValue,
            onChanged: (value) {
              setState(() {
                tristateValue = value;
              });
            },
            activeColor: AppColors.primary,
            checkColor: AppColors.secondary,
            checkboxShape: const CircleBorder(),
            controlAffinity: ListTileControlAffinity.leading,
            enabled: enable,
            tristate: true,
            tileColor: AppColors.secondary.shade700,
            title: const Text("Circular Check"),
            subtitle: const Text("This is subtitle"),
          ),
          const SizedBox(height: 16),
          CheckboxListTile(
            value: checkboxValue,
            onChanged: (value) {
              setState(() {
                checkboxValue = value!;
              });
            },
            activeColor: AppColors.primary,
            checkColor: AppColors.secondary,
            controlAffinity: ListTileControlAffinity.leading,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            tileColor: AppColors.secondary.shade700,
            title: const Text("Rounded"),
            enabled: enable,
          ),
          const SizedBox(height: 16),
          CheckboxListTile(
            value: checkboxValue,
            onChanged: (value) {
              setState(() {
                checkboxValue = value!;
              });
            },
            activeColor: AppColors.primary,
            checkColor: AppColors.secondary,
            controlAffinity: ListTileControlAffinity.trailing,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            tileColor: AppColors.secondary.shade700,
            title: Text(
              "Colored",
              style: TextStyle(
                color: checkboxValue && enable ? AppColors.primary : null,
              ),
            ),
            enabled: enable,
          ),
          const SizedBox(height: 16),
          CheckboxListTile(
            value: enable,
            onChanged: (value) {
              setState(() {
                enable = value!;
              });
            },
            activeColor: AppColors.primary,
            checkColor: AppColors.secondary,
            controlAffinity: ListTileControlAffinity.leading,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: AppColors.primary),
            ),
            tileColor: AppColors.secondary.shade700,
            title: const Text("Enable & Disable"),
            enabled: true,
          ),
        ],
      ),
    );
  }
}
