# noon Strategy Team Slide Editor — Developer Notes

A fully self-contained single-file HTML slide editor. No build tools, no server, no npm. Open directly in any browser.

## Input Format

- Only works with **slides-grab bundled HTML format**
- Slides are stored as JSON in `<script type="__bundler/template">` tags
- Assets (images, fonts) are stored in `<script type="__bundler/manifest">` as base64 data URIs

## Key Decisions

### `freezeForDelete()` — don't simplify this
Two-pass approach: snapshots ALL sibling bounding rects across the entire ancestor chain **before** making any DOM changes, then applies `position:absolute` to freeze them. This prevents reflow when an element is deleted. Simplifying this will cause elements to jump.

### Drag uses `transform:translate(x,y)`, not `position:absolute`
Keeps flex layout intact while dragging. `position:absolute` is only applied during resize (and delete-freeze), never during normal drag.

### Slide isolation
Each slide renders inside its own `<iframe srcdoc>` for style isolation. `postMessage` is used for communication between the parent editor and slide iframes.

## Brand

| Token | Value |
|---|---|
| noon yellow | `#F5E100` |
| Background | `#0e0e0e` (black) |
| Font | Figtree (Google Fonts) |
| Logo | noon PNG embedded as base64 data URI with `filter:invert(1)` for dark topbar |

## Sharing

Just share the `slide-editor.html` file. Anyone can open it directly in a browser — no installation needed.
