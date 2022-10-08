import "package:flutter/material.dart";

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: Colors.white,
              ),
              onPressed: () {
                //Navigator.of(context).ro;
              },
            ),
          ),
          title: const Text("Profile"),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
         body: SafeArea(
            child: Center(
               child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const CircleAvatar(
          radius: 80,
          backgroundImage:NetworkImage(
            "https://www.trendrr.net/wp-content/uploads/2017/06/Deepika-Padukone-1.jpg",
          ),
        ),
        const Text(
          'User',
          style: TextStyle(
            fontFamily: 'SourceSansPro',
            fontSize: 25,
          ),
        ),
        Text(
          'Welcome',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'SourceSansPro',
            color: Colors.red[400],
            letterSpacing: 2.5,
          ),
        ),
        SizedBox(
          height: 20.0,
          width: 200,
          child: Divider(
            color: Colors.teal[100],
          ),
        ),
        const Text("View list of bills"),
        Card(
            color: Colors.white,
            margin:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.teal[900],
              ),
              title: const Text(
                '+91 85465XXX8XX',
                style:
                TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
              ),
            )),
        Card(
          color: Colors.white,
          margin:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            leading: Icon(
              Icons.cake,
              color: Colors.teal[900],
            ),
            title: const Text(
              '08-05-1995',
              style: TextStyle(fontSize: 20.0, fontFamily: 'Neucha'),
            ),
          ),
        )
      ],
    ),
    ),
    ),


          );


}
