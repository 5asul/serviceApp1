import 'dart:ffi';

import 'package:flutter/material.dart';
import 'database/sqfLite.dart';

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  SqlDb sqlDb = SqlDb();

  @override
  void dispose() {
    sqlDb.close(); // Dispose the database connection
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test App'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () async {
                  try {
                    int response = await sqlDb.insertData("INSERT INTO 'users' ('username', 'email', 'password') VALUES ('ahmed', 'ahmed@gmail.com', 'ahmed123')");
                    print(response);

                  } catch (e) {
                    print('insert error: $e');

                  }
                },
                color: Colors.amber,
                child: Text('Insert Data'),
              ),
              SizedBox(height: 10.0),
              MaterialButton(
                onPressed: () async {
                  try {
                    List<Map> response = await sqlDb.readData("SELECT * FROM 'services'");
                    print(response);

                  } catch (e) {
                    print('read error: $e');

                  }
                },
                color: Colors.green,
                child: Text('Read Data'),
              ),
              SizedBox(height: 10.0),
              MaterialButton(
                onPressed: () async {
                  try {
                    int response = await sqlDb.deleteData("DELETE FROM 'users' WHERE id = 2 ");
                    print("response: $response");

                  } catch (e) {
                    print('Delete error: $e');

                  }
                },
                color: Colors.red,
                child: Text('Delete Data'),
              ),
              SizedBox(height: 10.0),
              MaterialButton(
                onPressed: () async {
                  try {
                    int response = await sqlDb.updateData("Update 'users' SET 'username' = 'ahmedeno' WHERE id = 3 ");
                    print("response: $response");

                  } catch (e) {
                    print('Update error: $e');

                  }
                },
                color: Colors.blueAccent,
                child: Text('Update Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
