import { Gtk } from "ags/gtk4";
import { getter, register, setter } from "gnim/gobject";

@register({ GTypeName: "ImagePopoverMenu" })
export class ImagePopoverMenu extends Gtk.Image {
  #popover = new Gtk.PopoverMenu();
  
  @getter(Gtk.PopoverMenu)
  get popover() {
    return this.#popover;
  }

  @setter(Gtk.PopoverMenu)
  set popover(newPopover: Gtk.PopoverMenu) {
    if (newPopover !== this.#popover) {
      this.#popover.unparent();
      newPopover.set_parent(this);
      this.#popover = newPopover;
      this.notify("popover");
    }
  }
};
