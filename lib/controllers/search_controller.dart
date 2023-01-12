import 'package:get/get.dart';

class SearchController extends GetxController{
  int selectedCity = 0;
  bool isMetric = true;//imperial or metric

  void changeCity(int index){
    selectedCity = index;

    update();
  }

  void changeUnit(){
    isMetric = !isMetric;

    update();
  }
}