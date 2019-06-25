import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/drag.dart';
import 'package:flutter/src/rendering/viewport_offset.dart';

class CustomScrollController extends ScrollController {
  CustomScrollPosition scrollPosition;
}


class CustomScrollPosition extends ScrollPosition {
  bool didScrollComplete;
  @override
  void didStartScroll() {
    didScrollComplete = false;
    super.didStartScroll();
  }
  @override
  void didEndScroll() {
    didScrollComplete = true;
    super.didEndScroll();
  }

  @override
  Future<void> animateTo(double to, {Duration duration, Curve curve}) {
    // TODO: implement animateTo
    return null;
  }

  @override
  // TODO: implement axisDirection
  AxisDirection get axisDirection => null;

  @override
  Drag drag(DragStartDetails details, dragCancelCallback) {
    // TODO: implement drag
    return null;
  }

  @override
  ScrollHoldController hold(holdCancelCallback) {
    // TODO: implement hold
    return null;
  }

  @override
  void jumpTo(double value) {
    // TODO: implement jumpTo
  }

  @override
  void jumpToWithoutSettling(double value) {
    // TODO: implement jumpToWithoutSettling
  }

  @override
  // TODO: implement userScrollDirection
  ScrollDirection get userScrollDirection => null;
}