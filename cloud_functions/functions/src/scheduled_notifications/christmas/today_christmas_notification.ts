import { firestore } from "firebase-admin";
import * as functions from "firebase-functions";
import {  isAllowedToSendNotification, NotificationFrequency, PauseFor, sendCustomNotification, sendPhoneMessage} from "../reminder_notification";

export const todayChristmasNotifications = functions
  .runWith({
    memory: "8GB",
    timeoutSeconds: 540,
  })
  .pubsub.schedule("0 0 25 12 *")
  .onRun(async (context) => {
    const usersSnapshot = await firestore()
      .collection("users")
      .get();
    for (const doc of usersSnapshot.docs) {
      const user=doc.data()!;
      const notificationSettingsDoc = await firestore().collection("notifications_settings").doc(user.uid).get();
      const notificationSettings = notificationSettingsDoc.data()!;
      const isAllowed = isAllowedToSendNotification(user, notificationSettings, PauseFor.christmas, NotificationFrequency.sameDay);
      if (!isAllowed) continue;
      await sendCustomNotification('Merry Christmas! Wishing you love, joy, and memorable moments with your loved ones.',user,"Merry Christmas");
      try{
        await sendPhoneMessage(user,'Merry Christmas! Wishing you love, joy, and memorable moments with your loved ones.');
      }catch(e){
        functions.logger.error(e);  
      }
      
      functions.logger.info("Notification sent");
    }
  });
