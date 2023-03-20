import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common_custom.dart';

class BuildAutoComplete extends StatefulWidget {
  Function ? clearText;
  Function ? getData;
  Function ? onSelected;
  String ? hintText;
  Color ? color;
  int ? maxLength;
  BuildAutoComplete({this.clearText,this.getData,this.onSelected,this.color,this.hintText,this.maxLength});

  @override
  State<BuildAutoComplete> createState() => _BuildAutoCompleteState();
}

class _BuildAutoCompleteState extends State<BuildAutoComplete> {
  TextEditingController inputController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildAutoComplete();
  }

  ///模糊查询自动填充
  Widget buildAutoComplete() {
    return Autocomplete<CommonCustom>(
      optionsBuilder: buildOptions,
      onSelected: onSelected,
      optionsViewBuilder: _buildOptionsView,
      fieldViewBuilder: _buildFieldView,
      displayStringForOption: (user) => user.customerName ?? "",
    );
  }

  ///搜索框
  Widget _buildFieldView(BuildContext context, TextEditingController textEditingController, FocusNode focusNode,
      VoidCallback onFieldSubmitted) {
    inputController = textEditingController;
    _focusNode = focusNode;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      constraints: BoxConstraints(
        maxHeight: 36,
        minHeight: 36,
      ),
      decoration: BoxDecoration(
        color: widget.color??Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextFormField(
        style: TextStyle(fontSize: 13),
        maxLength: widget.maxLength??20,
        focusNode: focusNode,
        keyboardType: TextInputType.text,
        controller: inputController,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 13),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide.none),
          filled: true,
          fillColor: Colors.white,
          hintText: widget.hintText??"请输入关键字",
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
                  // logic.customerId.value = "";
                  inputController.text = "";
                });
              },
              child: Icon(Icons.cancel, size: 15, color: Colors.grey)),
        ),
        onFieldSubmitted: (String value) {
          _focusNode.unfocus();
          widget.onSelected!(null);
          // logic.currentPage = 1;
          // logic.getListData();
        },
      ),
    );
  }

  ///数据列表
  Future<Iterable<CommonCustom>> buildOptions(TextEditingValue textEditingValue) async {
    if (textEditingValue.text == '') {
      return const Iterable<CommonCustom>.empty();
    }
    widget.getData!(inputController.text);
    return widget.getData!(inputController.text);
  }

  ///选择后的回调
  onSelected(CommonCustom options) {
    widget.onSelected!(options);
    _focusNode.unfocus(); //输入框失去焦点，收起键盘
    print('选择结束:${options}');
  }

  ///填充内容
  Widget _buildOptionsView(
      BuildContext context, AutocompleteOnSelected<CommonCustom> onSelected, Iterable<CommonCustom> options) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
        child: Material(
          child: Container(
            decoration: BoxDecoration(
              //设置四周圆角 角度
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //设置四周边框
              border: new Border.all(width: 1, color: Colors.white),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 100.0),
              child: ListView.builder(
                padding: EdgeInsets.only(left: 20, right: 20),
                itemBuilder: (_, index) {
                  final CommonCustom option = options.elementAt(index);
                  return InkWell(
                    onTap: () => onSelected.call(option),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [Text.rich(formSpan(option.customerName ?? "",inputController.text))],
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
}
