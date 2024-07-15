import 'dart:io';
import 'package:amelioration_page_facebook/models/post.dart';
import 'package:amelioration_page_facebook/models/friends.dart';
import 'package:amelioration_page_facebook/models/profil.dart';
import 'package:amelioration_page_facebook/screens/aboutMe.dart';
import 'package:amelioration_page_facebook/screens/profilDetail.dart';
import 'package:amelioration_page_facebook/ui/colorTheme.dart';
import 'package:amelioration_page_facebook/widgets/profilEdit.dart';
import 'package:amelioration_page_facebook/widgets/showImagePicker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Profil userProfil = Profil(
    couverture: 'assets/images/couverture.jpg',
    photo: 'assets/images/profil/profil.jpg',
    name: 'Rindra Rasolonirina',
    description: 'If you don\'t fail you are not even trying 💻💻',
  );

  List<Friends> listFriends = Friends.getFriends();

  List<Posts> listPosts = Posts.getPosts();

  File? selectImagePathProfil;
  File? selectImagePathCouverture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Facebook Profil',
          style:
              TextStyle(fontStyle: FontStyle.normal, color: ColorTheme.white),
        ),
        centerTitle: false,
        elevation: 5,
        backgroundColor: ColorTheme.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // couvertureImage("${userProfil.couverture}"),
                selectImagePathCouverture == null
                    ? couvertureImage("${userProfil.couverture}")
                    : couvertureFileImage(selectImagePathCouverture!),
                Padding(
                  padding: const EdgeInsets.only(top: 120, left: 20),
                  child:
                      //profilImage("${userProfil.photo}"),
                      selectImagePathProfil == null
                          ? profilImage("${userProfil.photo}")
                          : profilFileImage(selectImagePathProfil!),
                ),
              ],
            ),

            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 10),
                      child: Text(
                        "${userProfil.name}",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          userProfil.description.toString(),
                          maxLines: 4,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18,
                              color: ColorTheme.darkGrey,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(padding: const EdgeInsets.only(top: 20)),

            // Image Picker
            ProfilEdit(onSelectImage: (File? selectedImage) {
              setState(() {
                selectImagePathProfil = selectedImage;
              });
            }),

            Divider(
              color: ColorTheme.grey,
              height: 30,
              thickness: 2,
            ),

            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "A propos de moi",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(221, 56, 55, 55)),
                      ),
                    ),
                  ],
                ),
                Padding(padding: const EdgeInsets.only(top: 10)),
                AboutMe(icon: FontAwesomeIcons.house, text: "Habite à Antananarivo"),
                AboutMe(icon: FontAwesomeIcons.graduationCap, text: "A étudié à ISPM"),
                AboutMe(icon: FontAwesomeIcons.briefcase, text: "Travaille à Freelance"),
              ],
            ),
            Divider(
              color: Color.fromARGB(255, 230, 229, 229),
              height: 30,
              thickness: 2,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Amis",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(221, 56, 55, 55)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: InkWell(
                        child: Container(
                          child: Text("Voir Tout",style: TextStyle(color: ColorTheme.blue),),
                        ),
                        onTap: (){
                          Navigator.pushNamed(context, '/friends');
                        },
                      ),
                    )
                  ],
                ),
                Padding(padding: const EdgeInsets.only(top: 10)),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: listFriends
                            .map((friend) => InkWell(
                              child: friends(friend.photo.toString(),
                                  friend.name.toString()),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=> ProfilDetail(name: friend.name.toString(),photo: friend.photo.toString(),couverture: friend.couverture.toString(),description: friend.description.toString(),metiers: friend.metiers)));
                              },
                            ))
                            .toList())),
                Divider(
                  color: Color.fromARGB(255, 230, 229, 229),
                  height: 30,
                  thickness: 2,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Mes Posts",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(221, 56, 55, 55)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: listPosts
                          .map((post,) => posts(
                                post.id!.toInt(),
                                post.photo.toString(),
                                post.name.toString(),
                                post.description.toString(),
                                post.time.toString(),
                                post.couverture.toString(),
                                post.toggleIsLike(),
                                post.textIsLike.toString()
                              ))
                          .toList(),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget couvertureFileImage(File file) {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.file(file).image, fit: BoxFit.cover),
            )),
        Positioned(
          bottom: 10,
          right: 5,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorTheme.grey,
                border: Border.all(color: ColorTheme.white, width: 5)),
            child: InkWell(
              child: Icon(
                Icons.camera_alt,
                color: ColorTheme.black,
              ),
              onTap: () {
                showImagePicker(context, (p0) {
                  setState(() {
                    selectImagePathCouverture = p0;
                  });
                });
              },
            ),
          ),
        )
      ],
    );
  }

  Widget couvertureImage(String image) {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.asset(image).image, fit: BoxFit.cover),
            )),
        Positioned(
          bottom: 10,
          right: 5,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorTheme.grey,
                border: Border.all(color: ColorTheme.white, width: 5)),
            child: InkWell(
              child: Icon(
                Icons.camera_alt,
                color: ColorTheme.black,
              ),
              onTap: () {
                showImagePicker(context, (p0) {
                  setState(() {
                    selectImagePathCouverture = p0;
                  });
                });
              },
            ),
          ),
        )
      ],
    );
  }

  Widget profilImage(String image) {
    return Stack(
      children: [
        Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.asset(image).image, fit: BoxFit.cover),
                shape: BoxShape.circle,
                border: Border.all(color: ColorTheme.white, width: 5))),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorTheme.grey,
                border: Border.all(color: ColorTheme.white, width: 5)),
            child: InkWell(
              child: Icon(
                Icons.camera_alt,
                color: ColorTheme.black,
              ),
              onTap: () {
                showImagePicker(context, (p0) {
                  setState(() {
                    selectImagePathProfil = p0;
                  });
                });
              },
            ),
          ),
        )
      ],
    );
  }

  Widget profilFileImage(File image) {
    return Stack(
      children: [
        Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: FileImage(image), fit: BoxFit.cover),
                shape: BoxShape.circle,
                border: Border.all(color: ColorTheme.white, width: 5))),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorTheme.white,
                border: Border.all(color: ColorTheme.white, width: 5)),
            child: InkWell(
              child: Icon(
                Icons.camera_alt,
                color: ColorTheme.black,
              ),
              onTap: () {
                showImagePicker(context, (p0) {
                  setState(() {
                    selectImagePathProfil = p0;
                  });
                });
              },
            ),
          ),
        )
      ],
    );
  }

  Widget friends(String image, String name) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.asset(image).image, fit: BoxFit.cover),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20))),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Text(
            name,
            style:
                TextStyle(fontSize: 18, color: Color.fromARGB(221, 56, 55, 55)),
          ),
        )
      ],
    );
  }

  Widget posts(int id,String image, String name, String text, String time,
      String imagePost, bool isLiked, String textIsLiked) {
    return Container(
      key: ValueKey(id),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                //height: 600,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 240, 239, 239),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(padding: const EdgeInsets.only(top: 20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: Image.asset(image).image,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color:
                                              Color.fromARGB(221, 56, 55, 55),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              time,
                              style: TextStyle(
                                  fontSize: 18, color: ColorTheme.blue),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                text,
                                maxLines: 4,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(221, 56, 55, 55)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: const EdgeInsets.only(top: 10)),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 380,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: Image.asset(imagePost).image,
                                  fit: BoxFit.cover),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10))),
                      // Padding(padding: const EdgeInsets.only(bottom: 10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () => setState(() {
                                    isLiked = !isLiked;
                                  }),
                                  icon: Icon(
                                    isLiked
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: isLiked
                                        ? ColorTheme.red
                                        : ColorTheme.black,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    textIsLiked,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromARGB(221, 56, 55, 55)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.comment,
                                color: ColorTheme.blue,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  " 0 Commentaires",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(221, 56, 55, 55)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
