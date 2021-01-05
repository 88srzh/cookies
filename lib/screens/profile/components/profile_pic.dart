import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File _image, _galleryImage;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  // Future getGallery() async {
  //   final galleryImage = await picker.getImage(source: ImageSource.gallery);

  //   setState(() {
  //     if (galleryImage != null) {
  //       _galleryImage = File(galleryImage.path);
  //     } else {
  //       print('No image gallery');
  //     }
  //   });
  // }

//   Future<void> retrieveLostData() async {
//   final LostData response =
//       await picker.getLostData();

//   if (response.isEmpty) {
//     return;
//   }
//   if (response.file != null) {
//     setState(() {
//       if (response.type == RetrieveType.video) {
//         _handleVideo(response.file);
//       } else {
//         _handleImage(response.file);
//       }
//     });
//   } else {
//     _handleError(response.exception);
//   }
// }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          _image == null
              ? Image.asset('assets/images/no_image.jpg')
              // : CircleAvatar(
              : Image.file(_image),
          // _galleryImage == null
          //     ? Image.asset('assets/images/no_image.jpg')
          //     : Image.file(_galleryImage),
          // backgroundImage:
          // AssetImage('assets/images/avatar_circle2.png'),
          // ),
          Positioned(
            bottom: 0,
            right: -10,
            child: SizedBox(
              height: 46,
              width: 46,
              child: FlatButton(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.white),
                ),
                color: Color(0xFFF5F6F9),
                onPressed: getImage,
                // onLongPress: getGallery,
                child: SvgPicture.asset('assets/icons/Camera Icon.svg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
