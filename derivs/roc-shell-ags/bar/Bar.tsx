import app from "ags/gtk4/app"
import { createBinding } from "gnim"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { createPoll } from "ags/time"
import Tray from "gi://AstalTray"
import { ControlCenter } from "./ControlCenter"
import { ClockWidget } from "./Widgets/Clock"
import { SystemTray } from "./SystemTray"

export default function TopBar(gdkmonitor: Gdk.Monitor) {
  const time = createPoll("", 1000, "date")
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

  // const tray = Tray.get_default();
  // const items = createBinding(tray, "items");


          // <For each={items}>
          //   {(trayItem) => (
          //     <image gicon={createBinding(trayItem, "gicon")} />
          //   )}
          // </For>

  return (
    <window
      visible
      namespace="roc-topbar"
      name="bar"
      class="TopBar"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={app}
    >
      <centerbox cssName="centerbox">
        <box $type="center">
          {ClockWidget()}
        </box>
        <box
          cssClasses={[ "widgetContainer" ]}
          spacing={10}
          $type="end"
        >
          {SystemTray()}
          {ControlCenter()}
        </box>
      </centerbox>
    </window>
  )
}
