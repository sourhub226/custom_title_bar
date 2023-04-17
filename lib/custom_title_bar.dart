library custom_title_bar;

import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class CustomTitleBar extends StatefulWidget
    implements PreferredSizeWidget {
  const CustomTitleBar(
      {super.key,
      required this.title,
      this.backgroundColor,
      this.leading,
      this.size = 40,
      this.foregroundColor});

  final String title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget? leading;
  final double size;

  @override
  Size get preferredSize => Size.fromHeight(size);

  @override
  State<CustomTitleBar> createState() => _CustomTitleBarState();
}

class _CustomTitleBarState extends State<CustomTitleBar>
    with WindowListener {
  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowMaximize() {
    setState(() {});
  }

  @override
  void onWindowUnmaximize() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size,
      color: widget.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          children: [
            Expanded(
              child: DragToMoveArea(
                child: Container(
                  height: double.infinity,
                  // color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: widget.leading != null
                              ? const EdgeInsets.only(
                                  top: 9, bottom: 9, right: 16.0)
                              : const EdgeInsets.all(0),
                          child: widget.leading,
                        ),
                        Text(
                          widget.title,
                          style: TextStyle(
                            color: widget.foregroundColor,
                            // fontWeight: FontWeight.w500,
                          ),
                        ),
                        //TODO: Add a centered widget here
                        // Spacer(),
                        // Text("data"),
                        // Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: double.infinity,
              // color: Colors.pink,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //TODO: Ability to customize individial button icons
                  IconButton(
                      onPressed: () {
                        windowManager.minimize();
                      },
                      icon: Icon(
                        // Icons.signal_cellular_0_bar_rounded,
                        Icons.horizontal_rule_rounded,
                        size: 18,
                        color: widget.foregroundColor,
                      )),
                  FutureBuilder<bool>(
                    future: windowManager.isMaximized(),
                    builder:
                        (BuildContext context, AsyncSnapshot<bool> snapshot) {
                      if (snapshot.data == true) {
                        return IconButton(
                            onPressed: () {
                              windowManager.unmaximize();
                            },
                            icon: Icon(
                              Icons.square_rounded,
                              size: 16,
                              color: widget.foregroundColor,
                            ));
                      }
                      return IconButton(
                          onPressed: () {
                            windowManager.maximize();
                          },
                          icon: Icon(
                            Icons.check_box_outline_blank_rounded,
                            size: 16,
                            color: widget.foregroundColor,
                          ));
                    },
                  ),
                  IconButton(
                      onPressed: () {
                        windowManager.close();
                      },
                      icon: Icon(
                        Icons.close,
                        size: 20,
                        color: widget.foregroundColor,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
