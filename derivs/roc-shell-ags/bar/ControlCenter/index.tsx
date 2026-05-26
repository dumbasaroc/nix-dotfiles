import { ControlCenterPopover } from "./ControlCenterPopover";
import { BatteryIndicator } from "./BatteryIndicator";
import { Gtk } from "ags/gtk4";

export const ControlCenter = () => {

    return (
      <menubutton
        popover={ControlCenterPopover()}
      >
        {BatteryIndicator()}
      </menubutton>
    )
};
