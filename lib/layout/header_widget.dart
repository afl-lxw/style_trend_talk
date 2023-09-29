import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(100); // 设置首选高度

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Custom  Example'),

      // 此处放置你的自定义内容
    );
  }
}
