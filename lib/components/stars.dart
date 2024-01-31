import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  const Stars({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Stars :',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        const SizedBox(width: 160),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          RichText(
            text: const TextSpan(
                text: 'Drag the stars between the lists.',
                style: TextStyle(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text:
                        'The stars will rotate in the order shown below when you click successively. To learn the name of a star for search, hover your mouse over the image.',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ]),
          ),
          const SizedBox(height: 13),
          const Padding(
            padding: EdgeInsets.only(right: 500),
            child: Row(
              children: [
                Text('Presents:'),
                SizedBox(width: 40),
                Text(
                  '1 star   4 star   all stars',
                  style: TextStyle(color: Color.fromARGB(255, 65, 33, 243)),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(right: 621),
            child: Row(
              children: [
                Text('In use:', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 56),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 510),
            child: Row(
              children: [
                const Text(
                  'Not in use:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.star,
                      color: Colors.redAccent,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.star,
                      color: Colors.purple,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.star,
                      color: Colors.blue,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.star,
                      color: Colors.green,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.priority_high,
                          size: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.double_arrow,
                          size: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.priority_high,
                          size: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.done,
                          size: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        ),
                      ),
                      child: const Center(
                        child: RotatedBox(
                          quarterTurns: 2,
                          child: Icon(
                            Icons.priority_high,
                            size: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.question_mark,
                          size: 12,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ])
      ],
    );
  }
}
