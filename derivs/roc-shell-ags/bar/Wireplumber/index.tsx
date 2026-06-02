import AstalWp from "gi://AstalWp?version=0.1";
import { createBinding, createEffect, createState } from "gnim";
import { WireplumberPopoverMenu } from "./PopoverMenu";

export const WireplumberAudioControls = () => {
  
  const {default_speaker: speaker} = AstalWp.get_default();

  // State
  const [speakerVolume, setSpeakerVolume] = createState("NULL%");
  
  // Bindings
  const speakerVolumeBind = createBinding(speaker, "volume");
  const speakerMuteBind = createBinding(speaker, "mute");

  createEffect(() => {
    setSpeakerVolume(speakerMuteBind() ? "Muted" : `${Math.floor(speakerVolumeBind() * 100)}%`);
  });

  return (
    <menubutton
      popover={WireplumberPopoverMenu()}
    >
      <label label={speakerVolume} />
    </menubutton>
  );
};
