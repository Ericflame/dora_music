import 'package:appbar_animated/appbar_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/bean/common_response.dart';
import 'package:flutter_advanced/ui/search_page/search_page_state.dart';
import 'package:flutter_advanced/ui/search_page/widget/autocomplete_widget.dart';
import 'package:flutter_advanced/ui/search_page/widget/common_custom.dart';
import 'package:get/get.dart';

import '../../bean/hot_search.dart';
import '../../generated/assets.dart';
import 'search_page_logic.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final logic = Get.put(SearchPageLogic());
  SearchState state = SearchState();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    state = logic.state;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return ScaffoldLayoutBuilder(
          backgroundColorAppBar: const ColorBuilder(Colors.transparent, Color(0xff9ad2fd)),
          textColorAppBar: const ColorBuilder(Color(0xff4caee3), Colors.white),
          appBarBuilder: _appBar,
          child: SingleChildScrollView(
              child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      Assets.imagesIconSearchBg,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.25,
                    ),
                    height: 618,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 22, top: 30),
                            child: Row(
                              children: [
                                Image.asset(Assets.imagesIconHot, color: Color(0xff4caee3), width: 20, height: 20),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "热搜榜",
                                  style: TextStyle(fontSize: 15, color: Colors.black54, fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                        Divider(height: 20),
                        Expanded(
                            child: state.hotSearchDetail.isEmpty
                                ? Container()
                                : SingleChildScrollView(
                                    child: GridView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.symmetric(horizontal: 16),
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            //横轴元素个数
                                            crossAxisCount: 2,
                                            //纵轴间距
                                            mainAxisSpacing: 10,
                                            //横轴间距
                                            crossAxisSpacing: 30.0,
                                            //子组件宽高长度比例
                                            childAspectRatio: 4.0),
                                        itemCount: 20,
                                        itemBuilder: (BuildContext context, int index) {
                                          HotSearch item = state.hotSearchDetail[index];
                                          return Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 25,
                                                  child: Text(
                                                    "${index + 1}",
                                                    style: TextStyle(color: index < 3 ? Colors.red : Colors.grey),
                                                  ),
                                                ),
                                                Expanded(
                                                    child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${item.searchWord ?? ""}",
                                                      style: TextStyle(fontSize: 15, color: Colors.black),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                    SizedBox(height: 2),
                                                    Text(
                                                      "${item.content ?? ""}",
                                                      style: TextStyle(fontSize: 11, color: Colors.grey),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ))
                                              ],
                                            ),
                                          );
                                        }),
                                  )),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
        );
      }),
    );
  }

  Widget _appBar(BuildContext context, ColorAnimated colorAnimated) {
    return Container(
      color: colorAnimated.background,
      padding: EdgeInsets.only(top: 30),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Image.asset(
                  Assets.imagesIconBack,
                  color: colorAnimated.color,
                )),
          ),
          Expanded(
              child: BuildAutoComplete(
            clearText: () {
              /// 清除内容
            },
            onSelected: (e) {
              /// 选中后的回调
            },
            getData: (e) {
              /// 获取填充列表的回调,返回一个列表
              logic.getSearchSuggest(e);
              return state.searchSuggestList;
            },
          )),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: TextButton(
              onPressed: () {},
              child: Image.asset(
                Assets.imagesIcSearch,
                color: colorAnimated.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
