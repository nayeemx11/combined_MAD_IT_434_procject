import 'package:flutter/material.dart';

class IT_Tour extends StatefulWidget {
  const IT_Tour({super.key});

  @override
  State<IT_Tour> createState() => _IT_TourState();
}

class _IT_TourState extends State<IT_Tour> {
  int currentIndex = 0;
  final List<Map<String, dynamic>> imageUrls = [
    {'image': 'assets/it_tour_files/it_group.jpg', 'text': 'index 0'},
    {'image': 'assets/it_tour_files/sajek_add_game.jpg', 'text': 'index 1'},
    {'image': 'assets/it_tour_files/art.jpg', 'text': 'index 2'},
    {'image': 'assets/it_tour_files/cha.jpg', 'text': 'index 3'},
    {'image': 'assets/it_tour_files/chui_mui_3.jpg', 'text': 'index 4'},
    {'image': 'assets/it_tour_files/egale_eye.jpg', 'text': 'index 5'},
    {'image': 'assets/it_tour_files/good_day.jpg', 'text': 'index 6'},
    {'image': 'assets/it_tour_files/me.jpg', 'text': 'index 7'},
    {'image': 'assets/it_tour_files/polapain.jpg', 'text': 'index 8'},
    {'image': 'assets/it_tour_files/senario.jpg', 'text': 'index 9'},
    {'image': 'assets/it_tour_files/senario2.jpg', 'text': 'index 10'},
    {
      'image': 'assets/it_tour_files/Shayokh_Sir_photograph.jpg',
      'text': 'index 11'
    },
    {'image': 'assets/it_tour_files/sunrise_shajek.jpg', 'text': 'index 12'},
    {'image': 'assets/it_tour_files/Tanzir_Sir.jpg', 'text': 'index 13'},
    {'image': 'assets/it_tour_files/tas.jpg', 'text': 'index 14'},
    {'image': 'assets/it_tour_files/night_full_moon.jpg', 'text': 'index 15'},
  ];

  void nextPicture() {
    setState(() {
      if (currentIndex == (imageUrls.length - 1)) {
        currentIndex = 0;
      } else if (currentIndex < imageUrls.length - 1) {
        currentIndex++;
      }
    });
  }

  void previousPicture() {
    setState(() {
      if (currentIndex == 0) {
        currentIndex = (imageUrls.length - 1);
      } else if (currentIndex > 0) {
        currentIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IT Tour', style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 24,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 280,
                    minHeight: 400,
                    maxWidth: 315,
                    maxHeight: 610,
                  ),
                  child: Image.network(
                    imageUrls[currentIndex]['image'],
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  width: 280,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(5.0), // Circular border
                  ),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: imageUrls[currentIndex]['text'],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Container(
              width: 10.0, // Width of the SizedBox
              height: 50.0, // Height of the SizedBox
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black, // Border color
                  width: 2.0, // Border width
                ),
                borderRadius: BorderRadius.circular(50.0), // Circular border
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => previousPicture(),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () => nextPicture(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
