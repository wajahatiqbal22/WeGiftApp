// Flutter imports:
// Package imports:
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wegift/extensions/date_time_extension.dart';
import 'package:wegift/src/app/app.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';

// Project imports:

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // await FirebaseAuth.instance.signOut();
  // getCsvData();
  // await FirebaseFirestore.instance
  //     .collection("users")
  //     .doc("ApsO8q9F3YLUeqj3m8dZ")
  //     .update({"wishlist": wishlist});
  // setDates();
  runApp(const App());
}

// Future<void> setDates() async {
//   final users = (await FirebaseFirestore.instance.collection("users").get())
//       .docs
//       .map((e) => WeGiftUser.fromJson(e.data()))
//       .toList();

//   List<WeGiftUser> finalList = List.empty(growable: true);

//   for (var element in users) {
//     element = element.copyWith(
//       userDetails: element.userDetails!.copyWith(
//           dobAsString: element.userDetails!.birthday?.getDateMonthAsString(),
//           aniversaryAsString:
//               element.userDetails!.anniversary?.getDateMonthAsString()),
//     );
//     finalList.add(element);
//   }

//   for (var element in finalList) {
//     await FirebaseFirestore.instance
//         .collection("users")
//         .doc(element.uid)
//         .update(element.toJson());
//   }
// }

// Future<void> getCsvData() async {
//   final data = await rootBundle.loadString('assets/json/data.json');
//   final rawData = jsonDecode(data);
//   final structured = List<Map<String, dynamic>>.from(rawData);
//   final List<Map<String, dynamic>> dataForDB = [];
//   final cats = [];
//   final subCats = [];
//   for (final d in structured) {
//     d["id"] = Utility.generateId();
//     final String category = d["category"];
//     final split = category.split("_");
//     if (category.contains("cards")) {
//       d["category"] = "card";
//       d["subCategory"] = split.length == 2 ? split.first : "${split.first}_${split[1]}";
//     } else if (category.contains("gifts")) {
//       d["category"] = "gift";

//       if (split.first == "gifts") {
//         d["subCategory"] = "${split[1]}_${split[2]}";
//       } else {
//         d["subCategory"] = split.length == 2 ? split.first : "${split.first}_${split[1]}";
//       }
//     } else {
//       d["subCategory"] = category;
//     }
//     // print(category);
//     cats.add(d["category"]);
//     subCats.add(d["subCategory"]);
//     dataForDB.add(d);
//   }
//   print(cats.toSet());
//   print(subCats.toSet());
//   // print(dataForDB.last);
//   // await FirebaseFirestore.instance.collection("config").doc("app_links").set({
//   //   "data": dataForDB,
//   // });
// }

