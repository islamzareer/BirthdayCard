import 'package:flutter/material.dart';

class Poem extends StatelessWidget {
  Poem({super.key});
  List<String> list = ["1.jpeg", "2.jpg", "3.png", "4.jpg"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: const Color(0xff13195b),
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  text: 'Message',
                  icon: Icon(Icons.message),
                  iconMargin: EdgeInsets.all(0),
                ),
                Tab(
                  text: 'Memories',
                  icon: Icon(Icons.memory),
                  iconMargin: EdgeInsets.all(0),
                ),
              ],
            ),
            centerTitle: true,
            title: const Text(
              'Happy Birthday',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'OleoScript'),
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, top: 36, right: 16, bottom: 36),
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.lightBlue,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "I hope Your Birthday is as sweet as the cake. And the year to follow is filled with as much joy as you bring your friends",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OleoScript'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16, top: 36, bottom: 36),
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.blueAccent,
                  child: ListView(
                    children: [
                      ...list.map((path) {
                        return Image(
                          image: AssetImage(path),
                          fit: BoxFit.fitWidth,
                        );
                      }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
