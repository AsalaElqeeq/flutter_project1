import 'package:flutter/material.dart';
import 'dart:developer';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  List<String> commentList = [];
  String content = '';
  bool isFavourite = false;
  isLiked() {
    isFavourite = !isFavourite;
  }

  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(children: [
            Image.network(
              'https://media.istockphoto.com/id/1437813144/photo/black-woman-with-smartphone-on-a-sofa-for-networking-online-mobile-app-or-relax-chat-with.jpg?s=1024x1024&w=is&k=20&c=NjgflI1iXZ_HLoFi3TxWWtifjifq7KsJZXNO8kGQr8Y=',
              height: 300,
              width: 500,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(children: [
              IconButton(
                  onPressed: () {
                    isLiked();
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.favorite,
                    size: 35,
                    color: isFavourite ? Colors.red : Colors.grey,
                  )),
              const SizedBox(
                width: 10,
              ),
              Image.asset('assets/icons/chat.png'),
              const SizedBox(
                width: 10,
              ),
              Text(
                '${commentList.length} comments',
                style: const TextStyle(fontSize: 20),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              width: 500,
              child: ListView.builder(
                  itemCount: commentList.length,
                  itemBuilder: (c, i) {
                    return Text(commentList[i]);
                  }),
            ),
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.send,
                      size: 35,
                    ),
                    onPressed: () {
                      commentList.add(textEditingController.text);
                      textEditingController.clear();
                      setState(() {});
                    },
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ]),
        ));
  }
}
