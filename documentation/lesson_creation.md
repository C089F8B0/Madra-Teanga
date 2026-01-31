# Lesson Creation

This guide explains how to add new lessons and audio content to Madra Teanga.

## Lessons Structure (`assets/deck.json`)

All lesson content is stored in `assets/deck.json`. This file contains an array of lesson objects.

### JSON Format

Each lesson object follows this structure:

```json
{
  "irish": ["Dia", "dhaoibh", "a", "chairde"],
  "literals": ["God", "to-you(pl)", "oh", "friends"],
  "english": "Hello friends!",
  "options": ["Hello friends!", "Goodbye friends!", "Nice weather!"],
  "audio-asset": "audio/hello_friends.mp3"
}
```

### Fields

*   **`irish`**: A list of strings representing the Irish words in the sentence.
*   **`literals`**: A list of strings representing the literal translation for each Irish word. Must match the length of `irish`.
*   **`english`**: The full English translation of the sentence.
*   **`options`**: A list of strings for the multiple-choice quiz. Must include the correct `english` value.
*   **`audio-asset`**: The path to the audio file for this sentence, relative to the `assets/` directory.

## Audio Assets

Audio files should be placed in the `assets/audio/` directory.

1.  Add your `.mp3` file to `assets/audio/`.
2.  Reference it in `deck.json` using the path `audio/your_file.mp3`.

> [!NOTE]
> Ensure the filename matches exactly what is in your JSON.
