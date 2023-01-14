import 'dart:async';

import 'package:flutter/material.dart';

import '../../shared/ui.dart';
import '../toast-modal/main.dart';
import '../toast-wrap/main.dart';

class BylToast {
  /// 展示弹窗
  static String Function(ToastModalOptions)? show;

  /// 关闭弹窗 通过id
  static void Function(String)? hide;

  /// 清除所有的弹窗
  static void Function()? clear;

  /// 展示弹窗
  /// duration 单位毫秒
  static String showToast({
    required String text,
    int? duration = 1500,
    bool? mask,
    Color? maskColor,
    void Function()? onMask,
  }) {
    if (show != null) {
      ToastModalOptions item = ToastModalOptions(
        mask: mask,
        maskColor: maskColor,
        onMask: onMask,
        id: ToastModalOptions.getId(),
        child: Container(
          padding: const EdgeInsets.all(20),
          constraints: BoxConstraints(
            maxWidth: UI.defaultToasMaxtWidth,
          ),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.7),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              height: 25 / 18,
              color: Colors.white,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      );

      show!(item);

      /// 默认1500毫秒关闭
      Timer(Duration(milliseconds: duration ?? 1500), () {
        hide!(item.id);
      });

      return item.id;
    }

    return "";
  }

  /// 入口方法
  static Widget init(BuildContext context, Widget? child) {
    return Stack(
      children: [
        if (child != null) child,
        const ToastWrap(),
      ],
    );
  }
}
