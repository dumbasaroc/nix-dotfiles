import Gtk from "gi://Gtk"
import AstalBattery from "gi://AstalBattery?version=0.1";
import { createBinding, createConnection, createEffect, createState } from "gnim";

const BATTERY_ICON_CUTOFFS: {percentage: number, icon :string}[] = [
  {percentage: 95, icon: "battery-100"},
  {percentage: 85, icon: "battery-090"},
  {percentage: 75, icon: "battery-080"},
  {percentage: 65, icon: "battery-070"},
  {percentage: 55, icon: "battery-060"},
  {percentage: 45, icon: "battery-050"},
  {percentage: 35, icon: "battery-040"},
  {percentage: 25, icon: "battery-030"},
  {percentage: 15, icon: "battery-020"},
  {percentage: 5, icon: "battery-010"},
  {percentage: 0, icon: "battery-000"},
];

const CHARGING_SUFFIX: string = "-charging";

export const BatteryIndicator = () => {

  const battery = AstalBattery.get_default();
  const [shownIcon, setShownIcon] = createState("battery-000");

  const percentageText = createBinding(battery, "percentage")(
    (p) => `Current Charge: ${Math.round(p * 100)}%`
  );
  const [shownPercentageText, updShownPercentageText] = createState("0%");

  const percentageIcon = createBinding(battery, "percentage")(
    (p) => {
      let ptg = p * 100;
      for (const cutoff of BATTERY_ICON_CUTOFFS) {
        if (ptg >= cutoff.percentage) {
          return cutoff.icon;
        }
      }
      return BATTERY_ICON_CUTOFFS.at(-1)?.icon;
    }
  );

  const iconSuffix = createBinding(battery, "charging")(
    (isCharging) => isCharging ? CHARGING_SUFFIX : ""
  );

  createEffect(() => {
    setShownIcon(`${percentageIcon()}${iconSuffix()}`);
  });
  
  return (
    <Gtk.Image
      iconName={shownIcon}
      tooltipText={percentageText}
    >
    </Gtk.Image>
  );
};
