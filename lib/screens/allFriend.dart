import 'package:amelioration_page_facebook/models/friends.dart';
import 'package:amelioration_page_facebook/screens/profilDetail.dart';
import 'package:amelioration_page_facebook/ui/colorTheme.dart';
import 'package:flutter/material.dart';

class AllFriends extends StatelessWidget {
  AllFriends({super.key});

  List<Friends> friends = Friends.getFriends();

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Amis',
          style: TextStyle(color: ColorTheme.white),
        ),
        backgroundColor: ColorTheme.blue,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: ColorTheme.white,
          ),
        ),
      ),
      body: orientation == Orientation.portrait
          ? AllFriendMobile()
          : AllFriendDesktop(context),
    );
  }

  Widget buildFriend(String name, String photo,
      {String? description, required List<String> metiers}) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(photo),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            // Wrap Column with Expanded widget
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.circle,
                      color: ColorTheme.green,
                      size: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: metiers.length,
                  itemBuilder: (context, index) => Row(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      const Icon(
                        Icons.work,
                        color: ColorTheme.grayIcon,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Expanded(
                        // Wrap Text with Expanded widget
                        child: Text(
                          metiers[index],
                          style: const TextStyle(
                            color: ColorTheme.darkGrey,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget AllFriendDesktop(context) {
    return Container(
      height: MediaQuery.of(context).size.height, // Set a fixed height
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 3,
        children: List.generate(friends.length, (index) {
          return InkWell(
            child: Card(
              child: buildFriend(
                  friends[index].name.toString(), friends[index].photo.toString(),
                  metiers: friends[index].metiers!),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
              builder: (context)=> ProfilDetail(name: friends[index].name.toString(),photo: friends[index].photo.toString(),couverture: friends[index].couverture.toString(),description: friends[index].description.toString(),metiers: friends[index].metiers)));
            },
          );
        }),
      ),
    );
  }

  Widget AllFriendMobile() {
    return ListView.separated(
      itemCount: friends.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: buildFriend(
              friends[index].name.toString(), friends[index].photo.toString(),
              metiers: friends[index].metiers!),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=> ProfilDetail(name: friends[index].name.toString(),photo: friends[index].photo.toString(),couverture: friends[index].couverture.toString(),description: friends[index].description.toString(),metiers: friends[index].metiers)));
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
