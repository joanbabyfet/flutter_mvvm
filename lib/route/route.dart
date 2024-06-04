import 'package:go_router/go_router.dart';
import 'package:flutter_mvvm/view/movie_list_view.dart';
import 'package:flutter_mvvm/view/splash_view.dart';
import 'package:flutter_mvvm/view_model/movie_list_view_model.dart';
import 'package:provider/provider.dart';

//声明式路由
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ChangeNotifierProvider( //监听模式对象的变化, 当数据改变它会重建Consumer, 更新UI
          create: (context) => MovieListViewModel(), //所要共享的对象数据
          child: MovieListView(), //视频列表页
      )
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) => SplashView(),
    ),
  ],
);