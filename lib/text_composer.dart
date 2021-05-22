import 'package:flutter/material.dart';

class TextComposer extends StatefulWidget {
  Function(String) sendMessage;
  TextComposer(this.sendMessage);

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  TextEditingController textEditingController = TextEditingController();

  bool _isComposing = false;

  void _resetTextField() {
    setState(() {
      textEditingController.clear();
      this._isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.camera), onPressed: () {}),
          Expanded(
            child: TextField(
              controller: textEditingController,
              decoration:
                  InputDecoration.collapsed(hintText: "Enviar uma mensagem..."),
              onChanged: (text) {
                setState(() {
                  _isComposing = text.isNotEmpty;
                });
              },
              onSubmitted: (text) {
                widget.sendMessage(textEditingController.text);
                _resetTextField();
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _isComposing
                ? () {
                    widget.sendMessage(textEditingController.text);
                    _resetTextField();
                  }
                : null,
          )
        ],
      ),
    );
  }
}
