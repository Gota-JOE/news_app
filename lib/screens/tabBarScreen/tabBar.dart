import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:news_app/data.dart';
import 'package:news_app/model/NewsModel.dart';
import 'package:news_app/screens/tabBarScreen/tabBarController.dart';

class NewsTabBar extends StatelessWidget {
  final NewsController _newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          toolbarHeight: 90,
          title: Text('Exact News', textDirection: TextDirection.values.first),
          bottom: TabBar(
            //indicatorColor: Colors.indigo,
              dividerColor: Colors.indigoAccent,
              isScrollable: true,
              tabs: tabs.map((category) {
                return Container(
                  width: 100,
                  //height: ,
              child: Tab(
                text: category,
              ));
            }).toList()
          ),
        ),
        body: TabBarView(
          children: tabs.map((category) {
            return GetBuilder<NewsController>(
              init: _newsController,
              builder: (controller) {
                final  tabs= controller.getNewsByCategory(category); ///categoryNews

                if (tabs!.isEmpty) {
                  controller.fetchNewsData(category);
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: tabs.length,
                    itemBuilder: (context, i) {
                      final article = NewsModel();  ///NewsModel categoryNews
                      return ListTile(
                        title: Text('${article[i]['title']}'), ///Text(article!.title!)
                        subtitle: Text(article!.description!),
                        ///leading: Image.network(article!.urlToImage),
                      );
                    },
                  );
                }
              },
            );
          }).toList()
        ),
      ),
    );
  }
}