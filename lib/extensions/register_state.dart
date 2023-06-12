import 'package:flutter/material.dart';
import 'package:wegift/src/auth/controllers/auth_controller.dart';
import 'package:wegift/src/auth/widgets/signup/aniversary_view.dart';
import 'package:wegift/src/auth/widgets/signup/birthday_view.dart';
import 'package:wegift/src/auth/widgets/signup/contact_perm_view.dart';
import 'package:wegift/src/auth/widgets/signup/follow_contact_view.dart';
import 'package:wegift/src/auth/widgets/signup/name_view.dart';
import 'package:wegift/src/auth/widgets/signup/notification_perm_view.dart';
import 'package:wegift/src/auth/widgets/signup/profile_pic_view.dart';
import 'package:wegift/src/auth/widgets/signup/username_view.dart';

extension RegisterStateExtension on RegisterState {
  Widget widget({required VoidCallback onNext}) {
    switch (this) {
      case RegisterState.name:
        return NameView(onNext: onNext, state: this);
      case RegisterState.username:
        return UsernameView(onNext: onNext, state: this);
      case RegisterState.birthday:
        return BirthdayView(onNext: onNext, state: this);
      case RegisterState.aniversary:
        return AnniversaryView(onNext: onNext, state: this);
      case RegisterState.profilePic:
        return ProfilePicView(onNext: onNext, state: this);
      case RegisterState.notifPerm:
        return NotificationPermView(onNext: onNext, state: this);
      case RegisterState.contactPerm:
        return ContactPermView(onNext: onNext, state: this);
      case RegisterState.followContact:
        return FollowContactView(onNext: onNext, state: this);
      // case RegisterState.inviteContact:
      //   return InviteContactView(onNext: onNext, state: this);
    }
  }

  String get primaryButtonText {
    switch (this) {
      case RegisterState.profilePic:
        return "Add a Photo";
      case RegisterState.followContact:
        return "Finish";
      default:
        return "Next";
    }
  }

  String? get secondaryButtonText {
    switch (this) {
      case RegisterState.aniversary:
        return 'No';
      case RegisterState.profilePic:
        return "Skip";
      default:
        return null;
    }
  }

  bool get isContactScreens => this == RegisterState.followContact;
  //  || this == RegisterState.inviteContact;
}
