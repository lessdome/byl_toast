import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ToastModalOptions {
  /// 当前弹窗的标识
  final String id;

  /// 是否展示背景蒙版
  final bool? mask;

  /// 背景蒙版颜色
  final Color? maskColor;

  /// 蒙版点击事件
  final void Function()? onMask;
  final Widget? child;

  /// 获取id
  /// 当前时间戳--微秒 + 随机数
  static String getId() {
    return "${DateTime.now().microsecond}-${Random().nextInt(999999999)}";
  }

  const ToastModalOptions({
    required this.id,
    this.mask,
    this.maskColor,
    this.onMask,
    this.child,
  });
}

class ToastModal extends StatelessWidget {
  final ToastModalOptions options;

  const ToastModal({
    Key? key,
    required this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (options.mask != null && options.mask!)
          Positioned(
            width: window.physicalSize.width,
            height: window.physicalSize.height,
            child: Container(
              color: options.maskColor,
            ),
          ),
        Center(
          child: options.child,
        ),
      ],
    );
  }
}
