import 'package:flutter/material.dart';


enum HomeItemType {
  approval, //业务审批
  report, //数据报表
  work, //工作交流
  board, //数据看板
  feedback, //问题反馈
  announce, //公告公示
}

extension HomeItemTypeExtension on HomeItemType {

  String get name => describeEnum(this);

  String get displayTitle {
    switch (this) {
      case HomeItemType.approval:
        return '业务审批';
      case HomeItemType.report:
        return '数据报表';
      case HomeItemType.work:
        return '工作交流';
      case HomeItemType.board:
        return '数据看板';
      case HomeItemType.feedback:
        return '问题反馈';
      case HomeItemType.announce:
        return '公告公示';
      default:
        return 'Title is null';
    }
  }

  String get displayImage {
    switch (this) {
      case HomeItemType.approval:
        return 'assets/images/home_approval.png';
      case HomeItemType.report:
        return 'assets/images/home_report.png';
      case HomeItemType.work:
        return 'assets/images/home_work.png';
      case HomeItemType.board:
        return 'assets/images/home_board.png';
      case HomeItemType.feedback:
        return 'assets/images/home_feedback.png';
      case HomeItemType.announce:
        return 'assets/images/home_announce.png';
      default:
        return 'image is null';
    }
  }

  String describeEnum(Object enumEntry) {
    final String description = enumEntry.toString();
    final int indexOfDot = description.indexOf('.');
    assert(indexOfDot != -1 && indexOfDot < description.length - 1);
    return description.substring(indexOfDot + 1);
  }
}
