import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Column Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Column Widget Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '1. Beshikda joylashgan matn',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20), // Boshliq qo'shish
              Text(
                '2. Ikkinchi matn',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20), // Boshliq qo'shish
              Text(
                '3. Uchinchi matn',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
