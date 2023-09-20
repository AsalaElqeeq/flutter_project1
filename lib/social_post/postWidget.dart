import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/social_post/postModel.dart';

class PostWidget extends StatefulWidget {
  PostModel postmodel;
  PostWidget(this.postmodel);

  @override
  State<StatefulWidget> createState() {
    return PostWidgetState();
  }
}

//this clas which extend from state is *****private
class PostWidgetState extends State<PostWidget> {
  isLiked() {
    widget.postmodel.isLiked = !(widget.postmodel.isLiked ?? false);
    setState(() {}); //rebuild the new widget
  }

  TextEditingController textEditingController = TextEditingController();
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {
        isLiked();
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey)),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      widget.postmodel.user?.img ?? '',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    //we use the key words""widget"to access var in in the postwidget
                    widget.postmodel.user?.name ?? '',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const Spacer(),
                  const Icon(Icons.more_horiz)
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.network(
              widget.postmodel.img ?? '',
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (x, y, z) {
                return const Center(child: Icon(Icons.image));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          isLiked();
                          log('clicker !');
                          setState(() {}); //need the developer library
                        },
                        child: Icon(
                          Icons.favorite,
                          color: ((widget.postmodel.isLiked) ?? false) == true
                              ? Colors.red
                              : Colors.grey,
                          size: 32,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset('assets/icons/chat.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        (widget.postmodel.comment.length).toString() +
                            ' comments',
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset('assets/icons/share.png'),
                      const Spacer(),
                      Image.asset('assets/icons/save.png'),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.postmodel.content ?? '',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  // SizedBox(
                  //     height: 150,
                  //     width: 500,
                  //     child: ListView.builder(
                  //         itemCount: widget.postmodel.comment.length,
                  //         itemBuilder: (c, i) {
                  //           return Text(widget.postmodel.comment[i]);
                  //         })),
                  ...widget.postmodel.comment.map((e) => Text(e)).toList(),
                  const SizedBox(
                    height: 50,
                  ),

                  TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                        suffix: IconButton(
                          icon: const Icon(
                            Icons.send,
                            size: 35,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            widget.postmodel.comment
                                .add(textEditingController.text);
                            textEditingController.clear();

                            setState(() {});
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
