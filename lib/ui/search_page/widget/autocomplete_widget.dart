import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced/generated/assets.dart';
import 'package:get/get.dart';
import '../../../bean/search_suggest_list.dart';
import '../../../utils/eventbus/event_bus_handler.dart';

class BuildAutoComplete extends StatefulWidget {
  Function? clearText;
  Function? getData;
  Function? onSelected;
  String? hintText;
  Color? color;
  int? maxLength;
  Color? searchButtonColor;
  Function? clickCallBack;
  BuildAutoComplete(
      {this.clearText,
      this.getData,
      this.onSelected,
      this.color,
      this.hintText,
      this.maxLength,
      this.searchButtonColor,
      this.clickCallBack});

  @override
  State<BuildAutoComplete> createState() => _BuildAutoCompleteState();
}

class _BuildAutoCompleteState extends State<BuildAutoComplete> {
  TextEditingController inputController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  StreamSubscription? streamSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streamSubscription = EventBusHandler.listen((event) {
      if (event.code == "MODIFY_SEARCH") {
        print("刷新搜索内容");
        inputController.text = event.data??"";
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return buildAutoComplete();
  }

  ///模糊查询自动填充
  Widget buildAutoComplete() {
    return Autocomplete<SearchSuggestList>(
      optionsBuilder: buildOptions,
      onSelected: onSelected,
      optionsViewBuilder: _buildOptionsView,
      fieldViewBuilder: _buildFieldView,
      displayStringForOption: (user) => user.keyword ?? "",
    );
  }

  ///搜索框
  Widget _buildFieldView(BuildContext context, TextEditingController textEditingController, FocusNode focusNode,
      VoidCallback onFieldSubmitted) {
    inputController = textEditingController;
    _focusNode = focusNode;
    return Row(
      children: [
        Expanded(
            child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          constraints: BoxConstraints(
            maxHeight: 36,
            minHeight: 36,
          ),
          decoration: BoxDecoration(
            color: widget.color ?? Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
            style: TextStyle(fontSize: 15, color: Colors.black54),
            maxLength: widget.maxLength ?? 20,
            focusNode: _focusNode,
            keyboardType: TextInputType.text,
            controller: inputController,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: 13),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide.none),
              filled: true,
              fillColor: Colors.white,
              hintText: widget.hintText ?? "请输入关键字",
              // isCollapsed: true,
              contentPadding: EdgeInsets.only(top: 0, bottom: 0),
              prefixIcon: Icon(
                Icons.search,
                size: 20,
              ),
              counterText: "",
              suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.clearText!();
                      inputController.text = "";
                    });
                  },
                  child: Icon(Icons.cancel, size: 15, color: Colors.grey)),
            ),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[^\s]*$'))],
            onFieldSubmitted: (String value) {
              if (inputController.text.isNotEmpty) {
                _focusNode.unfocus();
                widget.onSelected!(null);
              }

              // logic.currentPage = 1;
              // logic.getListData();
            },
          ),
        )),
        searchButton()
      ],
    );
  }

  ///数据列表
  Future<Iterable<SearchSuggestList>> buildOptions(TextEditingValue textEditingValue) async {
    if (textEditingValue.text == '') {
      return const Iterable<SearchSuggestList>.empty();
    }
    return widget.getData!(inputController.text);
  }

  ///选择后的回调
  onSelected(SearchSuggestList options) {
    widget.onSelected!(options);
    _focusNode.unfocus(); //输入框失去焦点，收起键盘
    print('选择结束:${options}');
  }

  ///填充内容
  Widget _buildOptionsView(
      BuildContext context, AutocompleteOnSelected<SearchSuggestList> onSelected, Iterable<SearchSuggestList> options) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: 330,
        decoration: BoxDecoration(
          color: Colors.white,
          //设置四周圆角 角度
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          //设置四周边框
          border: new Border.all(width: 1, color: Colors.white),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 90.0),
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10, right: 10),
            itemBuilder: (_, index) {
              final SearchSuggestList option = options.elementAt(index);
              return InkWell(
                onTap: () => onSelected.call(option),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Image.asset(Assets.imagesIconMusic1, width: 15, height: 15),
                          ),
                          Text.rich(
                            formSpan(option.keyword ?? "", inputController.text),
                            style: TextStyle(fontSize: 13, color: Colors.black87),
                          )
                        ],
                      ),
                      Divider(
                        height: 1,
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: options.length,
          ),
        ),
      ),
    );
  }

  ///高亮某些文字
  final TextStyle lightTextStyle = const TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  );

  InlineSpan formSpan(String src, String pattern) {
    List<TextSpan> span = [];
    List<String> parts = src.split(pattern);
    if (parts.length > 1) {
      for (int i = 0; i < parts.length; i++) {
        span.add(TextSpan(text: parts[i]));
        if (i != parts.length - 1) {
          span.add(TextSpan(text: pattern, style: lightTextStyle));
        }
      }
    } else {
      span.add(TextSpan(text: src));
    }
    return TextSpan(children: span);
  }

  ///搜索按钮
  Widget searchButton() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            if (inputController.text.isNotEmpty) {
              _focusNode.unfocus();
              widget.clickCallBack!(inputController.text);
            }
          });
        },
        child: Image.asset(
          Assets.imagesIcSearch,
          color: widget.searchButtonColor,
        ),
      ),
    );
  }
}
