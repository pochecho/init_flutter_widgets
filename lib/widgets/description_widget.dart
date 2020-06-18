import 'package:flutter/material.dart';
import 'package:init_widgets/styles/text_style.dart';

class DescriptionWidget extends StatelessWidget {
  final String image;
  final String title;
  final List<String> properties;
  final Axis orientation;
  const DescriptionWidget(
      {Key key, this.image, this.title, this.properties, this.orientation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Axis direction = Axis.vertical;

    print(this.image);
    var factor = 0.4;
    var factorI = 0.3;

    var height = MediaQuery.of(context).size.width * factor;
    var width = MediaQuery.of(context).size.width * factor;

    var sizeI = MediaQuery.of(context).size.width * factorI;
    var flex = this.orientation == Axis.horizontal ? 2 : 1;
    return Container(
      height: height,
      width: height,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.grey)),
      child: Flex(
        direction: this.orientation,
        children: [
          Expanded(
            flex: 3,
            child: Container(
     
              child: Image.asset(
                this.image,
                height: sizeI,
                width: sizeI,
              ),
            ),
          ),
          // SizedBox(
          //   height: 10,
          //   width: 10,
          // ),
          Expanded(
              flex: flex,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Text(
                      this.title,
                      style: H1,
                    ),
                  ),
                  for (var property in this.properties)
                    Expanded(
                      child: Text(
                        property,
                        style: H1,
                      ),
                    )
                ],
              ))
        ],
      ),
    );
  }
}
