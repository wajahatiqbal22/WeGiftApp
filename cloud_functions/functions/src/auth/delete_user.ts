import * as functions from "firebase-functions";
import { firestore, auth } from "firebase-admin";

export const deleteUser = functions.https.onCall(async (data, context) => {
  const uid = data["uid"];

  await auth().deleteUser(uid);
  await firestore().collection("username").doc(uid).delete();
  const userRef = firestore().collection("users").doc(uid);
  const followings = await firestore().collection(`users/${uid}/followingUsers`).get();
  const followed = await firestore().collection(`users/${uid}/followedUsers`).get();

  const batch = firestore().batch();
  for (const doc of followings.docs) {
    batch.delete(firestore().collection(`users/${doc.id}/followedUsers`).doc(uid));
  }
  for (const doc of followed.docs) {
    batch.delete(firestore().collection(`users/${doc.id}/followingUsers`).doc(uid));
  }
  await batch.commit();
  await firestore().recursiveDelete(userRef);

});
