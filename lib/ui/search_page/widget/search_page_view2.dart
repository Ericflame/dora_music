import 'package:flutter/material.dart';
import 'package:dora_music/ui/search_page/search_page_state.dart';
import 'package:dora_music/ui/search_page/widget/autocomplete_widget.dart';
import 'package:get/get.dart';

import '../../../bean/hot_search.dart';
import '../../../generated/assets.dart';
import '../search_page_logic.dart';

class SearchPagePage extends StatefulWidget {
  @override
  State<SearchPagePage> createState() => _SearchPagePageState();
}

class _SearchPagePageState extends State<SearchPagePage> {
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
        return Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        Assets.imagesIconSearchBg,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 120,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 5, right: 5),
                                child: Image.asset(
                                  Assets.imagesIconBack,
                                  width: 25,
                                  height: 25,
                                  color: Color(0xff4caee3),
                                ),
                              ),
                            ),
                          ),
                          // Expanded(child: BuildAutoComplete()),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: TextButton(
                              onPressed: () {},
                              child: Container(
                                margin: EdgeInsets.only(left: 5, right: 5),
                                child: Image.asset(
                                  Assets.imagesIcSearch,
                                  width: 25,
                                  height: 25,
                                  color: Color(0xff4caee3),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: 140),
                // height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 20, top: 15, bottom: 20),
                        child: Text(
                          "热搜榜",
                          style: TextStyle(fontSize: 14, color: Color(0xff4caee3), fontWeight: FontWeight.bold),
                        )),
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
                ))
          ],
        );
      }),
    );
  }
}
