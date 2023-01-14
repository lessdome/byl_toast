import 'package:flutter/material.dart';

import '../toast-modal/main.dart';
import '../toast/main.dart';

class ToastWrap extends StatefulWidget {
  const ToastWrap({Key? key}) : super(key: key);

  @override
  State<ToastWrap> createState() => _ToastWrapState();
}

class _ToastWrapState extends State<ToastWrap> {
  List<ToastModalOptions> toastList = [];

  String add(ToastModalOptions item) {
    setState(() {
      toastList.add(item);
    });

    return item.id;
  }

  void remove(String id) {
    setState(() {
      toastList.removeWhere((element) => element.id == id);
    });
  }

  void clear() {
    setState(() {
      toastList = [];
    });
  }

  @override
  void initState() {
    super.initState();

    BylToast.show = add;
    BylToast.hide = remove;
    BylToast.clear = clear;
  }

  @override
  Widget build(BuildContext context) {
    if (toastList.isEmpty) {
      return const SizedBox(
        width: 0,
        height: 0,
      );
    }

    return Stack(
      children: toastList
          .map(
            (options) => ToastModal(
              options: options,
            ),
          )
          .toList(),
    );
  }
}
