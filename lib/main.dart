import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'นับเลขแบบไทยๆ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Text(
            "CP-SU LED MATRIX",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      backgroundColor: Colors.deepPurple[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    number++;
                    if (number > 99) {
                      number = 0;
                    }
                  });
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    CircleBorder(),
                  )
                ),
                child: Icon(
                  Icons.arrow_drop_up,
                  color: Color(0xFF250059),
                  size: 100,
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          matrix(number, 0),
                          SizedBox(width: 20,),
                          matrix(number, 1),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              width: 350,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  width: 10,
                  style: BorderStyle.solid,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    number--;
                    if (number < 0) {
                      number = 99;
                    }
                  });
                },
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xFF250059),
                  size: 100,
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(CircleBorder()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Column matrix(int number, int index) {
    List<List<List<int>>> digitMatrix = getDigitMatrix(number);

    return Column(children: [
      Row(
        children: [
          light(digitMatrix[index][0][0]),
          light(digitMatrix[index][0][1]),
          light(digitMatrix[index][0][2]),
          light(digitMatrix[index][0][3]),
          light(digitMatrix[index][0][4]),
        ],
      ),
      Row(children: [
        light(digitMatrix[index][1][0]),
        light(digitMatrix[index][1][1]),
        light(digitMatrix[index][1][2]),
        light(digitMatrix[index][1][3]),
        light(digitMatrix[index][1][4]),
      ]),
      Row(children: [
        light(digitMatrix[index][2][0]),
        light(digitMatrix[index][2][1]),
        light(digitMatrix[index][2][2]),
        light(digitMatrix[index][2][3]),
        light(digitMatrix[index][2][4]),
      ]),
      Row(children: [
        light(digitMatrix[index][3][0]),
        light(digitMatrix[index][3][1]),
        light(digitMatrix[index][3][2]),
        light(digitMatrix[index][3][3]),
        light(digitMatrix[index][3][4]),
      ]),
      Row(children: [
        light(digitMatrix[index][4][0]),
        light(digitMatrix[index][4][1]),
        light(digitMatrix[index][4][2]),
        light(digitMatrix[index][4][3]),
        light(digitMatrix[index][4][4]),
      ]),
      Row(children: [
        light(digitMatrix[index][5][0]),
        light(digitMatrix[index][5][1]),
        light(digitMatrix[index][5][2]),
        light(digitMatrix[index][5][3]),
        light(digitMatrix[index][5][4]),
      ]),
      Row(children: [
        light(digitMatrix[index][6][0]),
        light(digitMatrix[index][6][1]),
        light(digitMatrix[index][6][2]),
        light(digitMatrix[index][6][3]),
        light(digitMatrix[index][6][4]),
      ])
    ]);
  }

  Widget light(int num) {
    if (num == 0) {
      return Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Color(0xFF333333),
          shape: BoxShape.circle,
        ),
      );
    } else {
      return Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Color(0xFFb2ff59),
          shape: BoxShape.circle,
        ),
      );
    }
  }

  List<List<List<int>>> getDigitMatrix(int number) {
    List<List<List<int>>> dotsData = [
      // Digit 0
      [
        [0, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 0],
      ],
      // Digit 1
      [
        [0, 0, 1, 0, 0],
        [0, 1, 1, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 1, 1, 1, 0],
      ],
      // Digit 2
      [
        [0, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [0, 0, 0, 0, 1],
        [0, 0, 0, 1, 0],
        [0, 0, 1, 0, 0],
        [0, 1, 0, 0, 0],
        [1, 1, 1, 1, 1],
      ],
      // Digit 3
      [
        [0, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [0, 0, 0, 0, 1],
        [0, 1, 1, 1, 0],
        [0, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 0],
      ],
      // Digit 4
      [
        [0, 0, 0, 1, 0],
        [0, 0, 1, 1, 0],
        [0, 1, 0, 1, 0],
        [1, 0, 0, 1, 0],
        [1, 1, 1, 1, 1],
        [0, 0, 0, 1, 0],
        [0, 0, 0, 1, 0],
      ],
      // Digit 5
      [
        [1, 1, 1, 1, 1],
        [1, 0, 0, 0, 0],
        [1, 1, 1, 1, 0],
        [0, 0, 0, 0, 1],
        [0, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 0],
      ],
      // Digit 6
      [
        [0, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 0],
        [1, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 0],
      ],
      // Digit 7
      [
        [1, 1, 1, 1, 1],
        [0, 0, 0, 0, 1],
        [0, 0, 0, 1, 0],
        [0, 0, 1, 0, 0],
        [0, 1, 0, 0, 0],
        [0, 1, 0, 0, 0],
        [0, 1, 0, 0, 0],
      ],
      // Digit 8
      [
        [0, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 0],
      ],
      // Digit 9
      [
        [0, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 1],
        [0, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 0],
      ]
    ];

    List<List<List<int>>> all_matrix;

    if (number < 10) {
      all_matrix = [dotsData[0], dotsData[number]];
      return all_matrix;
    } else if (number >= 10 && number <= 99) {
      int tens = number ~/ 10;
      int ones = number % 10;
      all_matrix = [
        dotsData[tens],
        dotsData[ones],
      ];
      return all_matrix;
    }

    return [[]]; // Default empty matrix
  }
}