import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imbd_app_task/Dimensions/dimensions.dart';
import 'package:imbd_app_task/movie_data/movie_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double currentIndex = 0;
  List<Widget> carousalSilderList = [
    Card(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/marvel_img_1.jpg'), fit: BoxFit.cover),
        ),
        // color: Colors.pink,
        alignment: Alignment.bottomLeft,
      ),
    ),
    Card(
      child: Container(
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/marvel_img_2.jpg'), fit: BoxFit.cover),
        ),

        // color: Colors.red,
      ),
    ),
    Card(
      child: Container(
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/marvel_img_3.jpg'), fit: BoxFit.cover),
        ),

        // color: Colors.yellow,
      ),
    ),
    Card(
      child: Container(
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/imarvel_img_4.jpg'), fit: BoxFit.cover),
        ),

        // color: Colors.green,
      ),
    ),
    Card(
      child: Container(
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/marvel_img_2.jpg'), fit: BoxFit.cover),
        ),

        // color: Colors.grey,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    print(Get.context!.height);
    print(Get.context!.width);
    return Scaffold(
      body: Container(
        height: Dimensions.totalScreenHeight,
        width: Dimensions.totalScreenWidth,
        // color: Colors.blue.withOpacity(0.5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // color: Colors.orange,
                padding: EdgeInsets.all(15),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Top Movies',
                  style: TextStyle(
                    fontSize: Dimensions.fontSize25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CarouselSlider(
                items: carousalSilderList,
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index.toInt().ceilToDouble();
                    });
                  },
                  height: 200.0,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 5,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.9,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              DotsIndicator(
                decorator: DotsDecorator(
                    color: Colors.grey, activeColor: Colors.black),
                dotsCount: 5,
                position: currentIndex,
              ),
              Container(
                padding: EdgeInsets.all(15),
                width: double.infinity,
                // color: Colors.blue.withOpacity(0.4),
                child: Text(
                  'Latest Movies:',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 220,
                width: double.infinity,
                // color: Colors.green.withOpacity(0.5),
                child: GridView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.3, crossAxisCount: 1),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      color: Colors.grey.withOpacity(0.5),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              color: Colors.grey,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              alignment: Alignment.center,
                              width: double.infinity,
                              child: Text(
                                MovieData.MovieDataList[index]['movie_name'],
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
