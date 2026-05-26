import { createPoll } from "ags/time"

export const ClockWidget = () => {
  const timePoll = createPoll(
    "Time Not Specified",
    500,
    [ "date" ]
  );

  return (
    <label
      label={timePoll}
    />
  );
}
