import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

enum RadioGroup { first, second, third }

class RadioPresenter extends StatefulWidget {
  const RadioPresenter({super.key});

  @override
  State<RadioPresenter> createState() => _RadioPresenterState();
}

class _RadioPresenterState extends State<RadioPresenter> {
  RadioGroup groupValue = RadioGroup.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Radios"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        physics: const BouncingScrollPhysics(),
        children: [
          // basic
          RadioListTile(
            title: const Text("First"),
            activeColor: AppColors.primary,
            value: RadioGroup.first,
            groupValue: groupValue,
            onChanged: (value) => setState(() => groupValue = value!),
          ),
          RadioListTile(
            title: const Text("Second"),
            activeColor: AppColors.primary,
            value: RadioGroup.second,
            groupValue: groupValue,
            onChanged: (value) => setState(() => groupValue = value!),
          ),
          RadioListTile(
            title: const Text("Third"),
            activeColor: AppColors.primary,
            value: RadioGroup.third,
            groupValue: groupValue,
            onChanged: (value) => setState(() => groupValue = value!),
          ),
          const SizedBox(height: 32),
          // colored
          RadioListTile(
            title: const Text("First"),
            activeColor: AppColors.primary,
            value: RadioGroup.first,
            groupValue: groupValue,
            onChanged: (value) => setState(() => groupValue = value!),
            tileColor: AppColors.secondary.shade700,
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          const SizedBox(height: 8),
          RadioListTile(
            title: const Text("Second"),
            activeColor: AppColors.primary,
            value: RadioGroup.second,
            groupValue: groupValue,
            onChanged: (value) => setState(() => groupValue = value!),
            tileColor: AppColors.secondary.shade700,
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          const SizedBox(height: 8),
          RadioListTile(
            title: const Text("Third"),
            activeColor: AppColors.primary,
            value: RadioGroup.third,
            groupValue: groupValue,
            onChanged: (value) => setState(() => groupValue = value!),
            tileColor: AppColors.secondary.shade700,
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          const SizedBox(height: 8),
          const SizedBox(height: 32),
          // underlined
          RadioListTile(
            title: const Text("First"),
            activeColor: AppColors.primary,
            value: RadioGroup.first,
            groupValue: groupValue,
            onChanged: (value) => setState(() => groupValue = value!),
            shape: const Border(
              bottom: BorderSide(color: AppColors.primary),
            ),
            tileColor: AppColors.secondary.shade700,
          ),
          const SizedBox(height: 8),
          RadioListTile(
            title: const Text("Second"),
            activeColor: AppColors.primary,
            value: RadioGroup.second,
            groupValue: groupValue,
            onChanged: (value) => setState(() => groupValue = value!),
            shape: const Border(
              bottom: BorderSide(color: AppColors.primary),
            ),
            tileColor: AppColors.secondary.shade700,
          ),
          const SizedBox(height: 8),
          RadioListTile(
            title: const Text("Third"),
            activeColor: AppColors.primary,
            value: RadioGroup.third,
            groupValue: groupValue,
            onChanged: (value) => setState(() => groupValue = value!),
            shape: const Border(
              bottom: BorderSide(color: AppColors.primary),
            ),
            tileColor: AppColors.secondary.shade700,
          ),
          const SizedBox(height: 32),
          // with icon and rounded
          RadioListTile(
            title: const Text("First"),
            activeColor: AppColors.primary,
            value: RadioGroup.first,
            groupValue: groupValue,
            onChanged: (value) => setState(() => groupValue = value!),
            tileColor: AppColors.secondary.shade700,
            secondary: const Icon(Icons.looks_one),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 8),
          RadioListTile(
            title: const Text("Second"),
            activeColor: AppColors.primary,
            value: RadioGroup.second,
            groupValue: groupValue,
            onChanged: (value) => setState(() => groupValue = value!),
            tileColor: AppColors.secondary.shade700,
            secondary: const Icon(Icons.looks_two),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(height: 8),
          RadioListTile(
            title: const Text("Third"),
            activeColor: AppColors.primary,
            value: RadioGroup.third,
            groupValue: groupValue,
            onChanged: (value) => setState(() => groupValue = value!),
            tileColor: AppColors.secondary.shade700,
            secondary: const Icon(Icons.looks_3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          const SizedBox(height: 32),
          // selected highlight
          RadioListTile(
            title: Text(
              "First",
              style: groupValue == RadioGroup.first
                  ? const TextStyle(color: AppColors.primary)
                  : null,
            ),
            activeColor: AppColors.primary,
            value: RadioGroup.first,
            groupValue: groupValue,
            onChanged: (value) => setState(() => groupValue = value!),
            tileColor: AppColors.secondary.shade700,
            secondary: Icon(
              Icons.looks_one,
              color: groupValue == RadioGroup.first ? AppColors.primary : null,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          const SizedBox(height: 8),
          RadioListTile(
            title: Text(
              "Second",
              style: groupValue == RadioGroup.second
                  ? const TextStyle(color: AppColors.primary)
                  : null,
            ),
            activeColor: AppColors.primary,
            value: RadioGroup.second,
            groupValue: groupValue,
            onChanged: (value) => setState(() => groupValue = value!),
            tileColor: AppColors.secondary.shade700,
            secondary: Icon(
              Icons.looks_two,
              color: groupValue == RadioGroup.second ? AppColors.primary : null,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(height: 8),
          RadioListTile(
            title: Text(
              "Third",
              style: groupValue == RadioGroup.third
                  ? const TextStyle(color: AppColors.primary)
                  : null,
            ),
            activeColor: AppColors.primary,
            value: RadioGroup.third,
            groupValue: groupValue,
            onChanged: (value) => setState(() => groupValue = value!),
            tileColor: AppColors.secondary.shade700,
            secondary: Icon(
              Icons.looks_3,
              color: groupValue == RadioGroup.third ? AppColors.primary : null,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
