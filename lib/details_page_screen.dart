import 'package:flutter/material.dart';

class Details_page extends StatefulWidget {
  final heroTag;
  final foodName;
  final foodPrice;

  const Details_page({this.heroTag, this.foodName, this.foodPrice});

  @override
  State<Details_page> createState() => _Details_pageState();
}

class _Details_pageState extends State<Details_page> {
  var selectedCard = 'WEIGHT';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 121, 218, 150),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Detalhes',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
        ],
      ),
      body: ListView(children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 82,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
            ),
            Positioned(
              top: 75.0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45)),
                    color: Colors.white),
              ),
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width / 2) - 100,
                child: Hero(
                  tag: widget.heroTag,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.heroTag),
                            fit: BoxFit.cover)),
                    height: 200.0,
                    width: 200.0,
                  ),
                )),
            Positioned(
              top: 250.0,
              left: 25.0,
              right: 25.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.foodName,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(widget.foodPrice,
                          style: TextStyle(fontSize: 20.0, color: Colors.grey)),
                      Container(
                        height: 25.0,
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      Container(
                        width: 125.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                            color: Color.fromARGB(255, 121, 218, 150)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Color.fromARGB(255, 121, 218, 150),
                                ),
                                child: Center(
                                  child: Icon(Icons.remove,
                                      color: Colors.white, size: 20),
                                ),
                              ),
                            ),
                            Text(
                              '2',
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 15.0),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Colors.white),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Color.fromARGB(255, 121, 218, 150),
                                    size: 20,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        _buildInfoCard('PESO', '300', 'G'),
                        SizedBox(
                          width: 10,
                        ),
                        _buildInfoCard('CALORIAS', '295', 'CAL'),
                        SizedBox(
                          width: 10,
                        ),
                        _buildInfoCard('VITAMINAS', 'B1,B2', 'VIT')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                          color: Colors.black),
                      height: 50,
                      child: Center(
                        child: Text(
                          'R\$ 22,00',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ]),
    );
  }

  Widget _buildInfoCard(String cardTitle, String info, String unit) {
    return InkWell(
        onTap: () {
          selectdCard(cardTitle);
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: cardTitle == selectedCard
                ? Color.fromARGB(255, 121, 218, 150)
                : Colors.white,
            border: Border.all(
                color: cardTitle == selectedCard
                    ? Colors.transparent
                    : Colors.grey.withOpacity(0.30),
                style: BorderStyle.solid,
                width: 0.75),
          ),
          height: 100.0,
          width: 100.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 15.0),
                  child: Text(
                    cardTitle,
                    style: TextStyle(
                        fontSize: 12,
                        color: cardTitle == selectedCard
                            ? Colors.white
                            : Colors.grey),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 8.0, left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        info,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: cardTitle == selectedCard
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        unit,
                        style: TextStyle(
                            fontSize: 12,
                            color: cardTitle == selectedCard
                                ? Colors.white
                                : Colors.black),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }

  selectdCard(cardtitle) {
    setState(() {
      selectedCard = cardtitle;
    });
  }
}
