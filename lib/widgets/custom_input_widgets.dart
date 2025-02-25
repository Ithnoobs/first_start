import 'package:flutter/material.dart';

class CustomInputWidgets extends StatefulWidget {
  
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final TextEditingController? controller;

  const CustomInputWidgets({super.key, this.labelText, this.hintText, this.prefixIcon, this.controller});

  @override
  State<CustomInputWidgets> createState() => _CustomInputWidgetsState();
}

class _CustomInputWidgetsState extends State<CustomInputWidgets> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
              width: double.infinity,
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
                  labelText: '${widget.labelText}',
                  hintText: "${widget.hintText}",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            );
  }
}