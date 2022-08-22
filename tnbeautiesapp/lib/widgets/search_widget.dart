import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final String hintText;
  final ValueChanged<String> onChanged;

  const SearchWidget(
      {Key? key,
      required this.text,
      required this.hintText,
      required this.onChanged})
      : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: const Icon(Icons.search),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
