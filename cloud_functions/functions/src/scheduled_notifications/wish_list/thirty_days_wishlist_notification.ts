import { firestore } from "firebase-admin";
import * as functions from "firebase-functions";
import {  sendCustomNotification, sendPhoneMessage} from "../reminder_notification";

export const thirtyDaysWishlistNotification = functions
  .runWith({
    memory: "8GB",
    timeoutSeconds: 540,
  })
  .pubsub.schedule("0 0 * * *")
  .onRun(async (context) => {

    const now = new Date();
    now.setDate(now.getDate() + 30);
    const dateAsString=now.getDate()+"-"+(now.getMonth()+1);

    const usersSnapshot = await firestore().collection("users").where("userDetails.dobAsString", "==", dateAsString).get();

    for (const doc of usersSnapshot.docs) {
      const user=doc.data()!;
      await sendCustomNotification(`${user.firstName} how is your wish list coming? Don't forget to share it with your friends so they know what you want.`,user);
      try{
        await sendPhoneMessage(user,`${user.firstName} how is your wish list coming? Don't forget to share it with your friends so they know what you want.`);
      }catch(e){
        functions.logger.error(e);  
      }
      functions.logger.info("Notification sent");
    }
  });
