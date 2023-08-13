import 'package:flutter/material.dart';
import 'package:former/interface/utils/app_colors.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.options,
    this.label = "",
    this.hint = "",
    required this.textEditingController,
    this.mandatary = false,
    this.arrowIcon = true,
    this.dropdownHeight = 300,
    this.dropdownElevation = 1,
    this.dropdownBorderRadius = 8,
    this.dropdownPadding = 8,
    this.scrollbar = true,
    this.filled = false,
    this.prefix,
    this.icon,
    this.errorMessage = "This field is Mandatory",
    this.borderRadius = 8,
    this.outlined = true,
    this.enabled = true,
    this.editable = false,
  });

  final List<CustomDropdownItem> options;
  final double dropdownHeight;
  final double dropdownElevation;
  final double dropdownBorderRadius;
  final double dropdownPadding;
  final bool scrollbar;
  final TextEditingController textEditingController;
  final String label;
  final String hint;
  final bool mandatary;
  final bool arrowIcon;
  final bool filled;
  final Widget? prefix;
  final Widget? icon;
  final String errorMessage;
  final double borderRadius;
  final bool outlined;
  final bool enabled;
  final bool editable;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final _focusNode = FocusNode();
  final _layerLink = LayerLink();
  late OverlayEntry _overlayEntry;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context).insert(_overlayEntry);
      } else {
        _overlayEntry.remove();
      }
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Size size = renderBox.size;
    return OverlayEntry(builder: (context) {
      return Positioned(
        width: size.width,
        height: widget.dropdownHeight,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: widget.dropdownElevation,
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(widget.dropdownBorderRadius),
            child: RawScrollbar(
              controller: _scrollController,
              padding: EdgeInsets.all(widget.dropdownPadding),
              radius: Radius.circular(widget.dropdownBorderRadius),
              thumbVisibility: widget.scrollbar,
              thumbColor: AppColors.primary.shade900,
              trackVisibility: widget.scrollbar,
              trackColor: AppColors.secondary,
              trackRadius: Radius.circular(widget.dropdownBorderRadius),
              child: ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.all(widget.dropdownPadding),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.options.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(widget.options[index].title),
                    leading: widget.options[index].icon,
                    onTap: () {
                      widget.textEditingController.text =
                          widget.options[index].title;
                      _focusNode.unfocus();
                    },
                  );
                },
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextFormField(
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
          suffixIcon:
              widget.arrowIcon ? const Icon(Icons.arrow_drop_down) : null,
          filled: widget.filled,
          fillColor: AppColors.secondary.shade700,
        ),
        readOnly: !widget.editable,
        controller: widget.textEditingController,
        focusNode: _focusNode,
        onTap: !widget.mandatary
            ? () {
                if (_focusNode.hasFocus) {
                  _focusNode.unfocus();
                }
              }
            : null,
        enabled: widget.enabled,
        validator: widget.mandatary
            ? (value) {
                if (value == null || value.trim().isEmpty) {
                  return widget.errorMessage;
                }
                return null;
              }
            : null,
      ),
    );
  }
}

class CustomDropdownItem {
  final String title;
  final Widget? icon;
  CustomDropdownItem({required this.title, this.icon});
}
