import { Gtk } from "ags/gtk4";
import { execAsync } from "ags/process";
import { createState } from "gnim";

function logoffClicked() {
  execAsync("niri msg action quit -s");
}

function shutdownClicked() {
  execAsync("systemctl poweroff");
}

function restartClicked() {
  execAsync("systemctl reboot");
}

const PoweroffDropdown: () => Gtk.Box = () => {
  const [ showPowerButtons, setShowPowerButtons ] = createState(false);

  return (
    <box
      orientation={Gtk.Orientation.VERTICAL}
      spacing={3}
    >
      <button onClicked={() => {setShowPowerButtons(!showPowerButtons())}}>
        <label label="Power Options" />
      </button>
      <revealer
        revealChild={showPowerButtons}
      >
        <box orientation={Gtk.Orientation.VERTICAL}>

          {
            // === LOG OFF === //
          }
          <button onClicked={logoffClicked}>
            <box
              orientation={Gtk.Orientation.HORIZONTAL}
              spacing={6}
            >
              <image iconName="system-log-out-symbolic" heightRequest={16}/>
              <label label="Log Off" hexpand={true} />
            </box>
          </button>

          {
            // === RESTART === //
          }
          <button onClicked={restartClicked}>
            <box
              orientation={Gtk.Orientation.HORIZONTAL}
              spacing={6}
            >
              <image iconName="system-reboot-symbolic" heightRequest={16}/>
              <label label="Restart" hexpand={true} />
            </box>
          </button>

          {
            // === SHUTDOWN === //
          }
          <button onClicked={shutdownClicked}>
            <box
              orientation={Gtk.Orientation.HORIZONTAL}
              spacing={6}
            >
              <image iconName="system-shutdown-symbolic" heightRequest={16}/>
              <label label="Shut Down" hexpand={true} />
            </box>
          </button>
        </box>
      </revealer>
    </box>
  ) as Gtk.Box
};

export const ControlCenterPopover: () => Gtk.Popover = () => {
  return (
    <popover
      hasArrow={false}
    >
      {PoweroffDropdown()}
    </popover>
  ) as Gtk.Popover
};
