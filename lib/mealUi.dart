import 'package:flutter/material.dart';

class RestApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RestAppState();
  }
}

class RestAppState extends State<RestApp> {
  double initPrice = 21.00;
  double total = 21.00;
  int quantity = 1;
  int isSelectedRadio = 0;
  bool isSelected = false;
  List<int> checkedbox = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGl6emF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
                height: 200,
                width: 500,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'بيتزا بالخضار',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'بيتزا بالخضار مميزة',
                style: TextStyle(
                    color: Color(0xFF9E9E9E),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Row(
                    children: [
                      Text(
                        '$initPrice د.أ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.blue,
                                size: 15,
                              ),
                              onPressed: () {
                                if (quantity != 1) {
                                  total = total - initPrice;
                                  quantity = quantity - 1;
                                }
                                setState(() {});
                              },
                            ),
                            Text(
                              '$quantity',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              onPressed: () {
                                if (quantity != 10) {
                                  quantity = quantity + 1;
                                  total = total + initPrice;
                                }

                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.add,
                                size: 15,
                              ),
                              color: Colors.blue,
                              iconSize: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 8,
              ),
              const Divider(
                thickness: 6,
                color: Color.fromARGB(255, 194, 192, 192),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'اختيارك من الحجم:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '(اختياري)',
                    style: TextStyle(
                        color: Color.fromARGB(255, 94, 93, 93),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'اختر من القائمة',
                style: TextStyle(
                    color: Color.fromARGB(255, 66, 65, 65),
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (c, i) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'صنف ${i + 1}',
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 66, 65, 65),
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  Visibility(
                                    visible: i != 0,
                                    child: const Text(
                                      ('(+9.00 د.أ )'),
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF9E9E9E),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Radio(
                                    value: i,
                                    groupValue: isSelectedRadio,
                                    onChanged: (value) {
                                      if (i != 0 && isSelected == false) {
                                        total = total + 9.00;
                                        isSelected = true;
                                      } else if (i == 0) {
                                        isSelected = false;
                                        total = total - 9.00;
                                      }
                                      isSelectedRadio = i;

                                      setState(() {});
                                    },
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: i != 2,
                                child: const Divider(
                                  thickness: 3,
                                  color: Color.fromARGB(255, 194, 192, 192),
                                ),
                              ),
                            ],
                          );
                        }),
                  ],
                ),
              ),
              const Divider(
                thickness: 6,
                color: Color.fromARGB(255, 194, 192, 192),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'اختيارك من الإضافات:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '(اختياري)',
                    style: TextStyle(
                        color: Color.fromARGB(255, 94, 93, 93),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'اختر من القائمة',
                style: TextStyle(
                    color: Color.fromARGB(255, 66, 65, 65),
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (c, i) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'صنف ${i + 1}',
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 66, 65, 65),
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  Visibility(
                                    visible: i != 0,
                                    child: const Text(
                                      ('(+9.00 د.أ )'),
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF9E9E9E),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Checkbox(
                                    value: checkedbox.contains(i),
                                    onChanged: (value) {
                                      if (checkedbox.contains(i)) {
                                        checkedbox.remove(i);
                                        if (i != 0) {
                                          total = total - 9.0;
                                        }
                                      } else {
                                        checkedbox.add(i);
                                        if (i != 0) {
                                          total = total + 9.0;
                                        }
                                      }
                                      setState(() {});
                                    },
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: i != 2,
                                child: const Divider(
                                  thickness: 3,
                                  color: Color.fromARGB(255, 194, 192, 192),
                                ),
                              ),
                            ],
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: ElevatedButton(
            clipBehavior: Clip.antiAlias,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 100, 192, 235),
              fixedSize: const Size(0, 50),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  ('$total د.أ '),
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                const Text(
                  'إضافة للسلة',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
