import 'package:draggable_widget/draggable_widget.dart';
import 'package:flutter/material.dart';
import 'package:dora_music/generated/assets.dart';

/// File Name: draggable_demo
/// Project Name: flutter_test
/// Created By Hongzhang Chen On 2023-03-07
/// Copy Right ©2023-03-07 flutter_test All Right Reserved
///

class DraggableDemo extends StatefulWidget {
  const DraggableDemo({Key? key}) : super(key: key);

  @override
  State<DraggableDemo> createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {
  final dragController = DragController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    dragController.showWidget();
                  },
                  child: Text("Show"),
                ),
                TextButton(
                  onPressed: () {
                    dragController.hideWidget();
                  },
                  child: Text("Hide"),
                ),
                TextButton(
                  onPressed: () {
                    dragController.jumpTo(AnchoringPosition.topRight);
                  },
                  child: Text("Move to Top Right"),
                ),
                TextButton(
                  onPressed: () {
                    dragController.jumpTo(AnchoringPosition.topLeft);
                  },
                  child: Text("Move to Top Left"),
                ),
                TextButton(
                  onPressed: () {
                    dragController.jumpTo(AnchoringPosition.bottomRight);
                  },
                  child: Text("Move to bottom Right"),
                ),
                TextButton(
                  onPressed: () {
                    dragController.jumpTo(AnchoringPosition.bottomLeft);
                  },
                  child: Text("Move to Bottom Left"),
                ),
                TextButton(
                  onPressed: () {
                    dragController.jumpTo(AnchoringPosition.center);
                  },
                  child: Text("Move to Center"),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: double.infinity,
            color: Colors.green,
          ),
          DraggableWidget(
            bottomMargin: 80,
            topMargin: 80,
            intialVisibility: true,
            horizontalSpace: 20,
            shadowBorderRadius: 50,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Image.asset(Assets.imagesBasketball),
            ),
            initialPosition: AnchoringPosition.bottomLeft,
            dragController: dragController,
          )
        ],
      ),
    );
  }
}
