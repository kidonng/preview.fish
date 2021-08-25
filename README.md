# 🔍🐟 preview.fish

[Fish](https://fishshell.com/) plugin for previewing files.

## Installation

- [plug.fish](https://github.com/kidonng/plug.fish)

  ```sh
  plug install kidonng/preview.fish
  ```

- [Fisher](https://github.com/jorgebucaran/fisher)

  ```sh
  fisher install kidonng/preview.fish
  ```

## Dependencies

Only [`file(1)`](https://darwinsys.com/file/) is mandatory required, the following programs provides previews for more file types:

- [`bat`](https://github.com/sharkdp/bat) for texts
- [`glow`](https://github.com/charmbracelet/glow) for `*.md` (Markdown)
- [`p7zip`](https://github.com/jinfeihan57/p7zip) for archives
- [`timg`](https://github.com/hzeller/timg) for images and videos
- macOS builtin tools `plutil` and `qlmanage` for documents and some other stuff

## Usage

The main function is `preview`:

```
$ preview shell.sh
   1 echo Hello world!
   2 echo This is shell file example
```

An awesome use case is to combine the plugin with [fzf.fish](https://github.com/PatrickF1/fzf.fish):

```fish
set -U fzf_preview_file_cmd preview
```

P.S. if you don't have the plugin, definitely check it out, it is one of the must-have Fish plugins and also contributed by me.

---

Previews are generated via **viewers**, which is a function named `_preview_viewer_<program name>`. The above example is using `_preview_viewer_bat`.

To decide which viewer to use, the plugin check for a corresponding function, in the following order:

1. `_preview_ext_<extension>` for matching file extensions.

   E.g. `_preview_ext_md` matches `.md` files.

2. `_preview_type_<type>` for matching `file -b` (file type description) outputs, replacing all spaces with underscore (`_`).

   E.g. `_preview_type_Apple_binary_property_list` matches `Apple binary property list`.

3. `_preview_mime_<mime>` for matching `file -b --mime-type` (MIME) outputs, replacing all slashes (`/`) with underscore (`_`).

   E.g. `_preview_mime_application_json` matches `application/json`.
   You can also only specify the part before the slash to match a general category, e.g. `_preview_mime_text` matches `text/*`.

View the source code for available viewers and matching functions.

---

If no viewer is available for the previewed file, the output of `file -b` (file type description) and `file -b --mime-type` (MIME) will be displayed instead:

```
$ preview /bin/bash
Mach-O universal binary with 2 architectures: [x86_64:Mach-O 64-bit x86_64 executable, flags:<NOUNDEFS|DYLDLINK|TWOLEVEL|PIE>] [arm64e (caps: 0x02):Mach-O 64-bit arm64e (caps: PAC00) executable, flags:<NOUNDEFS|DYLDLINK|TWOLEVEL|PIE>]
(application/x-mach-binary)
```

## Customization

You can override existing viewers with a function of the same name under `~/.config/fish/functions`:

```fish
# Enable the plain view (`-p`) in `bat`
# You can put it under `~/.config/fish/functions/_preview_viewer_bat.fish`
function _preview_viewer_bat
    bat -p --color always $argv
end
```

Or adding support for a file extension:

```fish
# Preview `*.dll` files with `7z`
function _preview_ext_dll
    7z l $argv
end
```
