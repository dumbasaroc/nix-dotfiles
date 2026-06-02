import app from "ags/gtk4/app"
import { Astal, Gdk } from "ags/gtk4"
import { ControlCenter } from "./ControlCenter"
import { ClockWidget } from "./Widgets/Clock"
import { SystemTray } from "./SystemTray"
import { WireplumberAudioControls } from "./Wireplumber"

export default function TopBar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

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
          {WireplumberAudioControls()}
          {SystemTray()}
          {ControlCenter()}
        </box>
      </centerbox>
    </window>
  )
}
