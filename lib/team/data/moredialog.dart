import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart'; //https://pub.dev/packages/nb_utils

class DemoMWSimpleDialogScreen extends StatefulWidget {
  static String tag = '/DemoMWSimpleDialogScreen';

  @override
  DemoMWSimpleDialogScreenState createState() =>
      DemoMWSimpleDialogScreenState();
}

class DemoMWSimpleDialogScreenState extends State<DemoMWSimpleDialogScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  List<ListModel> example = [
    ListModel(name: 'Simple Dialog'),
    ListModel(name: 'Custom Achievement'),
    ListModel(name: 'Custom Warning Dialog'),
    ListModel(name: 'Image Dialog'),
    ListModel(name: 'Dialog with TextField'),
    ListModel(name: 'Custom Delete Dialog'),
    ListModel(name: 'Account Selection Dialog'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: ListView.builder(
        itemCount: example.length,
        itemBuilder: (BuildContext context, index) {
          return ExampleItemWidget(example[index], onTap: () {
            if (index == 0) {
              showDialog(
                context: context,
                builder: (BuildContext context) => SimpleDialogExample(),
              );
            } else if (index == 1) {
              showDialog(
                context: context,
                builder: (BuildContext context) => CustomDialogExample(),
              );
            } else if (index == 2) {
              showDialog(
                context: context,
                builder: (BuildContext context) => CustomWarning(),
              );
            } else if (index == 3) {
              showDialog(
                context: context,
                builder: (BuildContext context) => CustomImage(),
              );
            } else if (index == 4) {
              showDialog(
                context: context,
                builder: (BuildContext context) => FormDialogExample(),
              );
            } else if (index == 5) {
              showDialog(
                context: context,
                builder: (BuildContext context) => CustomDelete(),
              );
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) => CustomAccount(),
              );
            }
          });
        },
      ),
    );
  }
}

class CustomDialogExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: context.cardColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0)),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                finish(context);
              },
              child: Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.close, color: appStore.textPrimaryColor)),
            ),
            Image(
                image: AssetImage(
                    'images/widgets/materialWidgets/mwDialogAlertPanelWidgets/widgettrophy.png'),
                height: 80,
                fit: BoxFit.cover),
            24.height,
            Text('Congratulations',
                style:
                    boldTextStyle(color: appStore.textPrimaryColor, size: 24)),
            16.height,
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style:
                      secondaryTextStyle(color: appStore.textSecondaryColor)),
            ),
            30.height,
          ],
        ),
      ),
    );
  }
}

class SimpleDialogExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: context.cardColor,
      titlePadding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      title: Text('Message', style: boldTextStyle(size: 20)),
      children: [
        Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            style: primaryTextStyle()),
      ],
    );
  }
}

class FormDialogExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: new BoxDecoration(
          color: context.cardColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // To make the card compact
          children: <Widget>[
            GestureDetector(
              onTap: () {
                finish(context);
              },
              child: Container(
                  padding: EdgeInsets.all(4),
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.close, color: appStore.textPrimaryColor)),
            ),
            Text('Contact',
                style:
                    boldTextStyle(color: appStore.textPrimaryColor, size: 20)),
            16.height,
            TextFormField(
              cursorColor: appStore.textPrimaryColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(4, 8, 4, 8),
                hintText: 'Enter Contact Number',
                hintStyle: secondaryTextStyle(
                    color: appStore.textSecondaryColor, size: 16),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: appStore.textPrimaryColor!, width: 0.0)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: appStore.textPrimaryColor!, width: 0.0)),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              style: primaryTextStyle(color: appStore.textPrimaryColor),
            ),
            30.height,
            GestureDetector(
              onTap: () {
                finish(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Center(
                  child: Text("Apply", style: boldTextStyle(color: white)),
                ),
              ),
            ),
            16.height,
          ],
        ),
      ),
    );
  }
}

class CustomWarning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: new BoxDecoration(
          color: context.cardColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0)),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                Container(height: 150, color: Colors.indigo),
                Column(
                  children: [
                    Image(
                        image: AssetImage(
                            'images/widgets/materialWidgets/mwDialogAlertPanelWidgets/widget_no_wifi.png'),
                        height: 50,
                        color: white,
                        fit: BoxFit.cover),
                    16.height,
                    Text('No Internet Connection',
                        textAlign: TextAlign.center,
                        style: boldTextStyle(size: 18, color: white)),
                  ],
                )
              ],
            ),
            30.height,
            Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                    "Please check your internet connection nd try again.",
                    style: secondaryTextStyle())),
            16.height,
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text('Retry', style: boldTextStyle(color: white)),
              ),
            ),
            16.height,
          ],
        ),
      ),
    );
  }
}

class CustomImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: radius(8),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            ClipRRect(
                child: Image.asset(
                    'images/widgets/materialWidgets/mwDialogAlertPanelWidgets/widget_food.jpg',
                    fit: BoxFit.cover,
                    height: 250),
                borderRadius: radius(8)),
            GestureDetector(
              onTap: () {
                finish(context);
              },
              child: Container(
                  padding: EdgeInsets.all(16),
                  child: Icon(Icons.close, color: black)),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: radius(8),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: new BoxDecoration(
          color: context.cardColor,
          shape: BoxShape.rectangle,
          borderRadius: radius(8),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0)),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: Image(
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(
                      'images/widgets/materialWidgets/mwDialogAlertPanelWidgets/widget_delete.jpg'),
                  height: 120,
                  fit: BoxFit.cover),
            ),
            24.height,
            Text('Delete folder?',
                style:
                    boldTextStyle(color: appStore.textPrimaryColor, size: 18)),
            16.height,
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                  "This will also permanently delete file inside the folder",
                  style:
                      secondaryTextStyle(color: appStore.textSecondaryColor)),
            ),
            16.height,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.close,
                                          color: Colors.blueAccent, size: 18))),
                              TextSpan(
                                  text: "Cancel",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.blueAccent,
                                      fontFamily: 'Regular')),
                            ],
                          ),
                        ),
                      ),
                    ).onTap(() {
                      finish(context);
                    }),
                  ),
                  16.width,
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.delete,
                                          color: Colors.white, size: 18))),
                              TextSpan(
                                  text: "Delete",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontFamily: 'Regular')),
                            ],
                          ),
                        ),
                      ),
                    ).onTap(() {
                      toasty(context, "Successfully Deleted");
                      finish(context);
                    }),
                  )
                ],
              ),
            ),
            16.height,
          ],
        ),
      ),
    );
  }
}

class CustomAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: radius(8)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: context.cardColor,
          shape: BoxShape.rectangle,
          borderRadius: radius(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    finish(context);
                  },
                  child: Icon(Icons.close, color: appStore.textPrimaryColor),
                ),
                16.width,
                Text('Account',
                    style: boldTextStyle(
                        color: appStore.textPrimaryColor, size: 20),
                    textAlign: TextAlign.center)
              ],
            ),
            30.height,
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage(
                      'images/widgets/materialWidgets/mwDialogAlertPanelWidgets/ic_user.jpg'),
                ),
                10.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("John Smith",
                        style: primaryTextStyle(
                            color: appStore.textPrimaryColor, size: 20)),
                    FittedBox(
                        child: Text("Johnsmith@gmail.com",
                            style: secondaryTextStyle(
                                color: appStore.textSecondaryColor, size: 20))),
                  ],
                )
              ],
            ),
            20.height,
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).dividerColor),
                padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: Text("Manage your account",
                    style: primaryTextStyle(
                        color: appStore.textPrimaryColor, size: 20)),
              ),
            ),
            20.height,
            Divider(thickness: 1, color: Theme.of(context).dividerColor),
            20.height,
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                      child: Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: Icon(Icons.settings,
                              color: appStore.iconColor, size: 18))),
                  TextSpan(
                      text: "Photo Settings",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: appStore.textPrimaryColor,
                          fontFamily: 'Regular')),
                ],
              ),
            ),
            20.height,
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                      child: Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: Icon(Icons.help_outline,
                              color: appStore.iconColor, size: 18))),
                  TextSpan(
                      text: "Help and feedback",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: appStore.textPrimaryColor,
                          fontFamily: 'Regular')),
                ],
              ),
            ),
            20.height,
            Divider(thickness: 1, color: Theme.of(context).dividerColor),
            20.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Privacy",
                    style:
                        secondaryTextStyle(color: appStore.textSecondaryColor)),
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: appStore.textSecondaryColor),
                    width: 4,
                    height: 4,
                    margin: EdgeInsets.only(left: 8, right: 8)),
                Text("Terms",
                    style:
                        secondaryTextStyle(color: appStore.textSecondaryColor)),
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: appStore.textSecondaryColor),
                    width: 4,
                    height: 4,
                    margin: EdgeInsets.only(left: 8, right: 8)),
                Text("Policy",
                    style:
                        secondaryTextStyle(color: appStore.textSecondaryColor))
              ],
            ),
            16.height,
          ],
        ),
      ),
    );
  }
}

AppStore appStore = AppStore();

class AppStore {
  Color? textPrimaryColor;
  Color? iconColorPrimaryDark;
  Color? scaffoldBackground;
  Color? backgroundColor;
  Color? backgroundSecondaryColor;
  Color? appColorPrimaryLightColor;
  Color? textSecondaryColor;
  Color? appBarColor;
  Color? iconColor;
  Color? iconSecondaryColor;
  Color? cardColor;
  Color? appColorPrimary;

  AppStore() {
    textPrimaryColor = Color(0xFF212121);
    iconColorPrimaryDark = Color(0xFF212121);
    scaffoldBackground = Color(0xFFEBF2F7);
    backgroundColor = Colors.black;
    backgroundSecondaryColor = Color(0xFF131d25);
    appColorPrimaryLightColor = Color(0xFFF9FAFF);
    textSecondaryColor = Color(0xFF5A5C5E);
    appBarColor = Colors.white;
    iconColor = Color(0xFF212121);
    iconSecondaryColor = Color(0xFFA8ABAD);
    cardColor = Color(0xFF191D36);
    appColorPrimary = Color(0xFF1157FA);
  }
}

class ListModel {
  String? name;
  bool? isNew;
  Widget? widget;

  ListModel({this.name, this.widget, this.isNew});
}

class ExampleItemWidget extends StatelessWidget {
  final ListModel tabBarType;
  final Function onTap;
  final bool showTrailing;

  ExampleItemWidget(this.tabBarType,
      {required this.onTap, this.showTrailing = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: appStore.appBarColor,
      margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
      elevation: 2.0,
      shadowColor: Colors.black,
      child: ListTile(
        onTap: () => onTap(),
        title: Text(tabBarType.name!, style: boldTextStyle()),
        trailing: showTrailing
            ? Icon(Icons.arrow_forward_ios,
                size: 15, color: appStore.textPrimaryColor)
            : tabBarType.isNew.validate()
                ? Text('New', style: secondaryTextStyle(color: Colors.red))
                : null,
      ),
    );
  }
}
