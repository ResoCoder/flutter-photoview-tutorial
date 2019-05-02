import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ControllerPhotoViewPage extends StatefulWidget {
  @override
  _ControllerPhotoViewPageState createState() =>
      _ControllerPhotoViewPageState();
}

class _ControllerPhotoViewPageState extends State<ControllerPhotoViewPage> {
  PhotoViewController photoViewController;

  @override
  void initState() {
    super.initState();
    photoViewController = PhotoViewController();
  }

  @override
  void dispose() {
    super.dispose();
    //! Don't forget to dispose of the controller!
    photoViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controller Photo View'),
      ),
      // Stack puts widgets "on top" of each other
      body: Stack(
        children: <Widget>[
          _buildPhotoView(context),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _buildScaleInfo(),
              _buildResetScaleButton(),
            ],
          )
        ],
      ),
    );
  }

  PhotoView _buildPhotoView(BuildContext context) {
    return PhotoView(
      controller: photoViewController,
      imageProvider: NetworkImage(
        'https://resocoder.com/wp-content/uploads/2019/04/thumbnail-2.png',
      ),
      // Contained = the smallest possible size to fit one dimension of the screen
      minScale: PhotoViewComputedScale.contained * 0.8,
      // Covered = the smallest possible size to fit the whole screen
      maxScale: PhotoViewComputedScale.covered * 2,
      // Set the background color to the "classic white"
      backgroundDecoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
      ),
      loadingChild: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  StreamBuilder<PhotoViewControllerValue> _buildScaleInfo() {
    return StreamBuilder(
      // Listening on the PhotoView's controller stream
      stream: photoViewController.outputStateStream,
      builder: (
        BuildContext context,
        AsyncSnapshot<PhotoViewControllerValue> snapshot,
      ) {
        if (!snapshot.hasData) return Container();
        return Center(
          child: Text(
            'Scale compared to the original: \n${snapshot.data.scale}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        );
      },
    );
  }

  RaisedButton _buildResetScaleButton() {
    return RaisedButton(
      child: Text('Reset Scale'),
      onPressed: () {
        photoViewController.scale = photoViewController.initial.scale;
      },
    );
  }
}
