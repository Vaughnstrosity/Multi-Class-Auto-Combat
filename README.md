# MCAC - Multi Class Auto Combat

A combat bot and set of in-game tools for the **[Project Triune](https://nms.bestemu.com/)** EverQuest server, running on [MacroQuest](https://macroquest.org/).

On Project Triune every character is three classes at once. MCAC runs all three for you: it casts your spells, fires your AAs and discs, pulls mobs, controls your pets, keeps your boxes together, and sits to med when it is safe. Everything is set up from one in-game window - no macros to write.

MCAC is a fork of [Triune AutoCombat](https://github.com/gennro/TriuneAutocombat) by gennro. It was renamed so the two can be told apart; it also supports 1-16 classes and has typed pet names and an Advanced Tuning section.

---

## Install

1. Download the latest **RoF2** MacroQuest from [macroquest/macroquest/releases](https://github.com/macroquest/macroquest/releases) and extract it somewhere like `C:\MacroQuest`.
2. Download MCAC from [MCAC releases](https://github.com/Vaughnstrosity/Multi-Class-Auto-Combat/releases/latest):
   - **`MCAC.zip`** - the Lua scripts and config. Use it for both a first install and updates.
3. Extract the zip **into the root of your MacroQuest folder**. It merges `lua/` and `config/` into place. Overwrite if asked - your own settings and loadouts are never touched.
4. Start `MacroQuest.exe`, then log into Project Triune.

MCAC opens by itself when you log in. If you close it, type `/ac` or `/lua run mcac`.

> Windows users: add your MacroQuest folder as an antivirus exception before running it.

---

## First run

1. **Check your classes.** The main window shows the classes it detected. Click **Re-detect** if they are wrong. On a server where a character can have more (or fewer) than three classes, set **Number of classes** (1-16) under Settings -> General Settings -> Character Classes & Loadout; the class slots and every per-class list adjust to match.
2. **Set up what to cast.** Go through the tabs: **Spell Gems** (spells), **Abilities** (kick, bash, backstab...), **AAs**, **Disciplines** and **Clickies**. Each entry gets a simple rule for when to fire it, such as *Target HP < 90%*, *My HP < 40%*, *Missing Buff* or *Always*. **Import Bar** fills the spell list from whatever you have memorized.
3. In **Spell Gems**, mark emergency heals, lifetaps, or other spells **High Priority** to check them after Abilities and Disciplines but before Clickies. Other spells remain after Clickies; the overall action-category order stays fixed.
4. **Pick a mode** on the **Control** tab and click **Start** (or type `/ac run`).

Your setup is saved automatically and reloads next time.

---

## Combat modes

| Mode | Use it when | What MCAC does |
|---|---|---|
| **Manual** | You want to drive | You move and pick targets. MCAC attacks, casts, heals and uses your abilities. |
| **Puller - Camp** | You are the puller | Runs out, tags a mob, brings it back to camp and fights it there. |
| **Puller - Hunt** | Solo roaming | Wanders the zone and kills mobs where they stand. |
| **Assist - Chase** | Boxed melee | Follows the Main Assist and attacks their target. |
| **Assist - Camp** | Boxed, stay put | Holds at camp and only fights what comes in. |
| **Assist - Backline** | Boxed healers and casters | Stays at range and never runs into melee. |

Set the Main Assist with `/ac ma <name>` or from the Control tab.

**Combat style** (Settings tab, or `/ac style melee|ranged|spell`) decides how you fight: close to melee, shoot a bow from a distance, or stand back and only cast. On servers that allow casting in motion, tick **Cast While Moving** (same section) so MCAC stops halting movement before casts.

**Pulling** options live on the Control tab: pull with melee, a spell, your pet or a bow; an **Include list** (only pull these) and an **Ignore list** (never pull these); faction filters so you never pull a guard; and **waypoint routes** for patrolling a path (`/ac wp add` while walking). Fine-tuning distances and timers (pet search radii, summon grace, the unreachable-mob blacklist, pull distances, idle roaming, group-rez attempts) are sliders under **Settings -> General Settings -> Advanced Tuning**.

**Burn mode** (`/ac burn`) fires anything you marked *Burn Only* - flip it on for named mobs.

---

## Windows and tools

Everything below is built in. Open them from the buttons on the main window's header or with the command shown.

| Window | Command | What it is |
|---|---|---|
| Status | main window tab | Live view of what the bot is doing, your target, pets and XTarget threats. |
| Pets | main window tab | Control one pet per pet class: attack, back off, hold, taunt, and the server's `#petcmd` commands. Type each pet's name under Settings -> General Settings -> Pet Management -> Pet Names so the script finds it by name and never mixes up which pet belongs to which class. |
| Target & Player HUD | `/ac hud` | Compact unit frames for you, your target and your pets. |
| Group | `/ac group` | Replacement group window with vitals, roles and click-to-target. |
| XTarget | `/ac xtar` | Replacement extended target window with HP, aggro and distance. |
| Effects & Songs | `/ac eff` | Your buffs and songs with time left. |
| Spell Gem Bar | `/ac gems` | Replacement spell bar with recast timers and spell sets. |
| Cooldowns | `/ac cd` | Every ability, AA and disc timer in one place. |
| Spellbook | `/ac spellbook` | Browse and search the spells of all your classes; mem to a gem from here. |
| Map | `/ac map` | 2D zone map, Norrath atlas and an NPC tracker (`/ac track`). Camp, waypoints and hazards are drawn on it. |
| Chat Windows | `/mcacchat` | Chat window replacement: tabs, filters, colours, highlights, a Tells window, item links, NPC dialogue links (click to answer), logging. |
| Game Database | `/ac db` | Offline copy of the server's item, NPC and spell database. `/ac item`, `/ac npc`, `/ac spell` search it. |
| Inventory & Bank | `/ac inv` | Search, sort and move items; see every box's bags; hand items between boxes. |
| Hot Buttons | `/ac btn` | Button Master-style hotbars with cooldown overlays and share strings. |
| Box Network | `/ac net` | See and steer your other boxes on this PC. `/ac net all burn on` runs a command on all of them. |
| NMS Loot | `/ac nms` | The server's `#nms` loot system as a window, shared across your boxes. |
| DPS Parser | `/dps` | Per-fight damage for you and your pets, plus a group meter over the Box Network. |
| Auto-Accept | `/ac autoaccept` | Auto-accepts group, trade and DZ invites by your rules. |
| Auto AA | `/ac aawin` | Spends AA points on the checked priorities only; the fireworks cap spender runs once every priority is maxed (or none is checked). `/ac aastatus` shows why each priority is or is not next. |
| Buffbot | `/ac buffbot on` | A buff station: players `/tell` you for buffs, it casts them. Off unless you turn it on. |
| Cursor Manager | `/ac cursorui` | Clears whatever is stuck on your cursor. |
| Parcels | `/ac parcels` | Tells you when parcels arrive and collects them all at a parcel merchant. |
| GM Commands | `/ac gm` | Reference and runner for the server's `#` GM commands: search every command, fill in its arguments, run it, keep favourites; `/ac gm zone poknowledge` runs one from a hot button. Off unless you turn it on, and only useful with GM status. |
| Floating damage | Settings -> Plugins | Big animated numbers for crits. |
| Update Checker | `/ac update` | Tells you when a newer MCAC release is out. Nothing is downloaded. |
| Compact Mini HUD | `/ac compact` | The whole bot shrunk to a small strip. |

Each of these is a plugin in `lua/mcac/`. Turn them on or off under **Settings -> Plugins**.

---

## Commands you will actually use

Type `/ac help` in game for the full list.

| Command | What it does |
|---|---|
| `/ac` | Start or pause |
| `/ac run` / `/ac pause` | Start / pause |
| `/ac manual`, `/ac puller camp`, `/ac puller hunt`, `/ac assist chase`, `/ac assist camp`, `/ac backline` | Switch mode |
| `/ac ma <name>` | Set the Main Assist |
| `/ac burn` | Toggle Burn mode |
| `/ac memall` | Memorize any missing spells |
| `/ac importbar` | Build the spell list from your memorized gems |
| `/ac style melee\|ranged\|spell` | Set combat style |
| `/ac wp add` / `/ac wp clear` | Add a waypoint here / clear the route |
| `/ac pet attack\|back\|hold on` | Pet commands (any `#petcmd` verb) |
| `/ac net <all\|zone\|group\|Name> <command>` | Run a command on the boxes: an `/ac` command (`/ac net all burn on`) or any slash command as typed (`/ac net group /ac manual`, `/ac net all /camp`) |
| `/ac scale 1.25` | Make every MCAC window bigger (or smaller) |
| `/ac status` | Print what the bot is doing |
| `/ac restart` | Reload the whole script |
| `/mcacrun` | Start/pause - bind this to a key |

---

## When something goes wrong

- **Not moving or pulling?** Look at the Status tab. It shows whether MQ2Nav and MQ2MoveUtils are loaded and whether the zone has a navmesh, with buttons to load or reload them.
- **Stuck on terrain?** MCAC remembers where it got stuck and routes around it next time. Clear those spots under **Settings -> Navigation**.
- **Need to report a bug?** Turn on **Log To File** (`/ac log on`) and, when it happens, run `/ac dump`. Attach the files from your MacroQuest `Logs/` folder (`mcac_<server>_<char>.log` and `mcac_dump_...log`). `/ac debug` prints extra detail to chat.
- **Game feels slow with Lua scripts?** MCAC sets MQ2Lua's `turboNum` to 10000 on first start (the default of 500 makes every Lua script crawl). If you set it higher yourself, MCAC leaves it alone.
- **A plugin broke?** It is isolated - it shows an error under Settings -> Plugins and the rest keeps running. Fix or disable it there.

---

## Where your files live

All paths are inside your MacroQuest folder.

| File | What it holds |
|---|---|
| `config/mcac_loadout_<server>_<char>.lua` | Each character's settings and loadouts. Never overwritten by updates. |
| `config/mcac_chat_<server>_<Name>.lua` | Chat Windows layout and colours, per server and character. |
| `config/mcac_dps_<server>_<Name>.lua` | DPS Parser settings, per server and character. |
| `Logs/mcac_*.log` | Diagnostic logs (when Log To File is on). |
| `lua/mcac/init.lua` | The bot itself (run with `/lua run mcac`). If you are updating from the Triune AutoCombat names, delete the old `lua/triune.lua` (or `lua/triune/`) and `lua/tac/` folder. |
| `lua/mcac/*.lua` | The plugins listed above (everything except `init.lua`). Drop your own `.lua` plugin here and it loads. |

---

## Writing a plugin

A plugin is one Lua file in `lua/mcac/` that returns a table with an `id`, a `name`, and any of the hooks `onInit(core)`, `onTick()`, `onDrawUI()`, `onDrawSettings()`, `onCommand(cmd, args)`, `onSaveSettings()` and `onLoadSettings(t)`. `core` gives you `mq`, `ImGui`, the live `ctrl` config, `core.log` for logging and `core.delay(ms)` instead of `mq.delay`. Add `plugin.window = { label = 'Mine', flag = 'show_mine' }` and it gets a header button and a place in the window manager. The shipped plugins are the best examples - `cursor.lua` is the smallest.

---

## Links

- [MCAC releases](https://github.com/Vaughnstrosity/Multi-Class-Auto-Combat/releases/latest)
- [MacroQuest releases (RoF2)](https://github.com/macroquest/macroquest/releases)
- [Project Triune](https://nms.bestemu.com/)
- [Release notes](RELEASES.md) - short summary per release
- [Change log](CHANGELOG.md) - every change in detail

---

## Version

Current version: **3.6.0**

See [CHANGELOG.md](CHANGELOG.md) for what changed in each release.
