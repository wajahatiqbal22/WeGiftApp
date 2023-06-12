import 'package:flutter/material.dart';

class EventController extends ChangeNotifier {
  Map notifcationSection = {
    "Push": false,
    "Email": false,
    "Text Message": false
  };

  Map eventSection = {
    "Birthday": false,
    "Christmas": false,
    "Anniversary": false,
    "Valentine's Day": false,
    "Mother's Day": false,
    "Father's Day": false
  };

  Map birthdayToggles = {};
  Map christmasToggles = {};
  Map anniversaryToggles = {};
  Map valentineToggles = {};
  Map motherDayToggles = {};
  Map fatherDayToggles = {};

  void toggleNotificationSection(String text) {
    notifcationSection.update(text, (value) => !value);
    notifyListeners();
  }

  void toggleEventsSection(String text) {
    eventSection.update(text, (value) => !value);
    notifyListeners();
  }

  void toggleBirthdays(String text) {
    if (!birthdayToggles.containsKey(text)) {
      birthdayToggles.addAll({text: true});
    } else {
      birthdayToggles.update(
        text,
        (value) => !value,
      );
    }
    notifyListeners();
  }

  void toggleChristmas(String text) {
    if (!christmasToggles.containsKey(text)) {
      christmasToggles.addAll({text: true});
    } else {
      christmasToggles.update(
        text,
        (value) => !value,
      );
    }
    notifyListeners();
  }

  void toggleAnniversary(String text) {
    if (!anniversaryToggles.containsKey(text)) {
      anniversaryToggles.addAll({text: true});
    } else {
      anniversaryToggles.update(
        text,
        (value) => !value,
      );
    }
    notifyListeners();
  }

  void toggleValentine(String text) {
    if (!valentineToggles.containsKey(text)) {
      valentineToggles.addAll({text: true});
    } else {
      valentineToggles.update(
        text,
        (value) => !value,
      );
    }
    notifyListeners();
  }

  void toggleMotherDay(String text) {
    if (!motherDayToggles.containsKey(text)) {
      motherDayToggles.addAll({text: true});
    } else {
      motherDayToggles.update(
        text,
        (value) => !value,
      );
    }
    notifyListeners();
  }

  void toggleFatherDay(String text) {
    if (!fatherDayToggles.containsKey(text)) {
      fatherDayToggles.addAll({text: true});
    } else {
      fatherDayToggles.update(
        text,
        (value) => !value,
      );
    }
    notifyListeners();
  }
}
