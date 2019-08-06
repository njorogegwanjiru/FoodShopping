import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cart_contents.dart';
import 'detailspage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final List<FoodItem> _cart =[];
  int cart_count = 0;
  double total ;

  Widget _buildFoodItem(FoodItem foodItem) {
    bool _isAdded = _cart.contains(foodItem);

    var imgPath = foodItem.image;
    var foodName = foodItem.name;
    var foodPrice = foodItem.price;

    return Padding(
      padding: EdgeInsets.only(left: 10.0, top: 10.0),
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(37.5), bottomLeft:Radius.circular(100))),
          child: Card(
            elevation: 8.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailsPage(
                              heroTag: imgPath,
                              foodName: foodName,
                              foodPrice: foodPrice,
                            )));
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 75.0,
                          width: 75.0,
                          child: Hero(
                            tag: imgPath,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(imgPath),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              foodName,
                              style: new TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              foodPrice,
                              style: new TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.0,
                                  color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      _isAdded
                          ? Icons.cancel
                          : Icons.add_shopping_cart,
                      color: _isAdded ? Colors.red : null,
                    ),
                    onPressed: () {
                      setState(() {
                        if (_isAdded) {
                          _cart.remove(foodItem);
                          cart_count = _cart.length;
                        } else {
                          _cart.add(foodItem);
                          cart_count = _cart.length;
                        }
                      });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {},
                  color: Colors.white,
                ),
                Container(
                  width: 125.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.filter_list),
                          color: Colors.white,
                          onPressed: () {}),
                      IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                          onPressed: () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Healthy',
                    style: new TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Food',
                    style: new TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0)),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.8)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 15.0, right: 20.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300.0,
                    child: ListView(
                      children: [for (var item in send) _buildFoodItem(item)],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 65.0,
                      width: 65.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1.0),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      height: 65.0,
                      width: 65.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, right: 8.0),
                                child: Text(
                                  '$cart_count',
                                  style: new TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CartContents(theList: _cart, total: total)));
                        },
                        child: Container(
                          height: 65.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 1.0),
                          ),
                          child: Center(
                            child: Text(
                              'Checkout',
                              style: new TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 17.0,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  List<FoodItem> send = [
    FoodItem('assets/index.jpg', 'Salmon bowl', '\$24.00'),
    FoodItem('assets/index2.jpg', 'Spring bowl', '\$22.00'),
    FoodItem('assets/index3.jpg', 'Avocado bowl', '\$26.00'),
    FoodItem('assets/index4.jpg', 'Bery bowl', '\$24.00'),
  ];
}

class FoodItem {
  var image, name, price;

  FoodItem(this.image, this.name, this.price);
}
