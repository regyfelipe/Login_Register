import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String label;
  final String hint;
  final bool isPassword;
  final String? Function(String?)? validator; 
  final ValueChanged<String> onChanged;

  const InputField({
    super.key,
    required this.label,
    required this.hint,
    this.isPassword = false,
    this.validator,
    required this.onChanged, 
  });

  @override
  // ignore: library_private_types_in_public_api
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _isObscured = true; 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        TextFormField( 
          obscureText: widget.isPassword ? _isObscured : false,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white, 
            hintText: widget.hint,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.black, 
                width: 1,
              ),
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  )
                : null,
          ),
          validator: widget.validator, 
          onChanged: widget.onChanged, 
        ),
      ],
    );
  }
}