// final data = [
//   {
//     "firstName": "Wajahat",
//     "lastName": "Iqbal",
//     "email": "wajahat@gmail.com",
//     "username": "wajahat123",
//     "phoneNumber": "+923043063857",
//     "userDetails": {
//       "firstName": "Wajahat",
//       "lastName": "Iqbal",
//       "email": "wajahat@gmail.com",
//       "birthday": DateTime.now(),
//       "anniversary": DateTime.now(),
//       "username": null,
//       "photoUrl":
//           "https://media.wired.com/photos/62ccbecc4847c5414f1e3dc9/3:2/w_1280%2Cc_limit/Light-Photo-Video-Like-a-Pro-Gear-GettyImages-142009824.jpg"
//     }
//   },
//   {
//     "firstName": "Hassan",
//     "lastName": "Ahmad",
//     "email": "hassan@gmail.com",
//     "username": "hasan12313",
//     "phoneNumber": "+923043063858",
//     "userDetails": {
//       "firstName": "Hassan",
//       "lastName": "Ahmad",
//       "email": "hassan@gmail.com",
//       "birthday": DateTime.now(),
//       "anniversary": DateTime.now(),
//       "username": null,
//       "photoUrl":
//           "https://globalnews.ca/wp-content/uploads/2022/09/GettyImages-1208469142.jpg?quality=85&strip=all&w=1200"
//     }
//   },
//   {
//     "firstName": "Bilal",
//     "lastName": "Khan",
//     "email": "bilal@gmail.com",
//     "username": "bilal324jl1",
//     "phoneNumber": "+923043063859",
//     "userDetails": {
//       "firstName": "Bilal",
//       "lastName": "Khan",
//       "email": "bilal@gmail.com",
//       "birthday": DateTime.now(),
//       "anniversary": DateTime.now(),
//       "username": null,
//       "photoUrl": "https://i.scdn.co/image/ab67616d0000b273851460d2f4ae8c7aeca381f6"
//     }
//   },
//   {
//     "firstName": "Shoaib",
//     "lastName": "Akhtar",
//     "email": "shoaibakhtar@gmail.com",
//     "username": "shoaivdev68",
//     "phoneNumber": "+923043063860",
//     "userDetails": {
//       "firstName": "Shoaib",
//       "lastName": "Akhtar",
//       "email": "shoaibakhtar@gmail.com",
//       "birthday": DateTime.now(),
//       "anniversary": DateTime.now(),
//       "username": null,
//       "photoUrl": "https://cdn.mos.cms.futurecdn.net/CAZ6JXi6huSuN4QGE627NR.jpg"
//     }
//   },
//   {
//     "firstName": "Alex",
//     "lastName": "Moiseenko",
//     "email": "alexM@gmail.com",
//     "username": "alexgp123",
//     "phoneNumber": "+923043063861",
//     "userDetails": {
//       "firstName": "Alex",
//       "lastName": "Moiseenk0",
//       "email": "shoaibakhtar@gmail.com",
//       "birthday": DateTime.now(),
//       "anniversary": DateTime.now(),
//       "username": null,
//       "photoUrl":
//           "https://images.unsplash.com/photo-1493863641943-9b68992a8d07?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80",
//     }
//   },
//   {
//     "firstName": "Amine",
//     "lastName": "LAHRIM",
//     "email": "aminthelahrim@gmail.com",
//     "username": "aminthelahrim",
//     "phoneNumber": "+923043063862",
//     "userDetails": {
//       "firstName": "Amin",
//       "lastName": "LAHRIM",
//       "email": "aminthelahrim@gmail.com",
//       "birthday": DateTime.now(),
//       "anniversary": DateTime.now(),
//       "username": null,
//       "photoUrl":
//           "https://images.unsplash.com/photo-1542038784456-1ea8e935640e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80",
//     }
//   },
// ];

