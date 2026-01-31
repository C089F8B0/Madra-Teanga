# Audio System

The audio system in Madra utilizes the `audioplayers` Flutter package, integrated via the Re-Dash effect system.

## Implementation

The audio logic is primarily contained in `src/madra/app/effects.cljd`.

### `madra.app.effects/play-audio!`
This is a helper function that:
1.  Instantiates a new `AudioPlayer`.
2.  Plays the specified asset path immediately.

```clojure
(defn play-audio! [asset-path]
  (doto (audio/AudioPlayer)
    (.play (audio/AssetSource asset-path))))
```

### Effect Handler
We register a side effect handler `::play-audio-fx` to allow events to trigger audio playback purely.

```clojure
(rd/reg-fx
 ::play-audio-fx
 (fn [asset-path]
   (play-audio! asset-path)))
```

## Usage

To play audio from an event handler, you return the effect in the event map:

```clojure
(rd/reg-event-fx
 ::some-event
 (fn [{:keys [db]} _]
   {:db (assoc db :some-state :new-value)
    :madra.app.effects/play-audio-fx "audio/my_sound.mp3"}))
```
