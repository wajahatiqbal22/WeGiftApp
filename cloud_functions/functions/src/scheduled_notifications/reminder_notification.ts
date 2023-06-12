import { firestore, messaging } from "firebase-admin";
import * as functions from "firebase-functions";
import { HttpsError } from "firebase-functions/v1/auth";
import * as twilio from "twilio";

export async function sendReminderNotification(user: firestore.DocumentData, following: firestore.DocumentData, event: string, frequency: string) {

    const { firstName } = user;

    const { fcmToken, uid } = following;

    // Notificatoin Titles, Description and Settings
    const notificationTitle: string = `Heads up!`;
    const description: string = `${firstName} has ${event} coming up in ${frequency}. Buy them a gift!`;

    // Gets all documents where the isNew field is true to update the badge Number
    const notificationsQuery = await firestore().collection('users').doc(uid).collection('notifications').where('isNew', '==', true).get();


    // Badge count is based on the number of new Notifications of the Initiator
    const badgeCount = (notificationsQuery.docs.length) + 1;


    //Creates payload to be sent in notification
    const payload: messaging.MessagingPayload = {
        notification: {
            
            title: notificationTitle,
            body: description,
            click_action: "FLUTTER_NOTIFICATION_CLICK",
            sound: "default",
            badge: `${badgeCount}`
        },
        data: {
            "title": notificationTitle,
            "description": description,
        }
    };

    // A high priority notification
    const options: messaging.MessagingOptions = {
        priority: "high"
    };


    // Sends notification to initiator's FCM token with payload and priority
    return messaging().sendToDevice(String(fcmToken), payload, options).then(async (response) => {

        functions.logger.info('Successfully sent notification to: ' + uid + " with messageId: " + response);

        await firestore().collection('users').doc(uid).collection('notifications').add({
            "dateReceived": new Date(Date.now()),
            "description": description,
            "isNew": true,
            "title": notificationTitle,
        });

    }).catch(e => {
        functions.logger.error('Error sending notification to user: ' + uid);
        functions.logger.error(e)
    });
}


export async function sendCustomNotification(msg: string, user: firestore.DocumentData,title?:string) {

    

    const { fcmToken, uid } = user;

    // Notificatoin Titles, Description and Settings
    const notificationTitle: string = title ?? `Heads up!`;
    const description: string = msg;

    // Gets all documents where the isNew field is true to update the badge Number
    const notificationsQuery = await firestore().collection('users').doc(uid).collection('notifications').where('isNew', '==', true).get();


    // Badge count is based on the number of new Notifications of the Initiator
    const badgeCount = (notificationsQuery.docs.length) + 1;


    //Creates payload to be sent in notification
    const payload: messaging.MessagingPayload = {
        notification: {
            
            title: notificationTitle,
            body: description,
            click_action: "FLUTTER_NOTIFICATION_CLICK",
            sound: "default",
            badge: `${badgeCount}`
        },
        data: {
            "title": notificationTitle,
            "description": description,
        }
    };

    // A high priority notification
    const options: messaging.MessagingOptions = {
        priority: "high"
    };


    // Sends notification to initiator's FCM token with payload and priority
    return messaging().sendToDevice(String(fcmToken), payload, options).then(async (response) => {

        functions.logger.info('Successfully sent notification to: ' + uid + " with messageId: " + response);

        await firestore().collection('users').doc(uid).collection('notifications').add({
            "dateReceived": new Date(Date.now()),
            "description": description,
            "isNew": true,
            "title": notificationTitle,
        });

    }).catch(e => {
        functions.logger.error('Error sending notification to user: ' + uid);
        functions.logger.error(e)
    });
}


export class NotificationFrequency {
    static sameDay: string = "sameDay";
    static twoDay: string = "twoDay";
    static fiveDays: string = "fiveDays";
    static oneWeek: string = "oneWeek";
    static twoWeeks: string = "twoWeeks";
    static threeWeeks: string = "threeWeeks";
    static oneMonth: string = "oneMonth";
}

export class PauseFor {
    static birthday: string = "birthday";
    static anniversary: string = "anniversary";
    static christmas: string = "christmas";
    static email: string = "email";
    static fathersDay: string = "fathersDay";
    static mothersDay: string = "mothersDay";
    static push: string = "push";
    static textMessage: string = "textMessage";
    static valentines: string = "valentines";
}

export class Duration {
    static oneDay: number = 1;
    static oneMonth: number = 30;
    static oneWeek: number = 7;
    static threeWeeks: number = 21;
    static twoMonths: number = 60;

}

export function isAllowedToSendNotification(user: firestore.DocumentData, notificationSettings: firestore.DocumentData, type: string, freq: string): boolean {
    var shouldSendNotification: boolean = true;
    const { frequency, pauseFor } = notificationSettings;

    if (frequency == null) {
        shouldSendNotification = true;
    } else if (frequency[type]!=null && frequency[type][freq] != null && frequency[type][freq] == false) {
        shouldSendNotification = false;
    }

    const pauseForKeys = Object.keys(pauseFor ?? {});

    // checks if notifications are not paused for the user.
    if (pauseForKeys.includes(user.uid)) {
        if (pauseFor[user.uid][type] != null && pauseFor[user.uid][type] == false) {
            shouldSendNotification = true;
        }else{
            shouldSendNotification=false;
        }
    }

    return shouldSendNotification;
}


const twilioSid = "AC2324e6babbc64b01b558bcb2078145fa";
const twilioAuthToken = "9f458d49ee47273a61013ca5459f167b";

export async function sendPhoneMessage(user: firestore.DocumentData, msg: string) {
   const phone=user.phoneNumber;
   const client = twilio(twilioSid, twilioAuthToken);
   if (phone == null) {
    throw new HttpsError("invalid-argument", "No phone number mentioned to invite");
    }
    try {
        const response = await client.messages
            .create({
                body:
                    `WeGift\n\n${msg}`,
                to: phone, // Text this number
                from: "+13393301411",
                // "WeGift", // From a valid Twilio number
                "forceDelivery": true,
            })
        functions.logger.info(`${phone} has been successfully notified via sms`)
        functions.logger.info(response);
    } catch (e) {
        functions.logger.error(`Error inviting ${phone}`);
        functions.logger.error(e);
        throw new HttpsError("aborted", `Error sending invitation: ${e}`);
    }
}

