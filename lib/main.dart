import 'package:flutter/material.dart';
import 'package:flutter_search/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    newUsers = users;
  }

  List users = [
    User(
        'waleed',
        'https://media.istockphoto.com/photos/portrait-of-handsome-latino-african-man-picture-id1007763808?k=20&m=1007763808&s=612x612&w=0&h=q4qlV-99EK1VHePL1-Xon4gpdpK7kz3631XK4Hgr1ls=',
        '@waleed',
        false),
    User(
        'Ahmed',
        'https://media.istockphoto.com/photos/success-happens-the-moment-you-believe-it-will-picture-id1262964438?k=20&m=1262964438&s=612x612&w=0&h=I6lkizpD2iJeXYrImSR9Jl4_oOfKzoKq5hB0u6kC18o=',
        'Aahmed',
        false),
    User(
        'Salem',
        'https://media.istockphoto.com/photos/man-with-crossed-arms-isolated-on-gray-background-picture-id1171169099?k=20&m=1171169099&s=170667a&w=0&h=DQqrgqp-YU5RpCqi9H8Yr8Bn5-aReowzb0wBEjQIGPA=',
        '@saled',
        false),
    User(
        'Amany',
        'https://i.insider.com/5cb8b133b8342c1b45130629?width=1136&format=jpeg',
        '@amany',
        false),
    User(
        'Yaser',
        'https://api.time.com/wp-content/uploads/2017/12/joey-degrandis-hsam-memory.jpg',
        '@yaser',
        false),
    User(
        'Fares',
        'https://cdn.vox-cdn.com/thumbor/JMB4qMewzY8tiE2inHQDsw9AkZ0=/0x231:2456x2073/1200x800/filters:focal(0x231:2456x2073)/cdn.vox-cdn.com/uploads/chorus_image/image/44255874/458999260.0.jpg',
        '@fares',
        false),
    User(
        'Salma',
        'https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/09/27/08/jennifer-lawrence.jpg?quality=75&width=982&height=726&auto=webp',
        '@salma',
        false),
    User(
        'Hady',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTb84JafH6ha4_dVpUKcaTZrzyvYlNtTeXOd3aZHTm4ZVGZzd62ZXRVRjYuxgxZkymruI&usqp=CAU',
        '@hady',
        false),
    User(
        'AbdulRahman',
        'https://www.gse.harvard.edu/sites/default/files//1500x1000-turner-cooper.jpg',
        'abdu',
        false),
    User(
        'Son',
        'https://images.pexels.com/photos/837358/pexels-photo-837358.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        '@so',
        false),
    User(
        'Soad',
        'https://imgix.bustle.com/uploads/image/2021/7/16/07062a59-9fd1-41f8-9c99-e4c0f5d80c05-06546552-d025-4a16-ab18-d252ff01fa90-getty-1205000579.jpeg?w=800&fit=crop&crop=focalpoint&auto=format%2Ccompress&fp-x=0.4587&fp-y=0.754',
        '@soad',
        false),
  ];

  List newUsers = [];

  void mySearch(myVAlue) {
    newUsers = users
        .where((user) => user.name.toLowerCase().contains(myVAlue.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('flutter search'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              width: 330,
              child: TextFormField(
                onChanged: (val) => mySearch(val),
                decoration: InputDecoration(
                  labelText: 'search for friends',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height/1.3,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: newUsers.length,
                  itemBuilder: (c, i) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(newUsers[i].image),
                            radius: 28,
                          ),
                          title: Text(newUsers[i].name),
                          subtitle: Text(newUsers[i].nickname),
                          trailing: MaterialButton(
                            child: users[i].isFollow
                                ? Text('Unfollow',style: TextStyle(color: Colors.white),)
                                : Text('Follow',style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              setState(() {

                              });
                              users[i].isFollow = !users[i].isFollow;
                            },
                            color:users[i].isFollow?  Colors.grey[700]:Colors.blue[700],
                          ),
                        ),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
