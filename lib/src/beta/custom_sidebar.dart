import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_acrylic/widgets/transparent_macos_sidebar.dart';

import 'toggle_bar.dart';

class SidebarFrame extends StatefulWidget {
  final Widget child;
  final Widget sidebar;
  final MacOSBlurViewState macOSBlurViewState;

  const SidebarFrame(
      {Key? key,
      required this.sidebar,
      required this.child,
      required this.macOSBlurViewState})
      : super(key: key);

  @override
  State<SidebarFrame> createState() => _SidebarFrameState();
}

class _SidebarFrameState extends State<SidebarFrame> {
  bool _isOpen = true;

  @override
  Widget build(BuildContext context) {
    if (!Platform.isMacOS) {
      return widget.child;
    }

    final sidebarWidth = MediaQuery.of(context).size.width * 0.2;

    return Container(
      color: _isOpen
          ? Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8)
          : Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        children: [
          Row(
            children: [
              TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 1200),
                curve: Curves.fastLinearToSlowEaseIn,
                tween: Tween<double>(
                    begin: _isOpen ? sidebarWidth : 0.0,
                    end: _isOpen ? sidebarWidth : 0.0),
                builder: (BuildContext context, double value, Widget? child) {
                  return TransparentMacOSSidebar(
                    state: widget.macOSBlurViewState,
                    child: Container(
                      width: value,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(),
                      child: OverflowBox(
                        minWidth: sidebarWidth,
                        maxWidth: sidebarWidth,
                        child: child,
                      ),
                    ),
                  );
                },
                child: widget.sidebar,
              ),
              _isOpen
                  ? Container(
                      width: 1.0,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            width: 1.0,
                            color: Colors.grey[500]!,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(
                      width: 1,
                    ),
              Expanded(
                child: widget.child,
              ),
            ],
          ),
          ToggleBar(
            onPressed: () {
              setState(() {
                _isOpen = !_isOpen;
              });
            },
          ),
        ],
      ),
    );
  }
}
