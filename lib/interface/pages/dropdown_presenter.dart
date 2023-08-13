import 'package:flutter/material.dart';
import 'package:former/interface/components/custom_dropdown.dart';

class DropdownPresenter extends StatefulWidget {
  const DropdownPresenter({super.key});

  @override
  State<DropdownPresenter> createState() => _DropdownPresenterState();
}

class _DropdownPresenterState extends State<DropdownPresenter> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdowns"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        physics: const BouncingScrollPhysics(),
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomDropdown(
                  options: [
                    CustomDropdownItem(title: "United States"),
                    CustomDropdownItem(title: "India"),
                    CustomDropdownItem(title: "Syria"),
                    CustomDropdownItem(title: "Australia"),
                    CustomDropdownItem(title: "Canada"),
                    CustomDropdownItem(title: "Germany"),
                    CustomDropdownItem(title: "China"),
                    CustomDropdownItem(title: "Belgium"),
                    CustomDropdownItem(title: "Greece"),
                    CustomDropdownItem(title: "Bangladesh"),
                    CustomDropdownItem(title: "Brazil"),
                    CustomDropdownItem(title: "Egypt"),
                  ],
                  textEditingController: _controller,
                  hint: "Select Country",
                  editable: true,
                ),
                const SizedBox(height: 16),
                CustomDropdown(
                  options: [
                    CustomDropdownItem(title: "United States"),
                    CustomDropdownItem(title: "India"),
                    CustomDropdownItem(title: "Syria"),
                    CustomDropdownItem(title: "Australia"),
                    CustomDropdownItem(title: "Canada"),
                    CustomDropdownItem(title: "Germany"),
                    CustomDropdownItem(title: "China"),
                    CustomDropdownItem(title: "Belgium"),
                    CustomDropdownItem(title: "Greece"),
                    CustomDropdownItem(title: "Bangladesh"),
                    CustomDropdownItem(title: "Brazil"),
                    CustomDropdownItem(title: "Egypt"),
                  ],
                  textEditingController: _controller,
                  mandatary: true,
                  hint: "Select Country*",
                  borderRadius: 0,
                  dropdownBorderRadius: 0,
                ),
                const SizedBox(height: 16),
                CustomDropdown(
                  options: [
                    CustomDropdownItem(title: "United States"),
                    CustomDropdownItem(title: "India"),
                    CustomDropdownItem(title: "Syria"),
                    CustomDropdownItem(title: "Australia"),
                    CustomDropdownItem(title: "Canada"),
                    CustomDropdownItem(title: "Germany"),
                    CustomDropdownItem(title: "China"),
                    CustomDropdownItem(title: "Belgium"),
                    CustomDropdownItem(title: "Greece"),
                    CustomDropdownItem(title: "Bangladesh"),
                    CustomDropdownItem(title: "Brazil"),
                    CustomDropdownItem(title: "Egypt"),
                  ],
                  textEditingController: _controller,
                  mandatary: true,
                  hint: "Select Country",
                  label: "Country*",
                  errorMessage: "Please select your Country",
                ),
                const SizedBox(height: 16),
                CustomDropdown(
                  options: [
                    CustomDropdownItem(title: "United States"),
                    CustomDropdownItem(title: "India"),
                    CustomDropdownItem(title: "Syria"),
                    CustomDropdownItem(title: "Australia"),
                    CustomDropdownItem(title: "Canada"),
                    CustomDropdownItem(title: "Germany"),
                    CustomDropdownItem(title: "China"),
                    CustomDropdownItem(title: "Belgium"),
                    CustomDropdownItem(title: "Greece"),
                    CustomDropdownItem(title: "Bangladesh"),
                    CustomDropdownItem(title: "Brazil"),
                    CustomDropdownItem(title: "Egypt"),
                  ],
                  textEditingController: _controller,
                  hint: "Select Country",
                  borderRadius: 100,
                  prefix: const Icon(Icons.flag_circle),
                ),
                const SizedBox(height: 16),
                CustomDropdown(
                  options: [
                    CustomDropdownItem(title: "United States"),
                    CustomDropdownItem(title: "India"),
                    CustomDropdownItem(title: "Syria"),
                    CustomDropdownItem(title: "Australia"),
                    CustomDropdownItem(title: "Canada"),
                    CustomDropdownItem(title: "Germany"),
                    CustomDropdownItem(title: "China"),
                    CustomDropdownItem(title: "Belgium"),
                    CustomDropdownItem(title: "Greece"),
                    CustomDropdownItem(title: "Bangladesh"),
                    CustomDropdownItem(title: "Brazil"),
                    CustomDropdownItem(title: "Egypt"),
                  ],
                  textEditingController: _controller,
                  hint: "Select Country",
                  label: "Country",
                  outlined: false,
                  filled: true,
                  icon: const Icon(Icons.flag_circle),
                ),
                const SizedBox(height: 16),
                CustomDropdown(
                  options: [
                    CustomDropdownItem(title: "United States"),
                    CustomDropdownItem(title: "India"),
                    CustomDropdownItem(title: "Syria"),
                    CustomDropdownItem(title: "Australia"),
                    CustomDropdownItem(title: "Canada"),
                    CustomDropdownItem(title: "Germany"),
                    CustomDropdownItem(title: "China"),
                    CustomDropdownItem(title: "Belgium"),
                    CustomDropdownItem(title: "Greece"),
                    CustomDropdownItem(title: "Bangladesh"),
                    CustomDropdownItem(title: "Brazil"),
                    CustomDropdownItem(title: "Egypt"),
                  ],
                  enabled: false,
                  textEditingController: _controller,
                  hint: "Select Country",
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(_controller.text),
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
