import 'package:flutter/material.dart';
import 'package:former/interface/components/custom_autocomplete.dart';

class AutocompletePresenter extends StatefulWidget {
  const AutocompletePresenter({super.key});

  @override
  State<AutocompletePresenter> createState() => _AutocompletePresenterState();
}

class _AutocompletePresenterState extends State<AutocompletePresenter> {
  List<String> options = [
    "United States",
    "India",
    "Syria",
    "Australia",
    "Canada",
    "Germany",
    "China",
    "Belgium",
    "Greece",
    "Bangladesh",
    "Brazil",
    "Egypt",
  ];

  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Autocompletes"),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomAutocomplete(
                  validatorController: _controller,
                  suggestions: options,
                  suggestionsBorderRadius: 0,
                  hint: "Country Name",
                  label: "Country*",
                  outlined: false,
                  filled: true,
                  mandatary: true,
                ),
                const SizedBox(height: 16),
                CustomAutocomplete(
                  validatorController: _controller,
                  suggestions: options,
                  hint: "Country Name*",
                  filled: true,
                  mandatary: true,
                  errorMessage: "Please enter Country name",
                ),
                const SizedBox(height: 16),
                CustomAutocomplete(
                  validatorController: _controller,
                  suggestions: options,
                  hint: "Country Name",
                  label: "Country",
                  borderRadius: 0,
                  prefix: const Icon(Icons.flag_circle),
                ),
                const SizedBox(height: 16),
                CustomAutocomplete(
                  validatorController: _controller,
                  suggestions: options,
                  hint: "Country Name",
                  borderRadius: 100,
                  icon: const Icon(Icons.flag_circle),
                  enabled: false,
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
