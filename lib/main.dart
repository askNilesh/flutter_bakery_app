import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'detailspage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController controller;
  int currentPage = 0;

  var bakeryItemList = List<BakeryItem>();

  @override
  initState() {
    super.initState();
    controller = new PageController(
      initialPage: currentPage,
      keepPage: false,
      viewportFraction: 0.8,
    );
    bakeryItemList.add(BakeryItem("Cake", 'assets/images/bread.png', true));
    bakeryItemList.add(BakeryItem("Bread", 'assets/images/bread.png', false));
    bakeryItemList.add(BakeryItem("Buns", 'assets/images/bread.png', false));
    bakeryItemList.add(BakeryItem("Pastry", 'assets/images/bread.png', false));
    bakeryItemList.add(BakeryItem("Muffin", 'assets/images/bread.png', false));
    bakeryItemList.add(BakeryItem("Pies", 'assets/images/bread.png', false));
    bakeryItemList.add(BakeryItem("Cupcakes", 'assets/images/bread.png', false));
    bakeryItemList.add(BakeryItem("Sweets", 'assets/images/bread.png', false));
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      FontAwesome.bars,
                      color: Color(0xffF5875F),
                    ),
                    onPressed: () {}),
                Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.asset(
                          'assets/images/nilesh.jpg',
                          height: 30,
                          width: 30,
                        )),
                    Icon(
                      Icons.brightness_1,
                      color: Color(0xffF5875F),
                      size: 10,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  controller: controller,
                  itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 150,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            'assets/images/bakery.jpg',
                            fit: BoxFit.cover,
                          )))),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 70,
              child: ListView.builder(
                  itemCount: bakeryItemList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          bakeryItemList.forEach((element) {
                            element.isSelected = false;
                          });
                          bakeryItemList[index].isSelected = !bakeryItemList[index].isSelected;
                        });
                      },
                      child: Container(
                        height: 70,
                        width: 70,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: bakeryItemList[index].isSelected
                                  ? Color(0xffFF949A)
                                  : Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(10.0) //
                              ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              bakeryItemList[index].itemIcon,
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 0,
                            ),
                            Text(bakeryItemList[index].itemName)
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailPage()));
                      },
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10.0) //
                              ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset('assets/images/ice_cream.jpg')),
                            SizedBox(width: 15,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: 5,),
                                  Text(
                                    'Ice Cream',
                                    style: TextStyle(
                                        color: Color(0xff3B012E), fontWeight: FontWeight.bold,fontSize: 20.0),
                                  ),
                                  Text(
                                    'Description text',
                                    style: TextStyle(
                                        color: Color(0xff3B012E), fontWeight: FontWeight.normal,fontSize: 16.0),
                                  ),

                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right :5.0,bottom: 5,top: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(index % 2 ==0 ? Icons.favorite:Icons.favorite,color:index % 2 ==0 ? Colors.red:Colors.blueGrey,size: 30,),
                                  Text(
                                    '\$20.0',
                                    style: TextStyle(
                                        color: Color(0xffF5875F), fontWeight: FontWeight.bold,fontSize: 16.0),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      )),
    );
  }
}

class BakeryItem {
  String itemName;
  String itemIcon;
  bool isSelected;

  BakeryItem(this.itemName, this.itemIcon, this.isSelected);
}
