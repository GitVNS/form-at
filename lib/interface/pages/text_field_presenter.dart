import 'package:flutter/material.dart';

import '../components/custom_outlined_field.dart';
import '../utils/app_colors.dart';

class TextFieldPresenter extends StatefulWidget {
  const TextFieldPresenter({super.key});

  @override
  State<TextFieldPresenter> createState() => _TextFieldPresenterState();
}

class _TextFieldPresenterState extends State<TextFieldPresenter> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  final _focus1 = FocusNode();
  final _focus2 = FocusNode();
  bool obsecurePassword = true;
  bool clearButton = false;
  bool rounded = false;
  bool filled = false;
  bool outlined = true;
  bool focusNode = false;
  bool enable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Fields"),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: optionButton(
                  title: "Outlined",
                  value: outlined,
                  onTap: () => setState(() => outlined = !outlined),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: optionButton(
                  title: "Pill shape",
                  value: rounded,
                  onTap: () => setState(() => rounded = !rounded),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: optionButton(
                  title: "Filled",
                  value: filled,
                  onTap: () => setState(() => filled = !filled),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: optionButton(
                  title: "FocusNode",
                  value: focusNode,
                  onTap: () => setState(() => focusNode = !focusNode),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          optionButton(
            title: enable ? "Enable" : "Disable",
            value: enable,
            onTap: () => setState(() => enable = !enable),
          ),
          const SizedBox(height: 8),
          const Divider(color: AppColors.secondary),
          const SizedBox(height: 8),
          Form(
            key: _formKey,
            child: Column(
              children: [
                ///basic
                CustomOutlinedField(
                  controller: _controller,
                  enabled: enable,
                  errorMessage: "Enter Something",
                  hint: "Enter Text",
                  filled: filled,
                  outlined: outlined,
                  borderRadius: rounded ? 100 : 8,
                  focusNode: focusNode ? _focus1 : null,
                  onSubmit: focusNode
                      ? (_) => FocusScope.of(context).requestFocus(_focus2)
                      : null,
                ),
                const SizedBox(height: 16),
                //with label
                CustomOutlinedField(
                  controller: _controller,
                  enabled: enable,
                  errorMessage: "Enter Something",
                  label: "Enter Text",
                  filled: filled,
                  outlined: outlined,
                  borderRadius: rounded ? 100 : 8,
                  focusNode: focusNode ? _focus2 : null,
                ),
                const SizedBox(height: 16),
                //with icon
                CustomOutlinedField(
                  controller: _controller,
                  enabled: enable,
                  errorMessage: "Enter Something",
                  label: "Enter Text",
                  filled: filled,
                  outlined: outlined,
                  borderRadius: rounded ? 100 : 8,
                  icon: const Icon(Icons.abc),
                ),
                const SizedBox(height: 16),
                //with obsecure text, prefix
                CustomOutlinedField(
                  controller: _controller,
                  enabled: enable,
                  errorMessage: "Enter Something",
                  label: "Enter Text",
                  filled: filled,
                  outlined: outlined,
                  borderRadius: rounded ? 100 : 8,
                  prefix: const Icon(Icons.password),
                  obsecure: true,
                  obsecureText: "*",
                ),
                const SizedBox(height: 16),
                //with clear button
                CustomOutlinedField(
                  controller: _controller,
                  enabled: enable,
                  errorMessage: "Enter Something",
                  label: "Enter Text",
                  hint: "Type here..",
                  filled: filled,
                  outlined: outlined,
                  borderRadius: rounded ? 100 : 8,
                  onChanged: (value) {
                    if (_controller.text.isNotEmpty) {
                      setState(() {
                        clearButton = true;
                      });
                    } else {
                      setState(() {
                        clearButton = false;
                      });
                    }
                  },
                  suffix: clearButton
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              _controller.clear();
                            });
                          },
                          icon: const Icon(Icons.clear),
                        )
                      : null,
                ),
                const SizedBox(height: 16),
                //with obsecure visibility
                CustomOutlinedField(
                  controller: _controller,
                  enabled: enable,
                  errorMessage: "Enter Something",
                  label: "Enter Text",
                  filled: filled,
                  outlined: outlined,
                  borderRadius: rounded ? 100 : 8,
                  obsecure: obsecurePassword,
                  obsecureText: "*",
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        obsecurePassword = !obsecurePassword;
                      });
                    },
                    icon: obsecurePassword
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          if (enable)
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

  Widget optionButton(
      {required String title,
      required bool value,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      splashFactory: InkSparkle.splashFactory,
      borderRadius: BorderRadius.circular(8),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: AppColors.secondary.shade500,
          ),
          color: value
              ? AppColors.secondary.shade700
              : AppColors.secondary.shade800,
        ),
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: value ? AppColors.primary : AppColors.primary.shade50,
              fontWeight: value ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
