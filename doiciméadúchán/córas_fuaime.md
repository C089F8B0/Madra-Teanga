# Córas Fuaime

Baineann an córas fuaime i Madra leas as an bpacáiste Flutter `audioplayers`, comhtháite tríd an gcóras éifeachta Re-Dash.

## Cur i bhFeidhm

Tá an loighic fuaime suite go príomha i `src/madra/feidhmchlár/éifeachtaí.cljd`.

### `madra.feidhmchlár.éifeachtaí/cas-fuaim!`
Is feidhm chabhrach í seo a dhéanann:
1.  Cruthaíonn `AudioPlayer` nua.
2.  Seinneann an cosán sócmhainne sonraithe láithreach.

```clojure
(defn cas-fuaim! [asset-path]
  (doto (audio/AudioPlayer)
    (.play (audio/AssetSource asset-path))))
```

### Láimhseálaí Éifeachta
Cláraímid láimhseálaí fo-iarsma `::play-audio-fx` chun ligean do theagmhais fuaim a sheinm go híon.

```clojure
(s/CláraighÉifeacht
 ::play-audio-fx
 (b/Feidhm [asset-path]
   (cas-fuaim! asset-path)))
```

## Úsáid

Chun fuaim a sheinm ó láimhseálaí teagmhais, filleann tú an éifeacht sa léarscáil teagmhais:

```clojure
(s/CláraighTeagmhasÉifeacht
 ::some-event
 (fn [{:keys [db]} _]
   {:db (assoc db :some-state :new-value)
    :madra.feidhmchlár.éifeachtaí/play-audio-fx "audio/my_sound.mp3"}))
```
