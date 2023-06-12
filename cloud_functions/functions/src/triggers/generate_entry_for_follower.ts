import * as admin from "firebase-admin";
import { firestore } from "firebase-admin";
import * as functions from "firebase-functions";


export const generateEntryForFollower = functions.firestore
    .document('users/{userId}/followedUsers/{followedUserId}')
    .onCreate(async (change, context) => {

        const userId = context.params.userId;
        const followedUser = change.data()!;

        const userDoc = await firestore().collection("users").doc(userId).get();

        const user = userDoc.data()!;

        await sendNotificationToFollowedUser(user, followedUser);
        await firestore().collection("followers_data").add({
            "follower": user.uid,
            "following": followedUser.uid,
            "createdAt": new Date(),
        });
    });


async function sendNotificationToFollowedUser(user: firestore.DocumentData, followedUser: firestore.DocumentData) {
    admin.messaging()

    const { firstName } = user;

    const { fcmToken, uid } = followedUser;


    if (fcmToken === null || typeof fcmToken === 'undefined') {
        functions.logger.warn('Push token for user: ' + uid + " is undefined!");
        return;
    }

    // Notificatoin Titles, Description and Settings
    const notificationTitle: string = 'You are being followed!';
    const description: string = `${firstName} has started following you.`;



    // Gets all documents where the isNew field is true to update the badge Number
    const notificationsQuery = await firestore().collection('users').doc(uid).collection('notifications').where('isNew', '==', true).get();


    // Badge count is based on the number of new Notifications of the Initiator
    const badgeCount = (notificationsQuery.docs.length) + 1;


    //Creates payload to be sent in notification
    const payload: admin.messaging.MessagingPayload = {
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
    const options: admin.messaging.MessagingOptions = {
        priority: "high"
    };

    // Sends notification to initiator's FCM token with payload and priority
    return admin.messaging().sendToDevice(String(fcmToken), payload, options).then(async (response) => {

        functions.logger.info('Successfully sent notification to: ' + uid + " with messageId: " + response);

        await admin.firestore().collection('users').doc(uid).collection('notifications').add({
            "dateReceived": new Date(Date.now()),
            "description": description,
            "isNew": true,
            "title": notificationTitle,
        });

    }).catch(e => {
        functions.logger.error('Error sending notification to user: ' + uid);

        functions.logger.error(e);
    });
}

