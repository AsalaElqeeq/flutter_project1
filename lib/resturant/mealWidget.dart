import 'package:flutter/material.dart';
import 'package:flutter_application_1/resturant/mealModel.dart';

class MealWidget extends StatelessWidget {
  MealModel mealModel;
  MealWidget(this.mealModel);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Image.network(mealModel.imageUrl ?? ''),
          Text(mealModel.name ?? ''),
          Text(mealModel.price ?? ''),
          ...mealModel.contents?.map((e) => Text(e.name ?? '')).toList() ?? []
        ],
      ),
    );
  }
}
