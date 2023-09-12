import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FieldContainer extends StatefulWidget {
  const FieldContainer({
    super.key,
    required this.labelText,
    required this.iconField,
    required this.obscureText,
    required this.controller,
  });

  final String labelText;
  final Icon iconField;
  final bool obscureText;
  final TextEditingController controller;

  @override
  State<FieldContainer> createState() => _FieldContainerState();
}

class _FieldContainerState extends State<FieldContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 50,
      ),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9_-]'))
          ],
          controller: widget.controller,
          textInputAction: TextInputAction.go,
          obscureText: widget.obscureText,
          maxLength: 12,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade600),
            ),
            prefixIcon: widget.iconField,
            prefixIconColor: Colors.black,
            labelText: widget.labelText,
            /* hide maxLength */
            counterText: '',
            labelStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
          ),
        ),
      ),
    );
  }
}
