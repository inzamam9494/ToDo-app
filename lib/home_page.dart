import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("23 MAY 2023",
            style: TextStyle(
              fontWeight: FontWeight.w700
            ),)
              , Text("TUESDAY",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey
              ),)],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: PhysicalModel(
              color: Colors.white,
              elevation: 3,
              borderRadius: BorderRadius.circular(30),
              child: IconButton(
                onPressed: () {},
                icon: Transform.flip(
                    flipX: true,
                    child: const Icon(Icons.dark_mode_outlined)),
              ),
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text("To Do",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20
            ),)
          ],
        ),
      ),
    );
  }
}
