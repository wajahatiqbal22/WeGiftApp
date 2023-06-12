import { firestore } from "firebase-admin";
import * as functions from "firebase-functions";
import {  sendCustomNotification} from "../reminder_notification";
import * as reminder_notification from "../reminder_notification";

export const oneWeekChristmasNotifications = functions
  .runWith({
    memory: "8GB",
    timeoutSeconds: 540,
  })
  .pubsub.schedule("0 0 18 12 *")
  .onRun(async (context) => {
    const usersSnapshot = await firestore()
      .collection("users")
      .get();
    for (const doc of usersSnapshot.docs) {
      const user=doc.data()!;
      const notificationSettingsDoc = await firestore().collection("notifications_settings").doc(user.uid).get();
      const notificationSettings = notificationSettingsDoc.data()!;
      const isAllowed = reminder_notification.isAllowedToSendNotification(user, notificationSettings, reminder_notification.PauseFor.christmas, reminder_notification.NotificationFrequency.oneWeek);
      if (!isAllowed) continue;
      await sendCustomNotification('Just one week left until Christmas! Make it extra special with our suggestions.',user);
      try{
        await reminder_notification.sendPhoneMessage(user,'Just one week left until Christmas! Make it extra special with our suggestions.');
      }catch(e){
        functions.logger.error(e);  
      }
      functions.logger.info("Notification sent");
    }
  });
