import 'package:big_pet_shop/shared/baslik.dart';
import 'package:big_pet_shop/shared/hayvan_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 150,
              child: Center(
                child: Baslik(text: 'Unal Can Petshop'),
              ),
            ),
            Flexible(child: HayvanList())
          ],
        ),
      ),
    );
  }
}
