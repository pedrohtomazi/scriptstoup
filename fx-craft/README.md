# FX-CRAFT 

* Please join our discord about script development. You will automatically get a Discord Role.
* https://discord.gg/PjEu6tgAkU

## Requirements
- x

## Setup
* Download the latest version of FX-CRAFT

### After completing the installation
* Copy and paste ```fx-craft``` folder to ```resources/fx-craft```
* Add ```ensure fx-craft``` to your ```resource.cfg``` file
* To change the language go to ```resources/fx-craft/config``` and change the default language.
* Open config.lua and set Framework


# FX-Craft: OpenBook Trigger Documentation

## Overview

This document explains how to use the `fx-craft:server:OpenBook` server event from the FX-Craft system. This trigger is used to open a specific crafting book with job restrictions, UI information, and crafting data.

---

## 🔧 Event: `fx-craft:server:OpenBook`

### Syntax:

```lua
TriggerServerEvent("fx-craft:server:OpenBook", Jobs, CraftData, bookImage, bookName, bookId)
```

### Parameters:

| Name        | Type                 | Description                                                                                                                          |
| ----------- | -------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `Jobs`      | `boolean` or `table` | If `false`, no job restriction. If `table`, defines which jobs can access the book. Example: `{ ["sheriff"] = 0, ["sheriff2"] = 0 }` |
| `CraftData` | `table`              | Crafting recipes, typically from `Craft.CraftItems`                                                                                  |
| `bookImage` | `string`             | Path to the image used as the book icon in the UI (e.g., `/ui/assets/img/craftman.png`)                                              |
| `bookName`  | `string`             | Display name of the book in the UI (e.g., `"TestBook"`)                                                                              |
| `bookId`    | `string`             | Unique identifier for the book (e.g., `"TestBook"`)                                                                                  |

---

## 📘 Example Usage (Client-Side)

```lua
RegisterCommand("opentestbook", function()
    local Jobs = { ["marshall"] = 0 }
    local CraftData = Craft.CraftItems
    local bookImage = "/ui/assets/img/craftman.png"
    local bookName = "TestBook"
    local bookId = "TestBook"

    TriggerServerEvent("fx-craft:server:OpenBook", Jobs, CraftData, bookImage, bookName, bookId)
end)
```

In this example:

* The book is restricted to players with the `marshall` job.
* It uses default crafting data from `Craft.CraftItems`.
* The UI will show the book with the given image and name.

---

## 📝 Notes

* The `bookId` must be unique to avoid conflicts between books.
* If `Jobs` is set to `false`, the book will be accessible by any player.
* Ensure the `CraftData` table is valid and formatted properly.

---

## ✅ Best Practices

* Use meaningful `bookId` values like `"armorBook_lvl1"` or `"tools_blacksmith"`.
* Store job restrictions in config files for better maintainability.
* Localize `bookName` for multi-language support if needed.

---

## 🔒 Access Control Example

```lua
local jobRestriction = {
    ["sheriff"] = 0,
    ["blacksmith"] = 0
}

TriggerServerEvent("fx-craft:server:OpenBook", jobRestriction, Craft.CraftItems, "/ui/assets/img/armorbook.png", "Armor Recipes", "armorBook_lvl1")
```

---

This documentation provides a clean and structured way to understand and implement the OpenBook system in your RedM FX-Craft script.
