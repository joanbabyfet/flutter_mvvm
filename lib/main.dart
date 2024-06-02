import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'route/route.dart';

//入口文件
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: router, //路由配置
        // 添加本地化支持
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        title: "Movies",
        debugShowCheckedModeBanner: false, //去除调试时右上角Debug标签
        // home: ChangeNotifierProvider( //监听模式对象的变化, 当数据改变它会重建Consumer, 更新UI
        //   create: (context) => MovieListViewModel(), //所要共享的对象数据
        //   child: MovieListView(), //视频列表页
        // )
    );
  }
}