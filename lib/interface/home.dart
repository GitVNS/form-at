import 'package:flutter/material.dart';
import 'package:former/interface/components/home_screen_button.dart';
import 'package:former/interface/pages/autocomplete_presenter.dart';
import 'package:former/interface/pages/checkbox_presenter.dart';
import 'package:former/interface/pages/dropdown_presenter.dart';
import 'package:former/interface/pages/filters_presenter.dart';
import 'package:former/interface/pages/pickers_presenter.dart';
import 'package:former/interface/pages/radio_presenter.dart';
import 'package:former/interface/pages/switch_presenter.dart';
import 'package:former/interface/pages/text_field_presenter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FormAt"),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          HomeScreenButton(
            title: "Text Fields",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const TextFieldPresenter(),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          HomeScreenButton(
            title: "Switches",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const SwitchPresenter(),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          HomeScreenButton(
            title: "Radios",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const RadioPresenter(),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          HomeScreenButton(
            title: "Checkboxes",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const CheckboxPresenter(),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          HomeScreenButton(
            title: "Dropdowns",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const DropdownPresenter(),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          HomeScreenButton(
            title: "Filters",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const FlitersPresenter(),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          HomeScreenButton(
            title: "Autocompletes",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const AutocompletePresenter(),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          HomeScreenButton(
            title: "Pickers",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const PickersPresenter(),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
