import 'dart:io';

import 'package:amelioration_page_facebook/ui/colorTheme.dart';
import 'package:amelioration_page_facebook/widgets/showImagePicker.dart';
import 'package:flutter/material.dart';

typedef SelectImageCallback = void Function(File? selectedImage);

// ignore: must_be_immutable
class ProfilEdit extends StatefulWidget {
  File? selectImagePath;
  final SelectImageCallback onSelectImage;

  ProfilEdit({Key? key, this.selectImagePath, required this.onSelectImage})
      : super(key: key);

  @override
  State<ProfilEdit> createState() => _ProfilEditState();
}

class _ProfilEditState extends State<ProfilEdit> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                onPressed: () async {
                  showImagePicker(context, (p0) {
                    setState(() {
                      widget.selectImagePath = p0;
                    });
                    widget.onSelectImage(p0);
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: ColorTheme.white,
                      size: 22,
                    ),
                    SizedBox(width: 10,),
                    Text(
                      "Ajouter à story",
                      style: TextStyle(
                        fontSize: 20,
                        color: ColorTheme.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorTheme.blue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                onPressed: () async {
                  showImagePicker(context, (p0) {
                    setState(() {
                      widget.selectImagePath = p0;
                    });
                    widget.onSelectImage(p0);
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit,
                      color: ColorTheme.darkGrey,
                      size: 22,
                    ),
                    SizedBox(width: 10,),
                    Text(
                      "Modifier le profil",
                      style: TextStyle(
                        fontSize: 20,
                        color: ColorTheme.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
            
          ],
        ),
      ],
    );
  }
}
