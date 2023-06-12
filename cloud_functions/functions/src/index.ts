import * as admin from "firebase-admin";
import { deleteUser } from "./auth/delete_user";
import { inviteFriendBySMS } from "./invitation/invitation";
import { BirthdayNotifications } from "./scheduled_notifications/birthday/export";
import { AnniversaryNotifications } from "./scheduled_notifications/anniversary/export";
// import { BirthdayNotifications } from "./scheduled_notifications/birthday/export";
import { generateEntryForFollower } from "./triggers/generate_entry_for_follower";
import { syncUserToFollowings } from "./triggers/sync_user_changes";
import { ChristmasNotifications } from "./scheduled_notifications/christmas/exports";
import { ValentinesDayNotifications } from "./scheduled_notifications/valentines/exports";
import { MothersDayNotifications } from "./scheduled_notifications/mothers_day/exports";
import { FathersDayNotifications } from "./scheduled_notifications/fathers_day/exports";
import { WishListNotifications } from "./scheduled_notifications/wish_list/exports";

admin.initializeApp();
// // Start writing functions
// // https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

var bToday=BirthdayNotifications.todayScheduledNotifications;
var bFiveDays=BirthdayNotifications.fiveDaysScheduledNotifications;
var bTwoDays = BirthdayNotifications.twoDayScheduledNotifications;
var bOneWeek = BirthdayNotifications.oneWeekScheduledNotifications;
var bTwoWeeks = BirthdayNotifications.twoWeeksScheduledNotifications;
var bThreeWeeks = BirthdayNotifications.threeWeeksScheduledNotifications;
var bOneMonth = BirthdayNotifications.oneMonthScheduledNotifications;
// var bTwoMonth = BirthdayNotifications.twoMonthsScheduledNotifications;

var vToday = AnniversaryNotifications.todayAnniversaryNotifications;
var vTwoDays = AnniversaryNotifications.twoDaysAnniversaryNotifications;
var vFiveDays = AnniversaryNotifications.fiveDaysAnniversaryNotifications;
var vOneWeek = AnniversaryNotifications.oneWeekAnniversaryNotifications;
var vTwoWeeks = AnniversaryNotifications.twoWeeksAnniversaryNotifications;
var vThreeWeek = AnniversaryNotifications.threeWeeksAnniversaryNotifications;
var vOneMonth = AnniversaryNotifications.oneMonthAnniversaryNotifications;
// var vTwoMonth = AnniversaryNotifications.twoMonthsAnniversaryNotifications;


var cToday=ChristmasNotifications.todayChristmasNotifications;
var cTwoDays=ChristmasNotifications.twoDaysChristmasNotifications;
var cFiveDays=ChristmasNotifications.fiveDaysChristmasNotifications;
var cOneWeek=ChristmasNotifications.oneWeekChristmasNotifications;
var cTwoWeeks=ChristmasNotifications.twoWeeksChristmasNotifications;
var cThreeWeeks=ChristmasNotifications.threeWeeksChristmasNotifications;
var cOneMonth=ChristmasNotifications.oneMonthChristmasNotifications;

var veToday=ValentinesDayNotifications.todayValentinesNotifications;
var veTwoDays=ValentinesDayNotifications.twoDaysValentinesNotifications;
var veFiveDays=ValentinesDayNotifications.fiveDaysValentinesNotifications;
var veOneWeek=ValentinesDayNotifications.oneWeekValentinesNotifications;
var veTwoWeeks=ValentinesDayNotifications.twoWeeksValentinesNotifications;


var mToday=MothersDayNotifications.todayMotherNotification;
var mTwoDays=MothersDayNotifications.twoDaysMotherNotification;
var mFiveDays=MothersDayNotifications.fiveDaysMotherNotification;
var mOneWeek=MothersDayNotifications.oneWeekMotherNotification;
var mTwoWeeks=MothersDayNotifications.twoWeeksMotherNotification;
var mThreeWeeks=MothersDayNotifications.threeWeeksMotherNotification;

var fToday=FathersDayNotifications.todayFatherNotification;
var fTwoDays=FathersDayNotifications.twoDaysFatherNotification;
var fFiveDays=FathersDayNotifications.fiveDaysFatherNotification;
var fOneWeek=FathersDayNotifications.oneWeekFatherNotification;
var fTwoWeeks=FathersDayNotifications.twoWeeksFatherNotification;
var fThreeWeeks=FathersDayNotifications.threeWeeksFatherNotification;


var wishFifteenDays=WishListNotifications.fifteenDaysWishlistNotification;
var wishThirtyDays=WishListNotifications.thirtyDaysWishlistNotification;
var wishFortyFiveDays=WishListNotifications.fortyfiveDaysWishlistNotification;
var wishSixtyDays=WishListNotifications.sixtyDaysWishlistNotification;


export {
    // Birthday Notifications
    bToday,
    bTwoDays,
    bFiveDays,
    bOneWeek,
    bTwoWeeks,
    bThreeWeeks,
    bOneMonth,
    // bTwoMonth,

    // Valentine Notifications
    vToday,
    vTwoDays,
    vFiveDays,
    vOneWeek,
    vTwoWeeks,
    vThreeWeek,
    vOneMonth,
    // vTwoMonth,

    // Christmas Notifications
    cToday,
    cTwoDays,
    cFiveDays,
    cOneWeek,
    cTwoWeeks,
    cThreeWeeks,
    cOneMonth,


    // Valentines Notifications
    veToday,
    veTwoDays,
    veFiveDays,
    veOneWeek,
    veTwoWeeks,

    //mothers day notifications
    mToday,
    mTwoDays,
    mFiveDays,
    mOneWeek,
    mTwoWeeks,
    mThreeWeeks,


    //father days notifications
    fToday,
    fTwoDays,
    fFiveDays,
    fOneWeek,
    fTwoWeeks,
    fThreeWeeks,

    //Wish List notifications
    wishFifteenDays,
    wishThirtyDays,
    wishFortyFiveDays,
    wishSixtyDays,

    // Triggers
    generateEntryForFollower,
    syncUserToFollowings,
    inviteFriendBySMS,
    deleteUser
};

