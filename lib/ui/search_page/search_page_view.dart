import 'package:flutter/material.dart';
import 'package:flutter_advanced/ui/search_page/search_page_state.dart';
import 'package:flutter_advanced/ui/search_page/widget/autocomplete_widget.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';
import 'search_page_logic.dart';

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
      body: Stack(
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
                            child: Padding(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Image.asset(
                                Assets.imagesIconBack,
                                width: 30,
                                height: 30,
                                color: Color(0xff4daee3),
                              ),
                            ),
                          ),
                        ),
                        Expanded(child: BuildAutoComplete())
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Positioned(
              top: 140,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                ),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 20, top: 15),
                        child: Text(
                          "热搜榜",
                          style: TextStyle(fontSize: 14, color: Color(0xff4caee3), fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
