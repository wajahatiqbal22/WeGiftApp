import { firestore } from "firebase-admin";
import * as functions from "firebase-functions";
import * as reminder_notification from "../reminder_notification";

export const fiveDaysChristmasNotifications = functions
  .runWith({
    memory: "8GB",
    timeoutSeconds: 540,
  })
  .pubsub.schedule("0 0 20 12 *")
  .onRun(async (context) => {
    const usersSnapshot = await firestore()
      .collection("users")
      .get();
    for (const doc of usersSnapshot.docs) {
      const user=doc.data()!;
      const notificationSettingsDoc = await firestore().collection("notifications_settings").doc(user.uid).get();
      const notificationSettings = notificationSettingsDoc.data()!;
      const isAllowed = reminder_notification.isAllowedToSendNotification(user, notificationSettings, reminder_notification.PauseFor.christmas, reminder_notification.NotificationFrequency.fiveDays);
      if (!isAllowed) continue;
      await reminder_notification.sendCustomNotification('Only 5 days left until Christmas! Find perfect presents with WeGift.',user);
      try{
        await reminder_notification.sendPhoneMessage(user,'Only 5 days left until Christmas! Find perfect presents with WeGift.');
      }catch(e){
        functions.logger.error(e);  
      }
      functions.logger.info("Notification sent");
    }
  });
