import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:todoo/locator.dart';
import 'package:todoo/source/task_data.dart';

List<SingleChildStatelessWidget>supplyProvider(){
  return[
    ChangeNotifierProvider(create: (_)=>locator<TaskData>()),
  ];
}