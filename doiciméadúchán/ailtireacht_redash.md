# Ailtireacht Re-Dash Madra

Úsáideann an tionscadal seo ailtireacht "Re-Dash", atá ina leagan ClojureDart den phatrún Re-Frame a bhfuil tóir air i ClojureScript. Soláthraíonn sé cur chuige feidhmiúil, bunaithe ar theagmhais, maidir le bainistíocht stáit.

## Príomhchoincheapa

Baineann an ailtireacht le cúpla coincheap lárnach:

1.  **Bunachar (DB)**: Foinse singil na fírinne do stát an fheidhmchláir. Is léarscáil Clojure é.
2.  **Teagmhais (Events)**: Comharthaí seolta ag an bhfeidhmchlár (an Chomhéadan Úsáideora de ghnáth) chun an Bunachar a athrú nó fo-iarsmaí a spreagadh.
3.  **Síntiúis (Subscriptions)**: Ceisteanna imoibríocha ar an mBunachar. Liostálann comhpháirteanna Chomhéadan Úsáideora leo seo chun nuashonruithe a fháil nuair a athraíonn sonraí.
4.  **Éifeachtaí (Effects)**: Fo-iarsmaí (cosúil le glaonna API, fuaim, loingseoireacht) a spreagtar ag teagmhais.

## Struchtúr Comhad

Tá an phríomh-loighic suite i `src/madra/feidhmchlár/`:

*   **`bunachar.cljd`**: API do stát an fheidhmchláir.
    *   Sainmhíníonn `initial-db`.
    *   Cuimsíonn feidhmeanna cúnta le haghaidh tiontú sonraí.
*   **`teagmhais.cljd`**: Láimhseálaithe teagmhais.
    *   `CláraighTeagmhasBunachar`: Láimhseálann nuashonruithe stáit amháin.
    *   `CláraighTeagmhasÉifeacht`: Láimhseálann teagmhais a chruthaíonn fo-iarsmaí.
*   **`síntiúis.cljd`**: Síntiúis.
    *   `CláraighSíntiús`: Sainmhíníonn conas sonraí a bhaint as an mBunachar don Chomhéadan Úsáideora.
*   **`éifeachtaí.cljd`**: Láimhseálaithe éifeachta.
    *   `CláraighÉifeacht`: Cur i bhfeidhm fo-iarsmaí (m.sh., ag casadh fuaime, ag lódáil comhad).

## Samplaí Úsáide

### Teagmhas a Sheoladh

Chun athrú a spreagadh, seolann tú veicteoir teagmhais:

```clojure
(s/Seol [::teagmhais/advance-word])
```

### Liostáil le Sonraí

Chun sonraí a úsáid i ngiuirléid, úsáideann tú `FaighSíntiús` (laistigh de chomhthéacs imoibríoch):

```clojure
(let [current-card (s/FaighSíntiús [::síntiúis/current-card])]
  ;; ... úsáid sa ghiuirléid
  )
```
