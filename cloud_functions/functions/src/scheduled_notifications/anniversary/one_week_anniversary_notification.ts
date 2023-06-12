import { firestore } from "firebase-admin";
import * as functions from "firebase-functions";
import {  isAllowedToSendNotification, NotificationFrequency, PauseFor, sendCustomNotification, sendPhoneMessage } from "../reminder_notification";

export const oneWeekAnniversaryNotifications = functions.runWith({
    "memory": "8GB",
    "timeoutSeconds": 540
}).pubsub
    .schedule("0 0 * * *")
    .onRun(async (context) => {

        const now = new Date();
            
        now.setDate(now.getDate() + 7);
        const aniversaryAsString=now.getDate()+"-"+(now.getMonth()+1);
        functions.logger.info(aniversaryAsString);

        const usersSnapshot = await firestore().collection("users").where("userDetails.aniversaryAsString", "==", aniversaryAsString).get();
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
                        const isAllowed = isAllowedToSendNotification(user, notificationSettings, PauseFor.anniversary, NotificationFrequency.oneWeek);
                        functions.logger.warn(`Is allowed to send notification? ${isAllowed}`)
                        if (!isAllowed) continue;

                        functions.logger.info(`Allowed Notification to be sent for ${followingDoc.data().firstName}!`)
                        const following = followingDoc.data();
                        await sendCustomNotification(`One week until ${user.firstName}'s Anniversary! Celebrate by letting us help you with all your gifting needs! `,following);
                        try{
                            await sendPhoneMessage(following,`One week until ${user.firstName}'s Anniversary! Celebrate by letting us help you with all your gifting needs! `);
                          }catch(e){
                            functions.logger.error(e);  
                          }
                        // await sendReminderNotification(user, following, "Anniversary", "One week");
                        functions.logger.info("Notification sent");
                    }
                }
            }
    });

