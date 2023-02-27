import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/common_widget.dart';
import 'add_media_logic.dart';
import 'enum_test.dart';

class Add_mediaPage extends StatefulWidget {

  @override
  _Add_mediaPageState createState() => _Add_mediaPageState();
}

class _Add_mediaPageState extends State<Add_mediaPage> {
  final logic = Get.put(Add_mediaLogic());
  HomeItemType test = HomeItemType.approval;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switch(test){
      case HomeItemType.approval:
        print('春天');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
            onPressed: () {
              // Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        // centerTitle: true,
        elevation: 0.5,
        toolbarHeight: 45,
        title: Text("客户详情", style: TextStyle(fontSize: 14)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CompanyWidget(context),
              Container(height: 5,),
              Row(
                children: [
                  Container(width: 5,),
                  Text("基本信息"),
                  Spacer(),
                  Container(
                    width: 80,
                    child: MaterialButton(
                      height: 25,
                      color: Color(0xff169bd5),
                      elevation: 3,
                      textColor: Colors.white,
                      onPressed: () {},
                      child: Text(
                        "编辑",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              Container(height: 5,),
              infoWidget(context)
            ],
          ),
        ),
      )
    );
  }
  Widget CompanyWidget(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 10, left: 5, right: 10),
        decoration: BoxDecoration(
          color: Color(0xfff2f2f2),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/icon_user.png",
                      width: 30,
                      height: 30,
                    ),
                    Container(
                      width: 5,
                    ),
                    Text(
                      "成都天投地产开发有限公司",
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 35,
                    ),
                    Text("客户类别", style: TextStyle(fontSize: 12)),
                    Container(
                      width: 10,
                    ),
                    Text("配电运维类", style: TextStyle(fontSize: 12)),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 35,
                    ),
                    Text("企业产号", style: TextStyle(fontSize: 12)),
                    Container(
                      width: 10,
                    ),
                    Text("8885445555", style: TextStyle(fontSize: 12)),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 35,
                    ),
                    Text("联系人", style: TextStyle(fontSize: 12)),
                    Container(
                      width: 20,
                    ),
                    Text("王某", style: TextStyle(fontSize: 12)),
                    Container(
                      width: 10,
                    ),
                    Text("18988888888", style: TextStyle(fontSize: 12)),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 35,
                    ),
                    Text("企业地址", style: TextStyle(fontSize: 12)),
                    Container(
                      width: 10,
                    ),
                    Expanded(
                      child: Text("四川省成都市双流县兴隆镇三根松村村委会三根松社区三、五科学城创新孵化中心二期1号地块", style: TextStyle(fontSize: 11)),
                    )
                  ],
                ),
              ],
            ),
            Container(
              height: 10,
            ),

          ],
        ));
  }
  Widget infoWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          faultDeclarationInfoWidget(
            title: "*功率因数考核方式",
            content: "0.9",
          ),
          faultDeclarationInfoWidget(
            title: "*运行容量(KVA)",
            content: "500",
          ),
          faultDeclarationInfoWidget(
            title: "合同容量(KVA)",
            content: "500",
          ),
          faultDeclarationInfoWidget(
            title: "*定价策略",
            content: "单一制",
          ),
          faultDeclarationInfoWidget(
            title: "*基本电费计费方式",
            content: "容量",
          ),
          faultDeclarationInfoWidget(
            title: "客户类别",
            content: "公线专变用户",
          ),
          faultDeclarationInfoWidget(
            title: "用电类别",
            content: "大工业用电",
          ),
          faultDeclarationInfoWidget(
            title: "计费方式",
            content: "高供高计",
          ),
          faultDeclarationInfoWidget(
            title: "行业类别",
            content: "工业",
          ),
          faultDeclarationInfoWidget(
            title: "用户分类",
            content: "高压",
          ),
          faultDeclarationInfoWidget(
            title: "供电电压",
            content: "35KV",
          ),
        ],
      ),
    );
  }
}
