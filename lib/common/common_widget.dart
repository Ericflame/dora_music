import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget faultDeclarationInfoWidget(
    {String? title,
      Color? titleColor,
      double? fontSize,
      double? height,
      double? padding,
      String? content,
      Color? contentColor,
      String? icon,
      String? des,
      TextEditingController? controller,
      bool isReset = false,
      bool isPhone = false,
      bool isRequired = false,
      TextAlign textAlign = TextAlign.start,
      int? inputNum,
      bool isHideLine = false,
      // TextInputFormatter? inputFormatter,
      FocusNode? focusScopeNode,
      double titleWith = 80,
      int maxLength = 1,
      VoidCallback? callback}) {
  return Container(
    // height: height ?? 44,
    // color: Colors.white,
    padding: EdgeInsets.fromLTRB(padding ?? 5, 10, padding ?? 5, 0),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "* ",
              style: TextStyle(
                fontSize: 12,
                color: isRequired ? Colors.red : Colors.transparent,
              ),
            ),
            Container(
                width: 200,
                padding: EdgeInsets.only(left: 0),
                child: Text(
                  title ?? '',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: fontSize ?? 12,
                    color: titleColor ?? Color(0xFF333333),
                  ),
                )),
            Spacer(),
            Container(
                child: isReset
                    ? TextField(
                  focusNode: focusScopeNode,
                  controller: controller,
                  textInputAction: TextInputAction.done,
                  keyboardType: isPhone ? TextInputType.phone : TextInputType.emailAddress,
                  keyboardAppearance: Brightness.light,
                  inputFormatters: [
                    // CustomizedLengthTextInputFormatter(inputNum ?? 20),
                    // if (inputFormatter != null) inputFormatter,
                    // if (inputFormatter==null)CommonUtil.textInputFormatter()
                  ],
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                  ),
                  textAlign: TextAlign.start,
                  maxLines: maxLength,
                  enabled: true,
                )
                    : Text(
                  content ?? '',
                  textAlign: textAlign,
                  style: TextStyle(fontSize: fontSize ?? 14, color: contentColor ?? Colors.black54),
                )),
            SizedBox(
              width: 10,
            ),
            icon != null
                ? InkWell(
                onTap: () {
                  callback!();
                },
                child: Row(
                  children: [
                    Container(
                      height: double.infinity,
                      width: 30,
                      child: Center(
                        child: Image.asset(
                          icon,
                          width: 14,
                          height: 14,
                        ),
                      ),
                    ),
                    Text(
                      des ?? '',
                      style: TextStyle(fontSize: 10, color: Color(0xFF5385F1)),
                    )
                  ],
                ))
                : Container(),
          ],
        ),
        isHideLine
            ? Container()
            : Container(
          margin: EdgeInsets.only(top: 10),
          color: Color(0xFFDDDDDD),
          height: 0.5,
        )
      ],
    ),
  );
}