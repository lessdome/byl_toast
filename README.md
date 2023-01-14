# 不适用任何原生方法来调用的弹窗

# 默认加了 toast

# 您可以基于 show 方法, 传入自定义显示组件, 默认展示区是居中的

# 需要将 BylToast.init 插入到 MaterialApp 中的 builder 处

# 示例代码

# class MyApp extends StatelessWidget {

# const MyApp({Key? key}) : super(key: key);

# @override

# Widget build(BuildContext context) {

# return MaterialApp(

# theme: HibitTheme.theme,

# initialRoute: initialRoute,

# routes: routes,

# onGenerateRoute: onGenerateRoute,

# builder: Toast.init,

# );

# }

#}
