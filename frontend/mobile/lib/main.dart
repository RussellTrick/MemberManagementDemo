import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mvc_php_demo/widgets/school_table_widget.dart';
import 'package:mvc_php_demo/services/schoolservice.dart';

void main() async {
  await dotenv.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SchoolService _schoolService = SchoolService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVC php Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('MVC php Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Schools',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: SchoolTableWidget(_schoolService.getAllSchools()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
