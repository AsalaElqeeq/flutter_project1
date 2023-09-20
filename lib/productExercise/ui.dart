import 'package:flutter/material.dart';
import 'package:flutter_application_1/productExercise/model.dart';

import 'data.dart';

class Categories extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CategoriesState();
  }
}

class CategoriesState extends State<Categories> {
  int selectedIndex = 100;
  List<CatgModel> category =
      categories.map((e) => CatgModel.fromJson(e)).toList();

  List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Category',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1529473814998-077b4fec6770?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 80,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (c, i) {
                  return InkWell(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(15),
                              color: i == selectedIndex
                                  ? Colors.grey
                                  : Colors.red),
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          height: 50,
                          width: 100,
                          child: Text(
                            category[i].name ?? '',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                        ),
                        Visibility(
                          visible: selectedIndex == i,
                          child: Container(
                              color: Colors.black,
                              height: 3,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: Text(
                                category[i].name ?? '',
                                style: // to make the width fit the text inside
                                    const TextStyle(color: Colors.transparent),
                              )),
                        )
                      ],
                    ),
                    onTap: () {
                      selectedIndex = i;
                      products = category[i].prod ?? [];
                      setState(() {});
                    },
                  );
                }),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemCount: products.length,
                itemBuilder: (contexts, index) {
                  return ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        products[index].img ?? '',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ));
                }),
          ),
        ],
      ),
    );
  }
}
