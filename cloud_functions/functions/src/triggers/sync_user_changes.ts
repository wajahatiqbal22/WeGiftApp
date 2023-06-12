import * as admin from "firebase-admin";
import * as functions from "firebase-functions";


export const syncUserToFollowings = functions.firestore.document("users/{userId}")
    .onWrite(async (change, context) => {

        const userId = context.params.userId;


        const user = change.after.data();


        const followings = await admin.firestore().collection("users").doc(userId).collection("followingUsers").get();



        for (const followingDoc of followings.docs) {

            if (user == null) {

                await admin.firestore().collection("users").doc(followingDoc.id).collection("followedUsers").doc(userId).delete();
            } else {
                await admin.firestore().collection("users").doc(followingDoc.id).collection("followedUsers").doc(userId).set(user);

            }
        }
    });