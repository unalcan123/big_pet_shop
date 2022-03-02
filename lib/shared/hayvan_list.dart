import 'package:big_pet_shop/models/hayvan_model.dart';
import 'package:big_pet_shop/screens/detay.dart';
import 'package:flutter/material.dart';

class HayvanList extends StatefulWidget {
  const HayvanList({Key? key}) : super(key: key);

  @override
  _HayvanListState createState() => _HayvanListState();
}

class _HayvanListState extends State<HayvanList> {
  List<Widget> _hayvanTiles = [];
  final GlobalKey _listKey = GlobalKey();
  _addHayvan() {
    List<Hayvan> _hayvanlar = [
      Hayvan(ad: 'Köpek', fiyat: '1000', adet: '15', img: 'kopek.jpg'),
      Hayvan(ad: 'Aslan', fiyat: '20000', adet: '2', img: 'aslan.jpg'),
      Hayvan(ad: 'Balık', fiyat: '10', adet: '1500', img: 'balik.jpg'),
      Hayvan(ad: 'Kanguru', fiyat: '10000', adet: '4', img: 'kanguru.jpg'),
      Hayvan(ad: 'Kaplumbağa', fiyat: '450', adet: '23', img: 'kaplumbaga.jpg'),
      Hayvan(ad: 'Kedi', fiyat: '1500', adet: '25', img: 'kedi.jpg'),
      Hayvan(ad: 'Kuzu', fiyat: '500', adet: '150', img: 'kuzu.jpg'),
      Hayvan(ad: 'Panda', fiyat: '100000', adet: '1', img: 'panda.jpg'),
      Hayvan(ad: 'Papağan', fiyat: '10000', adet: '5', img: 'papagan.jpg'),
      Hayvan(ad: 'Tavşan', fiyat: '1000', adet: '63', img: 'tavsan.jpg'),
    ];
    _hayvanlar.forEach((Hayvan h) {
      _hayvanTiles.add(_buildTile(h));
    });
  }

  Widget _buildTile(Hayvan h) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => Detay(hayvan: h)));
      },
      contentPadding: EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${h.adet} tane',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
                fontSize: 14),
          ),
          Text(
            '${h.ad}',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          )
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Hero(
          tag: 'img-${h.img}',
          child: Image.asset(
            'images/${h.img}',
            height: 50,
          ),
        ),
      ),
      trailing: Text(
        '${h.fiyat} TL',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _addHayvan();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        key: _listKey,
        itemCount: _hayvanTiles.length,
        itemBuilder: (context, index) {
          return _hayvanTiles[index];
        });
  }
}
