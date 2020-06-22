import 'package:event_bus/event_bus.dart';

// Bus初始化
EventBus eventBus = EventBus();

class ModifyUi{
  int str;

	// 全局事件
  ModifyUi(int str){
    this.str = str;
  }
}
