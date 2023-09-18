import 'package:flutter/material.dart';
import 'package:flutter_application_1/social_post/data.dart';
import 'package:flutter_application_1/social_post/postModel.dart';
import 'package:flutter_application_1/social_post/postWidget.dart';

class Instagram extends StatelessWidget {
  //convert maps to models
  List<PostModel> postModelConverter() {
    return postData.map((e) => PostModel.fromJson(e)).toList();
  }

  //convert models to widgets
  List<PostWidget> postWidgetConverter() {
    List<PostModel> postmodel = postModelConverter();
    return postmodel.map((e) => PostWidget(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Instagram',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: postData.length,
        itemBuilder: (BuildContext c, int i) {
          return postWidgetConverter()[i];
        },
      ),
    );
  }
}
