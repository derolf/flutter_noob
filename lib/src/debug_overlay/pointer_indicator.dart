import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:noob/src/tools/constants.dart';
import 'package:noob/src/tools/tools.dart';

///
/// An overlay showing the pointer positions
///
class OverlayPointerIndicator extends HookWidget {
  const OverlayPointerIndicator({
    Key? key,
    this.enabled = true,
    this.indicatorSize = 20.0,
    this.indicatorColor = const Color.fromRGBO(0, 0, 255, 0.2),
    required this.child,
  }) : super(key: key);

  final Widget child;
  final bool enabled;
  final double indicatorSize;
  final Color indicatorColor;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      child,
      Positioned.fill(
        child: PointerIndicator(
          enabled: enabled,
          indicatorSize: indicatorSize,
          indicatorColor: indicatorColor,
        ),
      ),
    ]);
  }
}

///
/// A [Widget] showing the pointer positions.
///
class PointerIndicator extends StatelessWidget {
  const PointerIndicator({
    Key? key,
    this.enabled = true,
    this.indicatorSize = 20.0,
    this.indicatorColor = const Color.fromRGBO(0, 0, 255, 0.2),
  }) : super(key: key);

  final bool enabled;
  final double indicatorSize;
  final Color indicatorColor;

  @override
  Widget build(BuildContext context) => !enabled
      ? kEmpty
      : Consumer(
          builder: (context, watch, _) {
            final pointers = watch(lastPointerEventProvider);
            final pos = watch(globalPositionProvider(context))?.topLeft;
            return pos == null
                ? kEmpty
                : IgnorePointer(
                    child: Stack(
                      children: pointers.values.map((_) {
                        final size = indicatorSize * _.pressure;
                        return Positioned(
                          left: _.position.dx - size / 2 - pos.dx,
                          top: _.position.dy - size / 2 - pos.dy,
                          child: Container(
                            width: size,
                            height: size,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: indicatorColor,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
          },
        );
}
