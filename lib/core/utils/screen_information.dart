import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getFullScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

// height with out padding and appbar height
double getScreenHeight(BuildContext context, [PreferredSizeWidget? appBar]) {
  double appBarHeight = appBar != null ? appBar.preferredSize.height : 0;

  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.vertical -
      appBarHeight;
}

// if the device in landscape take the original width
double getRealWidth(BuildContext context) {
  MediaQueryData mediaQueryData = MediaQuery.of(context);
  if (mediaQueryData.orientation == Orientation.landscape) {
    return mediaQueryData.size.height;
  } else {
    return mediaQueryData.size.width;
  }
}

// if the device in landscape take the original height with out padding and appbar

double getAvailableHeight(BuildContext context, [PreferredSizeWidget? appBar]) {
  double appBarHeight = appBar != null ? appBar.preferredSize.height : 0;

  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.vertical -
      appBarHeight;
}

Orientation getScreenOrientation(BuildContext context) {
  return MediaQuery.of(context).orientation;
}

double keyBoardHeight(BuildContext context) {
  return MediaQuery.of(context).viewInsets.bottom;
}

isThereCurrentDialogShowing(BuildContext context) {
  return ModalRoute.of(context)?.isCurrent != true;
}

void openDrawerFunc(BuildContext context) {
  Scaffold.of(context).openDrawer();
}
