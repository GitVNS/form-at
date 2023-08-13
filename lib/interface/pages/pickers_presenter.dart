import 'package:flutter/material.dart';
import 'package:former/interface/components/custom_outlined_field.dart';

class PickersPresenter extends StatefulWidget {
  const PickersPresenter({super.key});

  @override
  State<PickersPresenter> createState() => _PickersPresenterState();
}

class _PickersPresenterState extends State<PickersPresenter> {
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _formKey1 = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text = "${picked.day}-${picked.month}-${picked.year}";
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
      orientation: Orientation.portrait,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: true,
          ),
          child: child!,
        );
      },
    );
    if (time != null && time != selectedTime) {
      setState(() {
        selectedTime = time;
        _timeController.text = "${time.hour}:${time.minute}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pickers"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        physics: const BouncingScrollPhysics(),
        children: [
          Form(
            key: _formKey1,
            child: Column(
              children: [
                CustomOutlinedField(
                  readOnly: true,
                  controller: _dateController,
                  hint: "Date",
                  borderRadius: 0,
                  errorMessage: "Please select Date",
                  onTap: () {
                    _selectDate(context);
                  },
                ),
                const SizedBox(height: 16),
                CustomOutlinedField(
                  readOnly: true,
                  controller: _dateController,
                  label: "Date of Birth",
                  borderRadius: 100,
                  prefix: const Icon(Icons.date_range),
                  errorMessage: "Please select Date",
                  onTap: () {
                    _selectDate(context);
                  },
                ),
                const SizedBox(height: 16),
                CustomOutlinedField(
                  readOnly: true,
                  controller: _dateController,
                  label: "Date of Birth",
                  borderRadius: 100,
                  icon: const Icon(Icons.date_range),
                  filled: true,
                  outlined: false,
                  errorMessage: "Please select Date",
                  onTap: () {
                    _selectDate(context);
                  },
                ),
                const SizedBox(height: 16),
                CustomOutlinedField(
                  readOnly: true,
                  controller: _timeController,
                  label: "Time",
                  borderRadius: 100,
                  prefix: const Icon(Icons.timer),
                  filled: true,
                  outlined: false,
                  errorMessage: "Please select Time",
                  onTap: () {
                    _selectTime(context);
                  },
                ),
                const SizedBox(height: 16),
                CustomOutlinedField(
                  readOnly: true,
                  controller: _timeController,
                  label: "Time",
                  borderRadius: 100,
                  prefix: const Icon(Icons.timer),
                  filled: true,
                  enabled: false,
                  errorMessage: "Please select Time",
                  onTap: () {
                    _selectTime(context);
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey1.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(_dateController.text),
                  ),
                );
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}
