import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';

class OtpInputRow extends StatefulWidget {
  final int length;
  final List<String> values;
  final ValueChanged<MapEntry<int, String>> onChanged;
  final bool showError;

  const OtpInputRow({
    super.key,
    required this.length,
    required this.values,
    required this.onChanged,
    required this.showError,
  });

  @override
  State<OtpInputRow> createState() => _OtpInputRowState();
}

class _OtpInputRowState extends State<OtpInputRow> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _nodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.length,
      (index) => TextEditingController(
        text: widget.values.length > index ? widget.values[index] : '',
      ),
    );
    _nodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void didUpdateWidget(covariant OtpInputRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    for (var i = 0; i < widget.length; i++) {
      final value = widget.values.length > i ? widget.values[i] : '';
      if (_controllers[i].text != value) {
        _controllers[i].text = value;
      }
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _nodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _handleChanged(int index, String value) {
    widget.onChanged(MapEntry(index, value));
    if (value.isNotEmpty && index < widget.length - 1) {
      _nodes[index + 1].requestFocus();
    }
  }

  void _handleBackspace(int index, RawKeyEvent event) {
    if (event is RawKeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace) {
      if (_controllers[index].text.isEmpty && index > 0) {
        _nodes[index - 1].requestFocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(widget.length, (index) {
        return SizedBox(
          width: AppDimens.otpBoxSize,
          height: AppDimens.otpBoxSize,
          child: RawKeyboardListener(
            focusNode: FocusNode(skipTraversal: true),
            onKey: (event) => _handleBackspace(index, event),
            child: TextField(
              controller: _controllers[index],
              focusNode: _nodes[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: AppTextStyles.titleMedium,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(1),
              ],
              onChanged: (text) => _handleChanged(index, text),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.fieldFill,
                contentPadding: EdgeInsets.zero,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDimens.otpRadius),
                  borderSide: BorderSide(
                    color: widget.showError
                        ? AppColors.error
                        : AppColors.border,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDimens.otpRadius),
                  borderSide: BorderSide(
                    color: widget.showError
                        ? AppColors.error
                        : AppColors.primary,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
