import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_colors.dart';

enum ExerciseFilter {
  strength,
  training,
  aerobic,
  exercise,
  yoga,
  pilates,
  walking,
  running,
  aerobics,
  swimming,
  cycling,
  circuit,
  stretching,
  weightlifting,
}

class FlitersPresenter extends StatefulWidget {
  const FlitersPresenter({super.key});

  @override
  State<FlitersPresenter> createState() => _FlitersPresenterState();
}

class _FlitersPresenterState extends State<FlitersPresenter> {
  Set<ExerciseFilter> filters = <ExerciseFilter>{};
  String imgURL =
      "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        physics: const BouncingScrollPhysics(),
        children: [
          Wrap(
            spacing: 8,
            alignment: WrapAlignment.spaceEvenly,
            children: ExerciseFilter.values.map((exercise) {
              return FilterChip(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                selectedColor: AppColors.primary.shade700,
                checkmarkColor: AppColors.secondary,
                disabledColor: AppColors.secondary,
                showCheckmark: false,
                labelStyle: TextStyle(
                  color: filters.contains(exercise)
                      ? AppColors.secondary.shade700
                      : AppColors.primary.shade50,
                ),
                label: Text(exercise.name.capitalize()),
                selected: filters.contains(exercise),
                onSelected: (selected) {
                  HapticFeedback.heavyImpact();
                  setState(() {
                    if (selected) {
                      filters.add(exercise);
                    } else {
                      filters.remove(exercise);
                    }
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            alignment: WrapAlignment.spaceEvenly,
            children: ExerciseFilter.values.map((exercise) {
              return FilterChip(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                selectedColor: AppColors.primary.shade700,
                checkmarkColor: AppColors.secondary,
                disabledColor: AppColors.secondary,
                showCheckmark: true,
                labelStyle: TextStyle(
                  color: filters.contains(exercise)
                      ? AppColors.secondary.shade700
                      : AppColors.primary.shade50,
                ),
                label: Text(exercise.name.capitalize()),
                selected: filters.contains(exercise),
                onSelected: (selected) {
                  HapticFeedback.heavyImpact();
                  setState(() {
                    if (selected) {
                      filters.add(exercise);
                    } else {
                      filters.remove(exercise);
                    }
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),
          Wrap(
            spacing: 4,
            alignment: WrapAlignment.spaceEvenly,
            children: ExerciseFilter.values.map((exercise) {
              return FilterChip(
                elevation: 0,
                selectedColor: AppColors.primary.shade700,
                checkmarkColor: AppColors.secondary,
                disabledColor: AppColors.secondary,
                showCheckmark: false,
                labelStyle: TextStyle(
                  color: filters.contains(exercise)
                      ? AppColors.secondary.shade700
                      : AppColors.primary.shade50,
                ),
                avatar: CircleAvatar(
                  // backgroundImage: NetworkImage(imgURL),
                  backgroundColor: AppColors.secondary.shade900,
                  child: Icon(Icons.emoji_people,
                      size: 14, color: AppColors.primary.shade50),
                ),
                label: Text(exercise.name.capitalize()),
                selected: filters.contains(exercise),
                onSelected: (selected) {
                  HapticFeedback.heavyImpact();
                  setState(() {
                    if (selected) {
                      filters.add(exercise);
                    } else {
                      filters.remove(exercise);
                    }
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),
          Wrap(
            spacing: 4,
            alignment: WrapAlignment.spaceEvenly,
            children: ExerciseFilter.values.map((exercise) {
              return FilterChip(
                elevation: 0,
                selectedColor: AppColors.primary.shade700,
                checkmarkColor: AppColors.primary.shade700,
                disabledColor: AppColors.secondary,
                showCheckmark: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                labelStyle: TextStyle(
                  color: filters.contains(exercise)
                      ? AppColors.secondary.shade700
                      : AppColors.primary.shade50,
                ),
                avatar: CircleAvatar(
                  backgroundImage: NetworkImage(imgURL),
                ),
                label: Text(exercise.name.capitalize()),
                selected: filters.contains(exercise),
                onSelected: (selected) {
                  HapticFeedback.heavyImpact();
                  setState(() {
                    if (selected) {
                      filters.add(exercise);
                    } else {
                      filters.remove(exercise);
                    }
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
