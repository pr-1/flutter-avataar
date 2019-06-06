import 'package:flutter/material.dart';

class ImagePageView extends StatefulWidget {
  @override
  _ImagePageViewState createState() => new _ImagePageViewState();
}

class _ImagePageViewState extends State<ImagePageView> {
  PageController controller;
  int currentpage = 0;

  @override
  initState() {
    super.initState();
    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.6,
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentpage = value;
                });
              },
              controller: controller,
              itemBuilder: (context, index) => builder(index)
    );
  }

  builder(int index) {
    return new AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          double value = 1.0;
          if (controller.position.haveDimensions) {
            value = controller.page - index;
            value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
          }
          return new Center(
            child: Container(
              margin: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: Curves.easeOut.transform(value) * 120,
                    backgroundImage: AssetImage(
                      "assets/background.jpg",
                    ),
                  ),
                  SizedBox(
                    height: Curves.easeOut.transform(value) * 40,
                  ),
                  Text(
                    "Your inner circle",
                    style: TextStyle(
                        fontSize: Curves.easeOut.transform(value) * 32,
                        fontWeight: FontWeight.w200,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          );
        });
  }
}
