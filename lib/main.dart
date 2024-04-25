import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "CARPINTERIA ARIAS"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageStae();
}

class _MyHomePageStae extends State<MyHomePage> {
  final List<String> imgList = [
    "https://thebelenfactory.com/img/Islas/isla1.jpeg",
    "https://thebelenfactory.com/img/cocina/cocina.png",
    "https://thebelenfactory.com/img/cocina/cocina2.jpeg",
    "https://thebelenfactory.com/img/msd/msd.jpeg",
    "https://thebelenfactory.com/img/Islas/isla4.jpeg",
    "https://thebelenfactory.com/img/gabineteb/gb1.jpeg",
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.brown[200],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 10.0), // Ajusta el margen superior del carrusel
        child: Column(
          children: [
            CarouselSlider(
              items: imgList
                  .map((e) => Center(
                        child: Image.network(e),
                      ))
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (value, _) {
                    setState(() {
                      _currentPage == value;
                    });
                  }),
            ),
            buildCarouselIndicator()
          ],
        ),
      ),
    );
  }

  buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < imgList.length; i++)
          Container(
            margin: const EdgeInsets.all(5),
            height: i == _currentPage ? 7 : 5,
            width: i == _currentPage ? 7 : 5,
            decoration: BoxDecoration(
              color: i == _currentPage ? Colors.black : Colors.grey,
              shape: BoxShape.circle,
            ),
          )
      ],
    );
  }
}