final wishlist = {
  "2WUGmGW6sBVFncrLwJSZ": {
    "isReserved": false,
    "productImage":
        "https://ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=US&ASIN=B00D881GY0&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_",
    "id": "2WUGmGW6sBVFncrLwJSZ",
    "price": null,
    "title": "Skechers Afterburn fashion sneakers Black",
    "link":
        "https://www.amazon.com/Skechers-Afterburn-fashion-sneakers-Black/dp/B00D881GY0/ref=mp_s_a_1_4?_encoding=UTF8&content-id=amzn1.sym.4413b7c6-c9d2-43e2-8d02-d516d02590b2&crid=37WLFN696GHSD&keywords=men+footwear&pd_rd_r=eaa91837-ed1e-4ac3-8866-088ca71e22c4&pd_rd_w=VGX3q&pd_rd_wg=zSSws&pf_rd_p=4413b7c6-c9d2-43e2-8d02-d516d02590b2&pf_rd_r=GN1GG66J2P2H444BNEYH&qid=1670841483&refinements=p_36%3A-5000&rnid=2661611011&sprefix=men+footwear%2Caps%2C158&sr=8-4",
    "reservedBy": null
  },
  "fobsLtFwKfjtFJ9bgAFF": {
    "isReserved": false,
    "productImage":
        "https://ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=US&ASIN=B07BJ8HBDQ&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_",
    "id": "fobsLtFwKfjtFJ9bgAFF",
    "price": null,
    "title": "Amazon Essentials Full Zip Burgundy X Small",
    "link":
        "https://www.amazon.com/Amazon-Essentials-Full-Zip-Burgundy-X-Small/dp/B07BJ8HBDQ/ref=mp_s_a_1_1_sspa?_encoding=UTF8&content-id=amzn1.sym.26c3b3c6-fcac-486e-93dd-a23caa197911&crid=5SOX15DMYJW&keywords=Women+Clothing&pd_rd_r=2d42f141-fb65-49fc-a1b4-0063762345bf&pd_rd_w=ipcO7&pd_rd_wg=IKZmP&pf_rd_p=26c3b3c6-fcac-486e-93dd-a23caa197911&pf_rd_r=MYQ4VF7M3J24JQR1GWVW&qid=1671287653&refinements=p_36%3A-2500&rnid=2661611011&sprefix=women+clothing%2Caps%2C326&sr=8-1-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUExWTZCOEZIRzJXWVIzJmVuY3J5cHRlZElkPUEwMzEzNTAwV1RRUFY3QzZDWTVMJmVuY3J5cHRlZEFkSWQ9QTA1NDMyNTQyTzZDTDQ0QkdRUFFYJndpZGdldE5hbWU9c3BfcGhvbmVfc2VhcmNoX2F0ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU=",
    "reservedBy": null
  },
  "mqdFEE08s45KiJydfKVH": {
    "isReserved": false,
    "productImage":
        "https://ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=US&ASIN=B06XHXRXP1&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_",
    "id": "mqdFEE08s45KiJydfKVH",
    "price": null,
    "title": "Samsung ET YO324BBEGUS Gear VR Controller",
    "link":
        "https://www.amazon.com/Samsung-ET-YO324BBEGUS-Gear-VR-Controller/dp/B06XHXRXP1/ref=mp_s_a_1_2?_encoding=UTF8&content-id=amzn1.sym.f2643a49-d441-49e2-8877-ba32df4e5cdc&keywords=oculus&pd_rd_r=1e96f1af-730e-4c52-a58c-2e47e0df05e3&pd_rd_w=m3YJU&pd_rd_wg=fFbWJ&pf_rd_p=f2643a49-d441-49e2-8877-ba32df4e5cdc&pf_rd_r=69RNAKTJ3D4XA1XZ42NZ&qid=1670841515&s=electronics&sr=1-2",
    "reservedBy": null
  },
  "z2dtr5eb46UHVPrvF3YI": {
    "isReserved": false,
    "productImage":
        "https://ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=US&ASIN=B098SQKLVS&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_",
    "id": "z2dtr5eb46UHVPrvF3YI",
    "price": null,
    "title": "FLYFUPPY Slippers Unicorn Outdoor Bedroom",
    "link":
        "https://www.amazon.com/FLYFUPPY-Slippers-Unicorn-Outdoor-Bedroom/dp/B098SQKLVS/ref=mp_s_a_1_1_sspa?_encoding=UTF8&content-id=amzn1.sym.4413b7c6-c9d2-43e2-8d02-d516d02590b2&crid=1ZVS48U85MWPY&keywords=women+footwear&pd_rd_r=11bc56d0-022a-4ef9-913c-e1033d70e02e&pd_rd_w=LNeYj&pd_rd_wg=BK9eX&pf_rd_p=4413b7c6-c9d2-43e2-8d02-d516d02590b2&pf_rd_r=VDFB6HM3R6GWAQHJWMXH&qid=1671466242&refinements=p_36%3A-5000&rnid=2661611011&sprefix=Women+Footw%2Caps%2C286&sr=8-1-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEzRTZFOU1FS1pMRFRSJmVuY3J5cHRlZElkPUEwNDE1NzA3M1AxMVYxOTdBTE1MOCZlbmNyeXB0ZWRBZElkPUEwNDk2MzMxMjkxMUNZSTVFNUxKTiZ3aWRnZXROYW1lPXNwX3Bob25lX3NlYXJjaF9hdGYmYWN0aW9uPWNsaWNrUmVkaXJlY3QmZG9Ob3RMb2dDbGljaz10cnVl",
    "reservedBy": null
  }
};
