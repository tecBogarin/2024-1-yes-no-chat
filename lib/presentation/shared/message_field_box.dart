import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onFieldSubmitted: (value) {
        print('Valor enviado: $value');
        textController.clear();
        focusNode.requestFocus();
      },
      decoration: _buildInputDecoration(
        inputBorder: _outlineInputBorder(),
        onPressed: () => _onPressed(textController: textController),
      ),
    );
  }

  UnderlineInputBorder _outlineInputBorder() => const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      );

  InputDecoration _buildInputDecoration({
    required InputBorder inputBorder,
    required VoidCallback onPressed,
  }) =>
      InputDecoration(
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_and_archive_outlined),
          onPressed: onPressed,
        ),
      );

  void _onPressed({required TextEditingController textController}) {
    final textValue = textController.text;
    print('Valor de la nueva función: $textValue');
    textController.clear();
  }
}
