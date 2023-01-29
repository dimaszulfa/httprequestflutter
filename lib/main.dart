import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:httprequestflutter/models/http_stateful.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: _HomeStatefulState());
  }
}

class _HomeStatefulState extends StatefulWidget {
  @override
  State<_HomeStatefulState> createState() => _HomeStatefulStateState();
}

class _HomeStatefulStateState extends State<_HomeStatefulState> {
  HttpStateful dataResponse = HttpStateful();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Http request flutter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              (dataResponse.id == null)
                  ? "ID : Belum ada data"
                  : "${dataResponse.id}",
              style: TextStyle(fontSize: 20),
            ),
            const Text(
              "ID : Belum ada data",
              style: TextStyle(fontSize: 20),
            ),
            const Text("Name : Belum ada data", style: TextStyle(fontSize: 20)),
            const Text("Job : Belum ada data", style: TextStyle(fontSize: 20)),
            const Text("Created at : Belum ada data",
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  HttpStateful.connectApi("Joni", "BackENd").then(
                    (value) {
                      print(value.name);

                      setState(() {
                        dataResponse = value;
                      });
                    },
                  );
                  // log(data.toString());
                },
                child: Text(
                  "POST DATA",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
