import 'package:flutter/material.dart';
import 'main.dart';

class CartContents extends StatefulWidget {
  CartContents({Key key, @required this.theList, this.total}) : super(key: key);
  final List<FoodItem> theList;
  final double total;

  @override
  _CartContentsState createState() => _CartContentsState();
}

class _CartContentsState extends State<CartContents> {
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.white,
                ),
                Container(
                  width: 125.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
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
          SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.shopping_cart, size: 40, color: Colors.black),
                SizedBox(width: 5.0),
                Text('My',
                    style: new TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 5.0),
                Text('CART',
                    style: new TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 30.0)),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                    color: Colors.grey, style: BorderStyle.solid, width: 1.0),
              ),
              child: Center(
                child: Text(
                  widget.total.toString(),
                  style: new TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            height: MediaQuery.of(context).size.height - 230,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: widget.theList.isEmpty
                  ? Center(
                      child: Icon(
                        Icons.remove_shopping_cart,
                        color: Colors.red,
                        size: 100,
                      ),
                    )
                  : ListView(
                      children: [
                        for (var item in widget.theList) _buildFoodItem(item),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItem(FoodItem foodItem) {
    var imgPath = foodItem.image;
    var foodName = foodItem.name;
    var foodPrice = foodItem.price;

    return Padding(
      padding: EdgeInsets.only(left: 10.0, top: 10.0),
      child: Card(
        elevation: 8.0,
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
