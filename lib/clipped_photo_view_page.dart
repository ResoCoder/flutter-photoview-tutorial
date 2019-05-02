import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ClippedPhotoViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clipped Photo View'),
      ),
      body: Center(
        // Dynamically set a fixed size for the child widget,
        // so that it takes up the most possible screen space
        // while adhering to the defined aspect ratio
        child: AspectRatio(
          aspectRatio: 16 / 9,
          // Puts a "mask" on the child, so that it will keep its original, unzoomed size
          // even while it's being zoomed in
          child: ClipRect(
            child: PhotoView(
              imageProvider: NetworkImage(
                'https://resocoder.com/wp-content/uploads/2019/04/thumbnail-2.png',
              ),
              // Contained = the smallest possible size to fit one dimension of the screen
              minScale: PhotoViewComputedScale.contained * 0.8,
              // Covered = the smallest possible size to fit the whole screen
              maxScale: PhotoViewComputedScale.covered * 2,
              enableRotation: true,
              loadingChild: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
