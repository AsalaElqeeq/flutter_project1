import 'package:flutter/material.dart';
import 'package:flutter_application_1/resturant/mealData.dart';
import 'package:flutter_application_1/resturant/mealModel.dart';
import 'package:flutter_application_1/resturant/mealWidget.dart';

class Resturant extends StatelessWidget {
  // fun 1: convert maps to models
  List<MealModel> mealmodelsConverter() {
    return mealsData.map((e) => MealModel.fromJson(e)).toList();
  }

//fun 2: convert models to widgets
  List<Widget> mealwidgetConverter() {
    List<MealModel> mealmodels = mealmodelsConverter();
    return mealmodels.map((e) => MealWidget(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Resturant app'),
        ),
        body: ListView.builder(
            itemCount: mealsData.length,
            itemBuilder: (BuildContext context, int index) {
              return mealwidgetConverter()[index];
            }));
  }
}
