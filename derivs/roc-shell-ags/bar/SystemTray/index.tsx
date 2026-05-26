import { Gtk } from "ags/gtk4";
import AstalTray from "gi://AstalTray?version=0.1";
import Gio from "gi://Gio?version=2.0";
import GLib from "gi://GLib?version=2.0";
import { createBinding, createState, For, jsx } from "gnim";
import { ImagePopoverMenu } from "./ImgPopoverMenu";

const SysTrayElem = (item: AstalTray.TrayItem) => {
  const elemMenu: Gtk.PopoverMenu = (
    <Gtk.PopoverMenu menuModel={createBinding(item, "menuModel")} />
  ) as Gtk.PopoverMenu;

  const [ imgButton, setImgButton ] = createState(new ImagePopoverMenu());

  function sysTrayBtnInit(btn: ImagePopoverMenu, popover: Gtk.PopoverMenu, sysTrayItem: AstalTray.TrayItem) {
    setImgButton(btn);
    popover.insert_action_group("dbusmenu", sysTrayItem.actionGroup);
    sysTrayItem.connect("notify::action-group", () => {
      popover.insert_action_group("dbusmenu", sysTrayItem.actionGroup)
    });

    btn.popover = popover;
  }

  function leftClick(x: number, y: number) {
    item.activate(x, y);
  }

  function rightClick(img: ImagePopoverMenu) {
    // console.log(`right clicked ${item.title}`);
    elemMenu.popup();
  }

  return (
    <ImagePopoverMenu
      $={(self) => sysTrayBtnInit(self, elemMenu, item)}
      gicon={createBinding(item, "gicon")}
    >
      <Gtk.GestureClick
        button={1}
        onPressed={(_self, _cnt, x, y) => leftClick(x, y)}
      />
      <Gtk.GestureClick
        button={3}
        onPressed={(self) => rightClick(imgButton())}
      />
    </ImagePopoverMenu>
  ) as ImagePopoverMenu;
  //
  // elemMenu.set_parent(outImg);
  //
  // return outImg
};

export const SystemTray = () => {
  const traySingleton = AstalTray.get_default();
  const itemsAccessor = createBinding(traySingleton, "items");

  return (
    <box
      cssClasses={[ "elementFrame" ]}
      orientation={Gtk.Orientation.HORIZONTAL}
      spacing={4}
    >
      <For each={itemsAccessor}>
        {(trayItem: AstalTray.TrayItem) => SysTrayElem(trayItem)}
      </For>
    </box>
  );
}
