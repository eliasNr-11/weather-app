import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/models/weather_api.dart';
import 'package:weather_app/models/weather_model.dart';

class SearchController extends GetxController {
  int selectedCity = 0;
  bool isMetric = true; //imperial or metric

  bool isLoading = false;
  bool isError = false;

  WeatherModel? result;
  List<ListElement> todaysTemp = [];
  List<ListElement> weekDaysTemp = [];

  int currentColorIndex = 0;

  void changeColorIndex(int ind) {
    currentColorIndex = ind;

    update();
  }

  void changeCity(int index) {
    selectedCity = index;

    update();
  }

  void changeUnit() {
    isMetric = !isMetric;

    update();
  }

  void changeError(){
    isError = false;

    update();
  }

  void fetchWeather() async {
    try {
      isLoading = true;
      var resp = await WeatherApi.fetchWeather(
        '9a90b19e563405581c55e751e9ffe59b',
        isMetric ? 'metric' : 'imperial',
        locations[selectedCity].city,
      );
      result = WeatherModel.fromJson(resp);

      todaysTemp.clear();
      weekDaysTemp.clear();

      isError = false;

      var temp;

      for (var dt in result!.list!) {
        if (DateUtils.isSameDay(DateTime.now(), dt!.dtTxt!)) {
          todaysTemp.add(dt);
        }

        if (temp == null || !DateUtils.isSameDay(temp, dt.dtTxt!)) {
          temp = dt.dtTxt;
          weekDaysTemp.add(dt);
        }
      }

      var icn = result?.list?[0]?.weather?[0]?.icon;

      if (icn == '01n' || icn == '01d') {
        changeColorIndex(0);
      }

      if (icn == '02n' ||
          icn == '03n' ||
          icn == '04n' ||
          icn == '02d' ||
          icn == '03d' ||
          icn == '04d') {
        changeColorIndex(1);
      }

      if (icn == '09n' ||
          icn == '10n' ||
          icn == '09d' ||
          icn == '10d' ||
          icn == '11n' ||
          icn == '11d' ||
          icn == '13n' ||
          icn == '13d' ||
          icn == '50n' ||
          icn == '50d') {
        changeColorIndex(2);
      }
    } catch (e) {
      isError = true;
      print(e);
    } finally {
      isLoading = false;
    }

    update();
  }

  IconData weatherIcon(String icn) {
    IconData icnRet = Icons.error;
    if (icn == '01n' || icn == '01d') {
      icnRet = Icons.sunny;
    }

    if (icn == '02n' ||
        icn == '03n' ||
        icn == '04n' ||
        icn == '02d' ||
        icn == '03d' ||
        icn == '04d') {
      icnRet = Icons.cloud;
    }

    if (icn == '09n' || icn == '10n' || icn == '09d' || icn == '10d') {
      icnRet = Icons.cloudy_snowing;
    }

    if (icn == '11n' || icn == '11d') {
      icnRet = Icons.thunderstorm;
    }

    if (icn == '13n' || icn == '13d') {
      icnRet = Icons.ac_unit;
    }

    if (icn == '50n' || icn == '50d') {
      icnRet = Icons.foggy;
    }

    return icnRet;
  }
}
