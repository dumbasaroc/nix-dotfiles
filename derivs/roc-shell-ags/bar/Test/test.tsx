// A Test Widget to stick into a bar

import { Gtk } from "ags/gtk4";
import AstalBattery from "gi://AstalBattery";
import { createBinding } from "gnim";


const TestWidget = () => {
  const batteryObj = AstalBattery.get_default();
  const percentage = createBinding(batteryObj, "percentage")(
    (perc) => `${Math.round(perc * 100)}%`
  );
  const isCharging = createBinding(batteryObj, "charging");

  return (
    <box
      orientation={Gtk.Orientation.VERTICAL}
      halign={Gtk.Align.CENTER}
      valign={Gtk.Align.CENTER}
    >
      <label
        $type="center"
        justify={Gtk.Justification.CENTER}
        label={`Current Battery Percentage: ${percentage()}`}
      />
      <label
        $type="center"
        justify={Gtk.Justification.CENTER}
        label={`Is Charging?: ${isCharging()}`}
      />
    </box>
  );
};

const TestWidgetWindow = () => (
  <Gtk.Popover
    cssClasses={["TestWidgetWindow", "popup_menu"]}
    widthRequest={400}
    heightRequest={200}
    hasArrow={false}
  >
    <box>
      {TestWidget()}
    </box>
  </Gtk.Popover>
)

export {
  TestWidgetWindow,
}
