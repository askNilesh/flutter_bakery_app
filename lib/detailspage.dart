import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFav = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/images/cake.jpg',
              height: 300,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.red,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            Positioned(
              top: 280,
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
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
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0) //
                      ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Ice Cream',
                      style: TextStyle(
                          color: Color(0xff3B012E), fontWeight: FontWeight.bold, fontSize: 25.0),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Color(0xffF5875F),
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Location name',
                          style: TextStyle(
                              color: Color(0xff3B012E),
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.calendar_view_day,
                          color: Color(0xffF5875F),
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Date',
                          style: TextStyle(
                              color: Color(0xff3B012E),
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s,',
                      style: TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.normal, fontSize: 16.0),
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(0xffFF8157),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(30.0) //
                            ),
                      ),
                      child: Center(
                        child: Text(
                          'Add To Cart',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: 250,
                left: 25,
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      isFav = !isFav;
                    });
                  },
                  backgroundColor: Colors.white,
                  child: IconButton(
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite,
                        color: isFav ? Colors.red : Colors.blueGrey,
                        size: 30,
                      ),
                      onPressed: null),
                ))
          ],
        ),
      )),
    );
  }
}
