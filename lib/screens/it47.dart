import 'package:flutter/material.dart';

class IT47 extends StatelessWidget {
  IT47({super.key});

  final List<Map<String, dynamic>> items = [
    {
      'text': 'Fahiba Farhin',
      'faculty': 'Lecturer & Course Coordinator',
      'edu': 'M.Sc. in ICT, Jahangirnagar University (JU)',
      'office_phone': '+8809678008487, Ext-508',
      'email': 'fahiba.farhin@uits.edu.bd',
      'image': 'assets/it47_files/Fahiba_Mam.jpg'
    },
    {
      'text': 'Moinur Rahman',
      'faculty': 'Lecturer',
      'edu': 'M.Sc. in ICT, Comilla University (CoU)',
      'office_phone': '+8809678008487, Ext-508',
      'email': 'moinur.rahman@uits.edu.bd',
      'image': 'assets/it47_files/Moinur_Sir.jpg'
    },
    {
      'text': 'Al Mamun',
      'faculty': 'Lecturer',
      'edu':
          'B.Sc. (Engg.) in ICT, Mawlana Bhashani Science and Technology University (MBSTU)',
      'office_phone': '+8809678008487, Ext-508',
      'email': 'abdullah.almamun@uits.edu.bd',
      'image': 'assets/it47_files/AL_Mamun_Sir.jpg'
    },
    // Add more items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          backgroundColor: Colors.grey,
          title: Text('IT-47'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.exit_to_app)),
            SizedBox(width: 20),
          ],
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 100,
                        minHeight: 260,
                        maxWidth: 243,
                        maxHeight: 313,
                      ),
                      child: Image.network(
                        items[index]['image'],
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "${items[index]['text']}\n",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: "${items[index]['faculty']}\n"),
                              TextSpan(text: "${items[index]['edu']}\n\n"),
                              TextSpan(
                                text: 'Office: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: "${items[index]['office_phone']}\n",
                              ),
                              TextSpan(
                                text: 'Email: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: "${items[index]['email']}\n",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
