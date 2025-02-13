import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/bx.dart';

enum GToastType {
  success(
    backgroundColor: Colors.greenAccent,
    borderColor: Colors.transparent,
    iconColor: Color(0xFF1B5E20),
    textColor: Color(0xFF1B5E20),
    icon: Iconify(Bi.check_circle, color: Color(0xFF1B5E20)),
  ),
  warning(
    backgroundColor: Colors.yellowAccent,
    borderColor: Colors.transparent,
    iconColor: Colors.black,
    textColor: Colors.black,
    icon: Iconify(Bi.exclamation_circle, color: Colors.black),
  ),
  alert(
    backgroundColor: Colors.redAccent,
    borderColor: Colors.transparent,
    iconColor: Colors.white,
    textColor: Colors.white,
    icon: Iconify(Bx.x_circle, color: Colors.white),
  ),
  information(
    backgroundColor: Colors.blueAccent,
    borderColor: Colors.transparent,
    iconColor: Colors.white,
    textColor: Colors.white,
    icon: Iconify(Bi.info_circle, color: Colors.white),
  ),
  connection(
    backgroundColor: Colors.deepPurpleAccent,
    borderColor: Colors.transparent,
    iconColor: Colors.white,
    textColor: Colors.white,
    icon: Iconify(Bi.cloud, color: Colors.white),
  );

  final Color backgroundColor;
  final Color borderColor;
  final Color iconColor;
  final Color textColor;
  final Widget icon;

  const GToastType({
    required this.backgroundColor,
    required this.borderColor,
    required this.iconColor,
    required this.icon,
    required this.textColor,
  });
}

abstract final class GToast {
  static final Set<OverlayEntry> _queue = {};

  static bool get isShowing => _queue.isNotEmpty;

  static void show({
    GToastType type = GToastType.warning,
    String message = 'Terjadi kesalahan yang tidak diketahui',
    Icon? icon,
    required BuildContext context,
  }) {
    late final OverlayEntry overlayEntry;

    final timer = Timer(const Duration(seconds: 3), () {
      _queue.remove(overlayEntry);
      if (overlayEntry.mounted) overlayEntry.remove();
    });

    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          top: 20,
          left: 20,
          right: 20,
          child: SafeArea(
            child: Material(
              color: Colors.transparent,
              child: _BToast(
                type: type,
                message: message,
                icon: icon,
                onClose: () {
                  timer.cancel();
                  _queue.remove(overlayEntry);
                  overlayEntry.remove();
                },
              ),
            ),
          ),
        );
      },
      maintainState: true,
    );

    Overlay.of(context).insert(overlayEntry);
    _queue.add(overlayEntry);
  }

  static void close() async {
    for (var entry in _queue) {
      Future.sync(() => entry.remove());
    }
    _queue.clear();
  }
}

class _BToast extends StatefulWidget {
  const _BToast({
    required this.type,
    required this.message,
    required this.onClose,
    required this.icon,
  });

  final GToastType type;
  final String message;
  final Icon? icon;
  final VoidCallback onClose;

  @override
  _BToastState createState() => _BToastState();
}

class _BToastState extends State<_BToast> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<Offset> animation;
  final _key = UniqueKey();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween<Offset>(begin: const Offset(0, -1), end: const Offset(0, 0.0)).chain(CurveTween(curve: Curves.easeOutCirc)).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _handleRemove() {
    if (!context.mounted) return;
    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: Dismissible(
        key: _key,
        direction: DismissDirection.horizontal,
        onDismissed: (_) => _handleRemove(),
        child: InkWell(
          onTap: () => _handleRemove(),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: ShapeDecoration(
              color: widget.type.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: widget.type.borderColor, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.icon != null) widget.icon! else widget.type.icon,
                const SizedBox(width: 8.0),
                Builder(
                  builder: (context) => Expanded(
                    child: Text(
                      widget.message,
                      style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500, color: widget.type.textColor),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                InkWell(
                  onTap: () => _handleRemove(),
                  child: Iconify(Bi.x, color: widget.type.iconColor, size: 24),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
