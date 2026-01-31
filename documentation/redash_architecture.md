# Madra Re-Dash Architecture

This project uses a "Re-Dash" architecture, which is a ClojureDart adaptation of the popular Re-Frame pattern from ClojureScript. It provides a functional, event-driven approach to state management.

## Core Concepts

The architecture revolves around a few key concepts:

1.  **DB (Database)**: The single source of truth for the application state. It's a Clojure map.
2.  **Events**: Signals dispatched by the application (usually the UI) to modify the DB or trigger side effects.
3.  **Subscriptions**: Reactive queries on the DB. UI components subscribe to these to get updates when data changes.
4.  **Effects**: Side effects (like API calls, audio, navigation) that are triggered by events.

## File Structure

The core logic is located in `src/madra/app/`:

*   **`db.cljd`**: API for the application state.
    *   Defines `initial-db`.
    *   Contains helper functions for data conversion.
*   **`events.cljd`**: Event handlers.
    *   `reg-event-db`: Handles pure state updates.
    *   `reg-event-fx`: Handles events that cause side effects.
*   **`subs.cljd`**: Subscriptions.
    *   `reg-sub`: Defines how to extract data from the DB for the UI.
*   **`effects.cljd`**: Effect handlers.
    *   `reg-fx`: Implementation of side effects (e.g., playing audio, loading files).

## Usage Examples

### Dispatching an Event

To trigger a change, you dispatch an event vector:

```clojure
(rd/dispatch [::events/advance-word])
```

### Subscribing to Data

To use data in a widget, you use `use-sub` (within a reactive context):

```clojure
(let [current-card (rd/subscribe [::subs/current-card])]
  ;; ... usage in widget
  )
```
