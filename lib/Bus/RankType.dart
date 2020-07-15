import 'package:event_bus/event_bus.dart';

// Bus初始化
EventBus eventBus = EventBus();

class RankType{
  String type;

	// 全局事件
  RankType(String str){
    this.type = str;
  }
}
