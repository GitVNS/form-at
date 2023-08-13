import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class SwitchPresenter extends StatefulWidget {
  const SwitchPresenter({super.key});

  @override
  State<SwitchPresenter> createState() => _SwitchPresenterState();
}

class _SwitchPresenterState extends State<SwitchPresenter> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switches"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        physics: const BouncingScrollPhysics(),
        children: [
          // basic
          SwitchListTile(
            value: switchValue,
            onChanged: (value) => setState(() => switchValue = value),
            activeColor: AppColors.primary,
            title: const Text("Notifications"),
            tileColor: AppColors.secondary.shade700,
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            value: switchValue,
            onChanged: (value) => setState(() => switchValue = value),
            activeColor: AppColors.primary,
            secondary: const Icon(Icons.notifications),
            title: const Text("Notifications"),
            tileColor: AppColors.secondary.shade700,
          ),
          const SizedBox(height: 32),
          // with underlined
          SwitchListTile(
            value: switchValue,
            onChanged: (value) => setState(() => switchValue = value),
            activeColor: AppColors.primary,
            shape: const Border(
              bottom: BorderSide(color: AppColors.primary),
            ),
            title: const Text("Notifications"),
            tileColor: AppColors.secondary.shade700,
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            value: switchValue,
            onChanged: (value) => setState(() => switchValue = value),
            activeColor: AppColors.primary,
            secondary: const Icon(Icons.notifications),
            shape: const Border(
              bottom: BorderSide(color: AppColors.primary),
            ),
            title: const Text("Notifications"),
            tileColor: AppColors.secondary.shade700,
          ),
          const SizedBox(height: 32),
          // with subtitle
          SwitchListTile(
            value: switchValue,
            onChanged: (value) => setState(() => switchValue = value),
            activeColor: AppColors.primary,
            title: const Text("Notifications"),
            subtitle: const Text("Turn on to get notified"),
            tileColor: AppColors.secondary.shade700,
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            value: switchValue,
            onChanged: (value) => setState(() => switchValue = value),
            activeColor: AppColors.primary,
            secondary: const SizedBox(
              height: double.infinity,
              child: Icon(Icons.notifications),
            ),
            title: const Text("Notifications"),
            subtitle: const Text("Turn on to get notified"),
            tileColor: AppColors.secondary.shade700,
            contentPadding: const EdgeInsets.all(16),
          ),
          const SizedBox(height: 32),
          // rounded border
          SwitchListTile(
            value: switchValue,
            onChanged: (value) => setState(() => switchValue = value),
            activeColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            title: const Text("Notifications"),
            tileColor: AppColors.secondary.shade700,
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            value: switchValue,
            onChanged: (value) => setState(() => switchValue = value),
            activeColor: AppColors.primary,
            secondary: const Icon(Icons.notifications),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(
                color: AppColors.primary,
                width: 1,
              ),
            ),
            title: const Text("Notifications"),
            tileColor: AppColors.secondary.shade700,
          ),
        ],
      ),
    );
  }
}
