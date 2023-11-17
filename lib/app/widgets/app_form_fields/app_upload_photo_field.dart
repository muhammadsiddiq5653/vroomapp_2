import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:remixicon/remixicon.dart';

import '../../app_colors.dart';

class AppUploadPhotoField extends StatefulWidget {
  final Function(String?) onImageChanged;
  String? initialImage;
  final double width;
  final double height;
  final double borderRadius;
  AppUploadPhotoField(
      {Key? key,
      required this.onImageChanged,
      this.initialImage,
      this.width = 200,
      this.height = 200,
      this.borderRadius = 100})
      : super(key: key);

  @override
  _AppUploadPhotoField createState() => _AppUploadPhotoField();
}

class _AppUploadPhotoField extends State<AppUploadPhotoField> {
  String? _image;
  ImagePicker? _picker;

  @override
  void initState() {
    super.initState();
    _picker = ImagePicker();
  }

  _imgFromCamera() async {
    var image = await _picker?.pickImage(
        source: ImageSource.camera, imageQuality: 50, maxWidth: 1000);
    widget.onImageChanged(image?.path);
    setState(() {
      _image = image?.path;
    });
  }

  _imgFromGallery() async {
    var image = await _picker?.pickImage(
        source: ImageSource.gallery, imageQuality: 50, maxWidth: 1000);
    widget.onImageChanged(image?.path);
    setState(() {
      _image = image?.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius == 0
              ? widget.borderRadius
              : (widget.borderRadius - 5)),
          // backgroundColor: AppColors.primary,
          child: Container(
              padding: EdgeInsets.all(2),
              color: AppColors.primary,
              child: _getImageOrPlaceHolder()),
        ),
        Visibility(
          visible:
              _image != null || ![null, ''].contains(widget.initialImage),
          child: Positioned(
            right: 30,
            top: -10,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(40)),
              child: IconButton(
                  iconSize: 20,
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      _image = null;
                      widget.initialImage = null;
                      widget.onImageChanged(null);
                    });
                  },
                  icon: Icon(Icons.close)),
            ),
          ),
        ),
        Positioned(
          bottom: 0,

          right: 0,
          child: GestureDetector(
            onTap: (){
              _showPicker(context);
            },
            child: Container(
              width: 42,
              height: 42,
              decoration: ShapeDecoration(
                color: Color(0xFFC90000),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Icon(Icons.add,color: Colors.white,),
            ),
          ),
        )
      ],
    );
  }

  Widget _getImageOrPlaceHolder() {
    if (!['', null].contains(widget.initialImage)) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius == 0
            ? widget.borderRadius
            : (widget.borderRadius - 5)),
        child: Image.network(
          widget.initialImage ?? '',
          width: widget.width - 10,
          height: widget.height - 10,
          fit: BoxFit.cover,
        ),
      );
    }
    if (_image != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius == 0
            ? widget.borderRadius
            : (widget.borderRadius - 5)),
        child: Image.file(
          File(_image!),
          width: widget.width - 10,
          height: widget.height - 10,
          fit: BoxFit.cover,
        ),
      );
    }
    return Container(
      width: widget.width - 40,
      height: widget.height - 40,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(widget.borderRadius)),
      child: Center(
        child: Icon(
          Remix.camera_2_fill,
          color: Colors.white,
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Photo Library'),
                      onTap: () async {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
