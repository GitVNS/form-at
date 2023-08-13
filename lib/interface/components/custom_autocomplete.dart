import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomAutocomplete extends StatefulWidget {
  const CustomAutocomplete({
    super.key,
    required this.validatorController,
    required this.suggestions,
    this.suggestionsHeight = 250,
    this.suggestionsBorderRadius = 8,
    this.scrollbar = true,
    this.hint = "",
    this.label = "",
    this.mandatary = false,
    this.filled = false,
    this.prefix,
    this.icon,
    this.errorMessage = "This field is Mandatory",
    this.borderRadius = 8,
    this.outlined = true,
    this.enabled = true,
  });

  final TextEditingController validatorController;
  final List<String> suggestions;
  final double suggestionsHeight;
  final double suggestionsBorderRadius;
  final bool scrollbar;
  final String hint;
  final String label;
  final bool outlined;
  final bool enabled;
  final Widget? prefix;
  final Widget? icon;
  final String errorMessage;
  final double borderRadius;
  final bool mandatary;
  final bool filled;

  @override
  State<CustomAutocomplete> createState() => _CustomAutocompleteState();
}

class _CustomAutocompleteState extends State<CustomAutocomplete> {
  final _key = GlobalKey();
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return RawAutocomplete(
      key: _key,
      optionsBuilder: (textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return widget.suggestions.where((option) {
          return option.contains(textEditingValue.text);
        });
      },
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        return TextFormField(
          decoration: InputDecoration(
            floatingLabelAlignment: FloatingLabelAlignment.start,
            label: widget.label.isEmpty ? null : Text(widget.label),
            hintText: widget.hint.isEmpty ? null : widget.hint,
            border: widget.outlined
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                  )
                : const UnderlineInputBorder(),
            icon: widget.icon,
            prefixIcon: widget.prefix,
            prefixIconConstraints: const BoxConstraints(minWidth: 50),
            filled: widget.filled,
            fillColor: AppColors.secondary.shade700,
          ),
          focusNode: focusNode,
          controller: textEditingController,
          textCapitalization: TextCapitalization.words,
          enabled: widget.enabled,
          onFieldSubmitted: (String value) {
            setState(() {
              widget.validatorController.text = value;
            });
            onFieldSubmitted();
          },
          validator: widget.mandatary
              ? (value) {
                  if (value == null || value.trim().isEmpty) {
                    return widget.errorMessage;
                  }
                  return null;
                }
              : null,
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
        RenderBox renderBox =
            _key.currentContext!.findRenderObject() as RenderBox;
        Size size = renderBox.size;
        return Container(
          margin: const EdgeInsets.only(top: 2),
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 0,
            color: Colors.transparent,
            child: SizedBox(
              height: widget.suggestionsHeight,
              width: size.width,
              child: RawScrollbar(
                controller: _scrollController,
                padding: EdgeInsets.all(widget.suggestionsBorderRadius),
                radius: Radius.circular(widget.suggestionsBorderRadius),
                thumbVisibility: widget.scrollbar,
                thumbColor: AppColors.primary.shade900,
                trackVisibility: widget.scrollbar,
                trackColor: AppColors.secondary,
                trackRadius: Radius.circular(widget.suggestionsBorderRadius),
                child: ListView.builder(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 4),
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String option = options.elementAt(index);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: ListTile(
                        tileColor: AppColors.secondary.shade700,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                widget.suggestionsBorderRadius)),
                        onTap: () {
                          onSelected(option);
                        },
                        title: Text(option),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
