import 'package:big_pet_shop/models/hayvan_model.dart';
import 'package:big_pet_shop/shared/begen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ameno_ipsum/flutter_ameno_ipsum.dart';

class Detay extends StatefulWidget {
  final Hayvan hayvan;
  const Detay({Key? key, required this.hayvan}) : super(key: key);

  @override
  _DetayState createState() => _DetayState();
}

class _DetayState extends State<Detay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        padding: EdgeInsets.only(top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              child: Hero(
                tag: 'img-${widget.hayvan.img}',
                child: Image.asset(
                  'images/${widget.hayvan.img}',
                  height: 360,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              title: Text(
                widget.hayvan.ad,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey[800]),
              ),
              subtitle: Text(
                'vragprijs ${widget.hayvan.fiyat} TL',
                style: TextStyle(),
              ),
              trailing: Begen(),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                ameno(paragraphs: 2, words: 40),
                style: TextStyle(color: Colors.grey, height: 1.4),
              ),
            )
          ],
        ),
      ),
    );
  }
}
