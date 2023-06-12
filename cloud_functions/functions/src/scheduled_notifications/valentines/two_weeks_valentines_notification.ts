import { firestore } from "firebase-admin";
import * as functions from "firebase-functions";
import {  isAllowedToSendNotification, NotificationFrequency, PauseFor, sendCustomNotification, sendPhoneMessage} from "../reminder_notification";

export const twoWeeksValentinesNotifications = functions
  .runWith({
    memory: "8GB",
    timeoutSeconds: 540,
  })
  .pubsub.schedule("0 0 31 01 *")
  .onRun(async (context) => {
    const usersSnapshot = await firestore()
      .collection("users")
      .get();
    for (const doc of usersSnapshot.docs) {
      const user=doc.data()!;
      const notificationSettingsDoc = await firestore().collection("notifications_settings").doc(user.uid).get();
      const notificationSettings = notificationSettingsDoc.data()!;
      const isAllowed = isAllowedToSendNotification(user, notificationSettings, PauseFor.valentines, NotificationFrequency.twoWeeks);
      if (!isAllowed) continue;
      await sendCustomNotification(`Don't forget It is Valentine's Day is coming up this month.`,user);
      try{
        await sendPhoneMessage(user,`Don't forget It is Valentine's Day is coming up this month.`);
      }catch(e){
        functions.logger.error(e);  
      }
      functions.logger.info("Notification sent");
    }
  });
