import 'package:custom_drawer/SecondLayer.dart';
import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _animationController;

  double xoffSet = 0;
  double yoffSet = 0;
  var height = 30;
  var width = 30;
  double angle = 0;

  bool isOpen = false;
  bool isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        transform: Matrix4Transform()
            .translate(x: xoffSet, y: yoffSet)
            .rotate(angle)
            .matrix4,
        duration: Duration(milliseconds: 250),
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: isOpen
                    ? BorderRadius.circular(10)
                    : BorderRadius.circular(0)),
            child: SafeArea(
                          child: Stack(
                children: [
                  !isOpen
                      ? IconButton(
                          icon:
                              // AnimatedIcon(
                              //   icon: AnimatedIcons.close_menu,
                              //   color: Colors.blue[700],
                              //   progress: _animationController,
                              // ),
                              Icon(Icons.menu,color: Color(0xFF1f186f),),
                          onPressed: () {
                            xoffSet = 150;
                            yoffSet = 80;
                            angle = -0.2;
                            isOpen = true;
                            setState(() {});

                            secondLayerState.setState(() {
                              secondLayerState.xoffSet = 122;
                              secondLayerState.yoffSet = 110;
                              secondLayerState.angle = -0.275;
                            });
                          })
                      : IconButton(
                          icon: Icon(Icons.arrow_back_ios,color: Color(0xFF1f186f)),
                          onPressed: () {
                            if (isOpen == true) {
                              xoffSet = 0;
                              yoffSet = 0;
                              angle = 0;
                              isOpen = false;
                              setState(() {});

                              secondLayerState.setState(() {
                                secondLayerState.xoffSet = 0;
                                secondLayerState.yoffSet = 0;
                                secondLayerState.angle = 0;
                              });
                            }
                          }),
                  Center(
                    child: Image.asset(
                      "assets/avatar.png",
                      height: MediaQuery.of(context).size.height / 2,
                    ),
                  ),
                ],
              ),
            )));
  }

  // void _handleOnPressed() {
  //   isPlaying = !isPlaying;
  //   isPlaying ? _animationController.forward() : _animationController.reverse();
  //   abcd();
  // }

  abcd() {
    print(isOpen);
    print(xoffSet);
    print(yoffSet);
    print(angle);

    if (isOpen == true) {
      xoffSet = 0;
      yoffSet = 0;
      angle = 0;
      isOpen = false;
      setState(() {});

      secondLayerState.setState(() {
        secondLayerState.xoffSet = 0;
        secondLayerState.yoffSet = 0;
        secondLayerState.angle = 0;
      });
    }
    if (isOpen == false) {
      xoffSet = 150;
      yoffSet = 80;
      angle = -0.2;
      isOpen = true;
      setState(() {});

      secondLayerState.setState(() {
        secondLayerState.xoffSet = 122;
        secondLayerState.yoffSet = 110;
        secondLayerState.angle = -0.275;
      });
    }
  }
}
