import 'package:flutter/material.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    Key? key,
    required String label,
    String? hint,
    ListTileControlAffinity controlAffinity = ListTileControlAffinity.platform,
    bool initialValue = false,
    bool autofocus = false,
    bool enabled = true,
    FormFieldSetter<bool>? onSaved,
    FormFieldValidator<bool>? validator,
    required Color errorColor,
  }) : super(
          key: key,
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          builder: (FormFieldState<bool> state) {
            return CheckboxListTile(
              title: Text(label),
              subtitle: state.hasError
                  ? Text(
                      state.errorText!,
                      style: TextStyle(color: errorColor),
                    )
                  : hint == null
                      ? null
                      : Text(hint),
              controlAffinity: controlAffinity,
              value: state.value,
              onChanged: enabled ? state.didChange : null,
              autofocus: autofocus,
              contentPadding: EdgeInsets.zero,
            );
          },
        );
}
