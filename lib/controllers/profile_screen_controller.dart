import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProfileScreenController extends GetxController{

  RxInt listColorChange=0.obs;

  void changeListItemColor(int index){
    listColorChange.value=index;

}







}