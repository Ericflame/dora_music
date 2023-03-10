import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {
  Widget draggableWidget;
  Offset offset; //初始位置
  DraggableWidget({required this.draggableWidget, this.offset = const Offset(5, 5)});

  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Offset _calOffset(Size size, Offset offset, Offset nextOffset) {
    double dx = 0;
    //水平方向偏移量不能小于0不能大于屏幕最大宽度
    if (offset.dx + nextOffset.dx <= 0) {
      dx = 0;
    } else if (offset.dx + nextOffset.dx >= (size.width - 50)) {
      dx = size.width - 50;
    } else {
      dx = offset.dx + nextOffset.dx;
    }
    double dy = 0;
    //垂直方向偏移量不能小于0不能大于屏幕最大高度
    if (offset.dy + nextOffset.dy >= (size.height - 100)) {
      dy = size.height - 100;
    } else if (offset.dy + nextOffset.dy <= kToolbarHeight) {
      dy = kToolbarHeight;
    } else {
      dy = offset.dy + nextOffset.dy;
    }
    return Offset(
      dx,
      dy,
    );
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double appBarHeight = kToolbarHeight;
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            left: widget.offset.dx,
            top: widget.offset.dy,
            child: Draggable(
              child: widget.draggableWidget,
              childWhenDragging: Container(),
              feedback: widget.draggableWidget,
              onDragEnd: (detail) {
                print("Draggable onDragEnd ${detail.velocity.toString()} ${detail.offset.toString()}");
              },
              onDragCompleted: () {
                print("Draggable onDragCompleted");
              },
              onDragStarted: () {
                print("Draggable onDragStarted");
              },
              onDraggableCanceled: (Velocity velocity, Offset offset) {
                print("Draggable onDraggableCanceled ${velocity.toString()} ${offset.toString()}");
                setState(() {
                  widget.offset = Offset(offset.dx, offset.dy - appBarHeight - statusBarHeight);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
