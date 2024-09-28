import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String message = '';
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    fetchContent();
  }

  Future<void> fetchContent() async {
    DatabaseReference databaseRef = FirebaseDatabase.instance.ref('banner');
    databaseRef.onValue.listen((event) {
      final data = event.snapshot.value as Map;
      setState(() {
        message = data['message'];
        imageUrl = data['imageUrl'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'G D G | Promo',
                  style: TextStyle(fontSize: 21),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                              child: imageUrl.isNotEmpty
                                  ? Image.network(imageUrl)
                                  : const CircularProgressIndicator(),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 1,
                            width: 290,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              message,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 2,
                      width: 50,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Made by Pushkar Jadhav',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 2,
                      width: 50,
                      color: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// zomato banner link : https://newspaperads.ads2publish.com/wp-content/uploads/2021/02/zomato-order-safely-and-many-more-amazing-offers-ad-times-of-india-bangalore-07-02-2021.jpg
//swiggie banner link : https://newspaperads.ads2publish.com/wp-content/uploads/2018/03/swiggy-food-carnival-23rd-march-to-1st-april-get-upto-50-off-ad-times-of-india-ahmedabad-24-03-2018.png
