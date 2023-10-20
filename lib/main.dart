import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Food Delivery',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const SecondScreen(),
        '/foods': (context) => const Foods(),
      },
    ),
  );
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Foode Delivery App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tap on the Login Button"),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Form'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(height: 20),
            const Text("Enter the details and Login"),
            const TextField(
              textDirection: TextDirection.ltr,
              keyboardType: TextInputType.emailAddress,
              showCursor: true,
              decoration: InputDecoration(labelText: "Email"),
            ),
            const TextField(
              textDirection: TextDirection.ltr,
              keyboardType: TextInputType.emailAddress,
              showCursor: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            ElevatedButton(
              // Within the SecondScreen widget
              onPressed: () {
                // Navigate back to the first screen by popping the current route
                // off the stack.
                Navigator.pushNamed(context, '/foods');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class Foods extends StatefulWidget {
  const Foods({super.key});

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  List<String> foods = <String>[
    "Samosa",
    "Jalebi",
    "Kachori",
    "Rasgulla",
    "Gulab",
    "Raju",
    "Kartik",
    "Rasmalai",
    "Biryani",
    "Dushyant",
    "Rasabhari"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Food List'),
        ),
        body: Center(
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(10, (index) {
              return Center(
                child: Card(
                  // Define the shape of the card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  // Define how the card's content should be clipped
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  // Define the child widget of the card
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        'assets/foodimage.jpg',
                        width: 100,
                        height: 100,
                      ),
                      // Add padding around the row widget
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(height: 5),
                                  Text(
                                    "Food ${foods[index]}",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ));
  }
}
