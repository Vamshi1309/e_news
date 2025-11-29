import 'package:flutter/material.dart';

class InputFields extends StatefulWidget {
  final String inputText;
  final IconData? inputIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final bool obscure;
  final bool onTapSuffix;

  const InputFields({super.key,
    required this.inputText,
    this.inputIcon,
    this.controller,
    this.obscure = false,
    this.suffixIcon,
    this.onTapSuffix = false,
  });

  @override
  State<InputFields> createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  late bool _obscure;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _obscure = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscure,
      controller: widget.controller,
      style: TextStyle(
        fontFamily: 'MW',
        color: Colors.white,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        hintText: widget.inputText,
        hintStyle: TextStyle(
          fontFamily: 'MW',
          color: Colors.white,
          fontSize: 18,
        ),
        prefixIcon: widget.inputIcon != null
            ? Icon(
          widget.inputIcon,
          color: Colors.white,
        )
            : null,
        suffixIcon: widget.inputIcon != null
            ? GestureDetector(
          onTap: (){
            if(widget.onTapSuffix){
              setState(() {
                _obscure = !_obscure;
              });
            }
          },
          child: Icon(
            widget.suffixIcon,
            color: Colors.white,
          ),
        )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),
    );
  }
}
