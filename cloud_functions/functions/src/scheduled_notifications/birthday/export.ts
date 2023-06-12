import { twoDayScheduledNotifications } from "./two_day_birthday_notification";
import { fiveDayScheduledNotifications } from "./five_day_birthday_notification";
import { oneMonthScheduledNotifications } from "./one_month_birthday_notification";
import { oneWeekScheduledNotifications } from "./one_week_birthday_notification";
import { threeWeeksScheduledNotifications } from "./three_weeks_birthday_notification";
import { todayScheduledNotifications } from "./today_birthday_notification";
import { twoMonthsScheduledNotifications } from "./two_months_birthday_notification";
import { twoWeeksScheduledNotifications } from "./two_weeks_birthday_notifications";

export class BirthdayNotifications {
    static twoDayScheduledNotifications = twoDayScheduledNotifications;
    static oneMonthScheduledNotifications = oneMonthScheduledNotifications;
    static oneWeekScheduledNotifications = oneWeekScheduledNotifications;
    static threeWeeksScheduledNotifications = threeWeeksScheduledNotifications;
    static twoMonthsScheduledNotifications = twoMonthsScheduledNotifications;
    static todayScheduledNotifications=todayScheduledNotifications;
    static fiveDaysScheduledNotifications=fiveDayScheduledNotifications;
    static twoWeeksScheduledNotifications=twoWeeksScheduledNotifications;
}