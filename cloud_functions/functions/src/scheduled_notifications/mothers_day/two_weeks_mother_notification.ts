import { firestore } from "firebase-admin";
import * as functions from "firebase-functions";
import {  isAllowedToSendNotification, NotificationFrequency, PauseFor, sendCustomNotification, sendPhoneMessage} from "../reminder_notification";

export const twoWeeksMotherNotification = functions
  .runWith({
    memory: "8GB",
    timeoutSeconds: 540,
  })
  .pubsub.schedule("0 0 30 04 *")
  .onRun(async (context) => {
    const usersSnapshot = await firestore()
      .collection("users")
      .get();
    for (const doc of usersSnapshot.docs) {
      const user=doc.data()!;
      const notificationSettingsDoc = await firestore().collection("notifications_settings").doc(user.uid).get();
      const notificationSettings = notificationSettingsDoc.data()!;
      const isAllowed = isAllowedToSendNotification(user, notificationSettings, PauseFor.mothersDay, NotificationFrequency.twoWeeks);
      if (!isAllowed) continue;
      await sendCustomNotification(`Only 2 weeks left until Mother's Day! Find the perfect gift to show your appreciation`,user);
      try{
        await sendPhoneMessage(user,`Only 2 weeks left until Mother's Day! Find the perfect gift to show your appreciation`);
      }catch(e){
        functions.logger.error(e);  
      }
      functions.logger.info("Notification sent");
    }
  });
