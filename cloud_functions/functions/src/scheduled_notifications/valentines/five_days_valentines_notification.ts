import { firestore } from "firebase-admin";
import * as functions from "firebase-functions";
import {  isAllowedToSendNotification, NotificationFrequency, PauseFor, sendCustomNotification, sendPhoneMessage} from "../reminder_notification";
export const fiveDaysValentinesNotifications = functions
  .runWith({
    memory: "8GB",
    timeoutSeconds: 540,
  })
  .pubsub.schedule("0 0 09 02 *")
  .onRun(async (context) => {
    const usersSnapshot = await firestore()
      .collection("users")
      .get();
    for (const doc of usersSnapshot.docs) {
      const user=doc.data()!;
      const notificationSettingsDoc = await firestore().collection("notifications_settings").doc(user.uid).get();
      const notificationSettings = notificationSettingsDoc.data()!;
      const isAllowed = isAllowedToSendNotification(user, notificationSettings, PauseFor.valentines, NotificationFrequency.fiveDays);
      if (!isAllowed) continue;
      await sendCustomNotification(`Celebrate by using Wegift to find the perfect Valentine's present! `,user);
      try{
        await sendPhoneMessage(user,`Celebrate by using Wegift to find the perfect Valentine's present! `);
      }catch(e){
        functions.logger.error(e);  
      }
      functions.logger.info("Notification sent");
    }
  });
