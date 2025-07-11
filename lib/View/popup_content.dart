import 'package:flutter/material.dart';

class PopupContent extends StatefulWidget {
  final Widget content;

  PopupContent({
    Key? key,
    required this.content,
  }) : super(key: key);

  _PopupContentState createState() => _PopupContentState();
}

class _PopupContentState extends State<PopupContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child:
      widget.content,
      ),
    );
  }
}
