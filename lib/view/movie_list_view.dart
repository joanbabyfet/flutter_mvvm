import 'package:flutter/material.dart';
import 'package:flutter_mvvm/view_model/movie_list_view_model.dart';
import 'package:flutter_mvvm/widgets/movie_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//视频列表页面
class MovieListView extends StatefulWidget {
  const MovieListView({super.key});

  //创建StatefulWidget后调用的第1个抽象方法
  @override
  _MovieListViewState createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  final TextEditingController _controller = TextEditingController();

  //状态初始化, 创建Widget组件时的第1个方法, 执行一些初始化操作, 对应安卓的onCreate方法/ios的viewDidLoad方法
  @override
  void initState() {
    super.initState();
    //一进到页面就取数据
    //Provider.of<MovieListViewModel>(context, listen: false).getMovies("batman");
  }

  //页面每次渲染都会调用该方法
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MovieListViewModel>(context);

    return Scaffold(
        appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.movies)
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) { //点击搜索
                    if(value.isNotEmpty) {
                      vm.getMovies(value); //获取视频列表
                      _controller.clear(); //清空搜索文字
                    }
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.search,
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none
                  ),
                ),
              ),
              Expanded(
                  child: MovieList(movies: vm.movies))
            ])
        )
    );
  }
}