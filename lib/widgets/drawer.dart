import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  final imageUrl =
      "https://media.licdn.com/dms/image/D4D03AQFQ25j2KzvLCA/profile-displayphoto-shrink_800_800/0/1678001529494?e=2147483647&v=beta&t=tCH5l30nlKtS7rRvjSzZIw0jM1CvpkhxLmkZnA8J_Os";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                accountName: const Text(
                  "Sandesh Kolte",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                accountEmail: const Text("sandeshkolte11@gmail.com",
                    style: TextStyle(color: Colors.white, fontSize: 15)),
                currentAccountPicture:
                    CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.home),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
              ),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.mail),
              title: Text(
                "Contact me",
                textScaleFactor: 1.2,
              ),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.profile_circled),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
