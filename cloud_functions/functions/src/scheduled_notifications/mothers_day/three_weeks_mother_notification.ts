import { firestore } from "firebase-admin";
import * as functions from "firebase-functions";
import {  isAllowedToSendNotification, NotificationFrequency, PauseFor, sendCustomNotification, sendPhoneMessage} from "../reminder_notification";

export const threeWeeksMotherNotification = functions
  .runWith({
    memory: "8GB",
    timeoutSeconds: 540,
  })
  .pubsub.schedule("0 0 23 04 *")
  .onRun(async (context) => {
    const usersSnapshot = await firestore()
      .collection("users")
      .get();
    for (const doc of usersSnapshot.docs) {
      const user=doc.data()!;
      const notificationSettingsDoc = await firestore().collection("notifications_settings").doc(user.uid).get();
      const notificationSettings = notificationSettingsDoc.data()!;
      const isAllowed = isAllowedToSendNotification(user, notificationSettings, PauseFor.mothersDay, NotificationFrequency.threeWeeks);
      if (!isAllowed) continue;
      await sendCustomNotification(`Mother's Day is just 3 weeks away! Start planning something special for your Mom.`,user);
      try{
        await sendPhoneMessage(user,`Mother's Day is just 3 weeks away! Start planning something special for your Mom.`);
      }catch(e){
        functions.logger.error(e);  
      }
      functions.logger.info("Notification sent");
    }
  });
