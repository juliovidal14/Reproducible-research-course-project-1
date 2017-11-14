sum(is.na(activity$steps))

imputed_steps <- average_daily_activity$mean[match(activity$interval, average_daily_activity$interval)]

activity_imputed <- transform(activity, steps = ifelse(is.na(activity$steps), yes = imputed_steps, no = activity$steps))
total_steps_imputed <- aggregate(steps ~ date, activity_imputed, sum)
names(total_steps_imputed) <- c("date", "daily_steps")

hist(total_steps_imputed$daily_steps, col = "darkblue", xlab = "Total steps per day", ylim = c(0,30), main = "Total number of steps taken each day", breaks = seq(0,25000,by=2500))

mean(total_steps_imputed$daily_steps)

median(total_steps_imputed$daily_steps)

