import * as functions from "firebase-functions";
import { HttpsError } from "firebase-functions/v1/auth";
import * as twilio from "twilio";

const twilioSid = "AC2324e6babbc64b01b558bcb2078145fa";
const twilioAuthToken = "9f458d49ee47273a61013ca5459f167b";
// const twilioPhoneNumber = "+13393301411";


export const inviteFriendBySMS = functions.https.onCall(async (data, context) => {

    const phone = data["phone"];
    const inviter = data["inviter"];

    const client = twilio(twilioSid, twilioAuthToken);

    if (phone == null) {
        throw new HttpsError("invalid-argument", "No phone number mentioned to invite");
    }
    try {
        const response = await client.messages
            .create({
                body:
                    `${inviter} is on WeGift. Install the app to follow them.`,
                to: phone, // Text this number
                from: "WeGift", // From a valid Twilio number
                "forceDelivery": true,
            })
        functions.logger.info(`${phone} has been successfully notified via sms`)
        functions.logger.info(response);
    } catch (e) {
        functions.logger.error(`Error inviting ${phone}`);
        functions.logger.error(e);
        throw new HttpsError("aborted", `Error sending invitation: ${e}`);
    }
});