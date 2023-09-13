import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
          constraints: const BoxConstraints.expand(
            height: 330,
          ),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1690642716617-5fae66a8753b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80"))),
          child: const Stack(
            children: [
              Positioned(
                  left: 20,
                  top: 40,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 30,
                  )),
              Positioned(
                right: 20,
                top: 40,
                child: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          )),
      const SizedBox(
        height: 20,
      ),
      Container(
          margin: EdgeInsets.only(left: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Waterfall',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
                '''A waterfall is any point in a river or stream where water flows over a vertical drop or a series of steep drops. Waterfalls also occur where meltwater drops over the edge of a tabular iceberg or ice shelf.
      
      Waterfalls can be formed in several ways, but the most common method of formation is that a river courses over a top layer of resistant bedrock before falling on to softer rock, which erodes faster, leading to an increasingly high fall. Waterfalls have been studied for their impact on species living in and around them.'''),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Picture',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Picture(
                    'https://images.unsplash.com/photo-1516214104703-d870798883c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
                  ),
                  Picture(
                    'https://images.unsplash.com/photo-1683735967822-486215401d4f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
                  ),
                  Picture(
                    'https://images.unsplash.com/photo-1672388144534-78e131140d78?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1476&q=80',
                  ),
                  Picture(
                    'https://images.unsplash.com/photo-1692960435182-206eddb653d8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80',
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 59, 59, 59),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                        child: Text(
                      '+20',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'More In Bali >',
              style: TextStyle(
                  color: Color.fromARGB(197, 1, 78, 4),
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ]))
    ]));
  }
}

class Picture extends StatelessWidget {
  String? img;
  Picture(this.img);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      height: 65,
      width: 65,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(img ?? ''), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
