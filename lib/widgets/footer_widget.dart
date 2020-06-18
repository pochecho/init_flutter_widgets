import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.fromBorderSide(BorderSide(
            color: Colors.grey,
            width: 1,
          ))),
      child: Row(
        children: [
          Expanded(
            child: Icon(
              Icons.image,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Expanded(
            child: Icon(
              Icons.image_aspect_ratio,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
