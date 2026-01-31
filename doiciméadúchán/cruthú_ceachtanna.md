# Cruthú Ceachtanna

Míníonn an treoir seo conas ceachtanna nua agus ábhar fuaime a chur le Madra Teanga.

## Struchtúr na gCeachtanna (`assets/deck.json`)

Stóráiltear gach ábhar ceachta i `assets/deck.json`. Tá eagar de réada ceachta sa chomhad seo.

### Formáid JSON

Leanann gach réad ceachta an struchtúr seo:

```json
{
  "irish": ["Dia", "dhaoibh", "a", "chairde"],
  "literals": ["God", "to-you(pl)", "oh", "friends"],
  "english": "Hello friends!",
  "options": ["Hello friends!", "Goodbye friends!", "Nice weather!"],
  "audio-asset": "audio/hello_friends.mp3"
}
```

### Réimsí

*   **`irish`**: Liosta de theaghráin a léiríonn na focail Ghaeilge san abairt.
*   **`literals`**: Liosta de theaghráin a léiríonn an t-aistriúchán litriúil do gach focal Gaeilge. Caithfidh sé a bheith ar aon fhad le `irish`.
*   **`english`**: Aistriúchán iomlán Béarla na habairte.
*   **`options`**: Liosta de theaghráin don tráth na gceist ilroghnach. Caithfidh an luach ceart `english` a bheith san áireamh.
*   **`audio-asset`**: An cosán chuig an gcomhad fuaime don abairt seo, coibhneasta leis an eolaire `assets/`.

## Sócmhainní Fuaime

Ba chóir comhaid fuaime a chur san eolaire `assets/audio/`.

1.  Cuir do chomhad `.mp3` le `assets/audio/`.
2.  Déan tagairt dó i `deck.json` ag baint úsáide as an gcosán `audio/your_file.mp3`.

> [!NOTE]
> Cinntigh go Meaitseálann an t-ainm comhaid go díreach leis an méid atá i do JSON.
