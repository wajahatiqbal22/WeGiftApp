import { firestore } from "firebase-admin";
import * as functions from "firebase-functions";
import {  isAllowedToSendNotification, NotificationFrequency, PauseFor, sendCustomNotification, sendPhoneMessage} from "../reminder_notification";
export const oneWeekFatherNotification = functions
  .runWith({
    memory: "8GB",
    timeoutSeconds: 540,
  })
  .pubsub.schedule("0 0 11 06 *")
  .onRun(async (context) => {
    const usersSnapshot = await firestore()
      .collection("users")
      .get();
    for (const doc of usersSnapshot.docs) {
      const user=doc.data()!;
      const notificationSettingsDoc = await firestore().collection("notifications_settings").doc(user.uid).get();
      const notificationSettings = notificationSettingsDoc.data()!;
      const isAllowed = isAllowedToSendNotification(user, notificationSettings, PauseFor.fathersDay, NotificationFrequency.oneWeek);
      if (!isAllowed) continue;
      await sendCustomNotification(`Just one week left until Father's Day! Explore our gift ideas to make it a memorable celebration.`,user);
      try{
        await sendPhoneMessage(user,`Just one week left until Father's Day! Explore our gift ideas to make it a memorable celebration.`);
      }catch(e){
        functions.logger.error(e);  
      }
      functions.logger.info("Notification sent");
    }
  });
