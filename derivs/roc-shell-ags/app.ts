import app from "ags/gtk4/app"
import style from "./style.scss"
import TopBar from "./bar/Bar"

app.start({
  css: style,
  main() {
    app.get_monitors().map(TopBar);
  },
})
