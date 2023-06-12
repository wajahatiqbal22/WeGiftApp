import { firestore } from "firebase-admin";
import * as functions from "firebase-functions";
import {  sendCustomNotification, sendPhoneMessage} from "../reminder_notification";

export const fortyfiveDaysWishlistNotification = functions
  .runWith({
    memory: "8GB",
    timeoutSeconds: 540,
  })
  .pubsub.schedule("0 0 * * *")
  .onRun(async (context) => {

    const now = new Date();
    now.setDate(now.getDate() + 45);
    const dateAsString=now.getDate()+"-"+(now.getMonth()+1);

    const usersSnapshot = await firestore().collection("users").where("userDetails.dobAsString", "==", dateAsString).get();

    for (const doc of usersSnapshot.docs) {
      const user=doc.data()!;
      await sendCustomNotification(`${user.firstName} Kelby your birthday is coming up! Don't forget to build out your wish list.`,user);
      try{
        await sendPhoneMessage(user,`${user.firstName} Kelby your birthday is coming up! Don't forget to build out your wish list.`);
      }catch(e){
        functions.logger.error(e);  
      }
      functions.logger.info("Notification sent");
    }
  });
