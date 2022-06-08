import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class searchView extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2,bottom: 2),
      height: 40,
      child: Row(
        children: [
          Image.asset(
            "assets/images/logo.png",
            width: 30,
            height: 30,
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
              child: TextField(
            style: TextStyle(fontSize: 13),
            textInputAction: TextInputAction.search,
            controller: searchController,
            autofocus: false,
            decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 13),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)), borderSide: BorderSide.none),
                filled: true,
                fillColor: Color(0xFFe6f4fd),
                hintText: "请输入关键字",
                // isCollapsed: true,
                contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                prefixIcon: Icon(
                  Icons.search,
                  size: 20,
                )),
            onSubmitted: (value) {},
          )),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            child: Image.asset(
              "assets/images/搜索.png",
              width: 30,
              height: 30,
            ),
          )
        ],
      ),
    );
  }
}
