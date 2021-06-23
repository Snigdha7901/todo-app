import 'package:get_it/get_it.dart';
import 'package:todoo/source/services.dart';
import 'package:todoo/source/task_data.dart';

GetIt locator=GetIt.instance;
void setupLocator(){
  locator.registerLazySingleton(() => TaskData());
  locator.registerLazySingleton(() => TaskServices());
}