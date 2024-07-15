import 'package:amelioration_page_facebook/screens/aboutMe.dart';
import 'package:amelioration_page_facebook/ui/colorTheme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilDetail extends StatelessWidget {
  String name;
  String? couverture;
  String? photo;
  String? description;
  List<String>? metiers;

  ProfilDetail(
      {required this.name,
      this.couverture,
      this.photo,
      this.description,
      this.metiers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                couvertureImage(couverture!),
                Padding(
                  padding: const EdgeInsets.only(top: 120, left: 20),
                  child: profilImage(photo!),
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
                        name,
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
                          description!,
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      // add button friend and message
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Icon(Icons.person, color: ColorTheme.white,),
                              // icon person with check
                              Icon(
                                FontAwesomeIcons.userCheck,
                                color: ColorTheme.darkGrey,
                                size: 16,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Amis',
                                style: TextStyle(
                                    fontSize: 16, color: ColorTheme.darkGrey),
                              )
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorTheme.grey,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.facebookMessenger,
                                color: ColorTheme.white,
                                size: 16,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Message',
                                style: TextStyle(
                                    fontSize: 16, color: ColorTheme.white),
                              )
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: ColorTheme.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: ColorTheme.grey,
                  height: 30,
                  thickness: 2,
                ),

                // add about me
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: metiers!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: AboutMe(
                        icon: FontAwesomeIcons.briefcase,
                        text: metiers![index],
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
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
      ],
    );
  }
}
