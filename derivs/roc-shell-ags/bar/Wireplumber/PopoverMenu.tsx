import { Astal, Gtk } from "ags/gtk4";
import { jsx } from "ags/gtk4/jsx-runtime";

export const WireplumberPopoverMenu = () => {

  // Have to program it this way because JSX
  // doesn't support the layout property for
  // buildables yet.
  const grid = new Gtk.Grid();
  
  const audioSlider = jsx(Astal.Slider, {
    value: 0.5,
    min: 0,
    max: 1,
    orientation: Gtk.Orientation.VERTICAL,
    heightRequest: 500,
    widthRequest: 500
  });
  const audioSlider2 = jsx(Astal.Slider, {
    value: 0.5,
    min: 0,
    max: 1,
    orientation: Gtk.Orientation.VERTICAL,
    heightRequest: 500,
    widthRequest: 500
  });


  grid.attach(audioSlider, 0, 0, 1, 1);
  grid.attach(audioSlider2, 1, 1, 1, 1);

  return (
    <popover
      hasArrow={false}
    >
      {grid}
    </popover>
  ) as Gtk.Popover;
};
