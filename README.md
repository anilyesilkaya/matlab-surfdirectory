# SurfDirectory (sd)

> Enhanced `cd` for MATLAB with history, bookmarks, and file shortcuts.

SurfDirectory (`sd`) is a lightweight MATLAB utility that extends the built-in `cd` command with:

- Navigation history (back / forward)
- Persistent bookmarks
- File shortcuts
- Preference-based storage (no external config required)
- MATLAB function tab-completion support

---

## Directory Navigation

```matlab
sd <folder>
```

Change directory and automatically log the visit in history.

---

## Quick Navigation

```matlab
sd back       % go back one step (also: sd b, sd -)
sd fwd        % go forward one step (also: sd f)
```

Top-level shortcuts for navigating through visited folders. The `sd go back` / `sd go fwd` forms also work.

To `cd` into a folder literally named `back` or `fwd`, append a trailing slash:

```matlab
sd back/      % cd into a folder named "back"
```

### Go Shortcuts

```matlab
sd go matlabroot    % jump to MATLAB root (also: sd go root)
sd go back          % alias for sd back
sd go fwd           % alias for sd fwd
```

---

## Bookmarks

Bookmarks are stored persistently using MATLAB preferences.

```matlab
sd book                       % show all bookmarks
sd book <name>                % jump to bookmark (shorthand for sd book go <name>)
sd book add <name>            % add bookmark for current folder (absolute path)
sd book add <name> --rel      % add bookmark relative to matlabroot (also: sd book $add <name>)
sd book go <name>             % jump to bookmark
sd book remove <name>         % remove bookmark (also: sd book rm <name>)
sd book export                % save bookmarks to bookmarks.mat
sd book load                  % load bookmarks from bookmarks.mat
sd book clear                 % clear all bookmarks (reinitialize defaults)
```

### Portable Bookmarks

Bookmarks added with `--rel` (or `$add`) use the reserved token `<$matlabroot$>` so they resolve dynamically across MATLAB installations.

---

## History

```matlab
sd hist                       % show history table
sd hist <index>               % jump to entry (shorthand for sd hist go <index>)
sd hist go <index>            % jump to history entry
sd hist clear                 % clear history
```

The history table shows item index, destination, and last accessed timestamp. A cursor tracks the current position for back/forward navigation. History is capped at 1000 entries.

---

## File Shortcuts

Store and quickly open frequently accessed files.

```matlab
sd files                              % show file entries
sd files <alias>                      % open file in editor (shorthand for sd files open <alias>)
sd files add <filename> <alias>       % add file from current folder (absolute path)
sd files add <filename> <alias> --rel % add file relative to matlabroot (also: sd files $add <filename> <alias>)
sd files open <alias>                 % open file in editor (also: sd files go <alias>)
sd files remove <alias>               % remove entry (also: sd files rm <alias>)
sd files export                       % save file entries to files.mat
sd files load                         % load file entries from files.mat
sd files clear                        % clear all file entries
```

---

## Storage Model

SurfDirectory stores bookmarks, history, and file entries inside MATLAB preferences under:

```
Group: "surfdirectory"
```

No external configuration files are required (unless exporting bookmarks manually).

---

## Installation

1. Place `sd.m` somewhere on your MATLAB path, or run:

```matlab
sdInstall
```

This copies `sd.m` to your MATLAB userpath, generates tab-completion signatures, and auto-loads any exported `bookmarks.mat` / `files.mat`.

2. (Optional) Regenerate tab completion after modifying commands:

```matlab
updateFunctionSignatures
```

---

## Version

Current version: `v0.1`

---

## Future Ideas

- History export/load for portability
- `files add` with full path (not just current directory)
- Optional alias defaults to filename stem
- Search/filter for history and bookmarks
- Bookmark grouping
- JSON export instead of MAT file
- Cross-machine sync
- GUI dashboard

---

## License

MIT License
Copyright (c) 2026 Anil Yesilkaya
