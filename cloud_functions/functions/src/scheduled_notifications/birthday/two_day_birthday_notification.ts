import { firestore } from "firebase-admin";
import * as functions from "firebase-functions";
import {  isAllowedToSendNotification, NotificationFrequency, PauseFor, sendCustomNotification, sendPhoneMessage } from "../reminder_notification";

export const twoDayScheduledNotifications = functions.runWith({
    "memory": "8GB",
    "timeoutSeconds": 540
}).pubsub
    .schedule("0 0 * * *")
    .onRun(async (context) => {
        try {

            const now = new Date();
            
            now.setDate(now.getDate() + 2);
            const dateAsString=now.getDate()+"-"+(now.getMonth()+1);
            functions.logger.info(dateAsString);
            // const start = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 0, 0);
            // const end = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 23, 59);

            const usersSnapshot = await firestore().collection("users").where("userDetails.dobAsString", "==", dateAsString).get();
            functions.logger.info(usersSnapshot.docs);

            for (const doc of usersSnapshot.docs) {
                const user = doc.data()!;
                functions.logger.info(`User iteration started. Current user: ${user.firstName}`)
                const followings = await firestore().collection("users").doc(doc.id).collection("followingUsers").get();
                for (const followingDoc of followings.docs) {
                    functions.logger.warn(`Followings have started to iterate. Current Following user: ${followingDoc.data().firstName}`)
                    const notificationSettingsDoc = await firestore().collection("notifications_settings").doc(followingDoc.id).get();

                    if (notificationSettingsDoc.exists) {
                        functions.logger.warn("Notification settings doc does exist. Aborting!");
                        const notificationSettings = notificationSettingsDoc.data()!;
                        const isAllowed = isAllowedToSendNotification(user, notificationSettings, PauseFor.birthday, NotificationFrequency.twoDay);
                        functions.logger.warn(`Is allowed to send notification? ${isAllowed}`)
                        if (!isAllowed) continue;

                        functions.logger.info(`Allowed Notification to be sent for ${followingDoc.data().firstName}!`)
                        const following = followingDoc.data();
                        // await sendReminderNotification(user, following, "Birthday", "One Day");
                        await sendCustomNotification(`The big day is two days out! This is a final reminder to make ${user.firstName}'s birthday the best one yet, with help from WeGift!`,following);
                        try{
                            await sendPhoneMessage(following,`The big day is two days out! This is a final reminder to make ${user.firstName}'s birthday the best one yet, with help from WeGift!`);
                          }catch(e){
                            functions.logger.error(e);  
                          }
                        functions.logger.info("Notification sent");
                    }
                }
            }
        } catch (e) {
            functions.logger.error("Error with notification");
            functions.logger.error(e)
        }

    });

