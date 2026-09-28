# Keymap reference

Leader = `<space>`

---

## Contextual

### Markdown (`m`)
| Key | Action |
|---|---|
| `mp` | Preview (split, browser) |
| `mr` | Toggle render-markdown |
| `mi` | Toggle inline image preview (image-cursor.nvim) |
| `mb` (visual mode) | Bolden the text |
| `mi` (visual mode) | Italicize the text |
| `*` (insert mode) | Smart `**bold**` wrapping |

### LaTeX (`l`) also active in markdown buffers for inline math
| Key | Action |
|---|---|
| `lc` | Compile |
| `lv` | View PDF |
| `lx` | Clean aux files |
| `lk` | Stop compilation |
| `le` | Show errors |
| `lt` | Toggle table of contents |
| `lI` | VimTeX Info |
| `lq` | Insert `equation` environment |
| `la` | Insert `align` environment |
| `lm` (visual) | Wrap selection in `$...$` |
| `lM` (visual) | Wrap selection in `$$...$$` |

### C/C++ (`c`)
| Key | Action |
|---|---|
| `cr` | Compile & run current file (floating terminal) |
| `cb` | `cmake --build build` (horizontal terminal) |
| `cdb` | DAP: toggle breakpoint |
| `cdc` | DAP: continue / start |
| `cdi` | DAP: step into |
| `cdo` | DAP: step over |
| `cdO` | DAP: step out |
| `cdt` | DAP: terminate |
| `cdu` | DAP: toggle UI |

### Jupyter / Molten (`j`): python, ipynb
| Key | Action |
|---|---|
| `ji` | Init kernel |
| `je` | Evaluate operator |
| `jl` | Evaluate line |
| `jc` | Re-evaluate cell |
| `jd` | Delete cell |
| `jh` | Hide output |
| `jv` (visual) | Evaluate visual selection |

---

## Global

### Windows / splits
| Key | Action |
|---|---|
| `<C-h/j/k/l>` | Move to left/below/above/right window |
| `wv` | Split vertically |
| `wh` | Split horizontally |
| `we` | Equalize split sizes |
| `wq` | Close window |
| `ww` | Toggle line wrap |
| `<Up>/<Down>/<Left>/<Right>` | Resize window |

### Tabs
| Key | Action |
|---|---|
| `<leader>to` | New tab |
| `<leader>tw` | Close tab |
| `<leader>tn` / `<leader>tp` | Next / previous tab |

### Buffers
| Key | Action |
|---|---|
| `<A-Tab>` / `<A-S-Tab>` | Next / previous buffer |
| `<A-1>`..`<A-9>` | Go to buffer N |
| `<C-w>` | Close buffer |
| `bn` | New buffer |

### Find (snacks.nvim pickers)
| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Grep |
| `<leader>fr` | Recent files |
| `<leader>fb` | Buffers |
| `<leader>fs` | LSP symbols |
| `<leader>f/` | Grep in open buffers |

### LSP
| Key | Action |
|---|---|
| `gd` / `gD` | Go to definition / declaration |
| `gr` / `gi` | References / implementation |
| `gsh` | Signature help |
| `K` | Hover docs |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>ld` | Line diagnostics |
| `<leader>lf` | Format document |
| `<leader>ls` | Show active LSP clients |
| `<leader>lr` | Reload buffer / restart LSP |
| `d[` / `d[` | Next / previous diagnostic |
| `<leader>xd` | Diagnostics location list |

### Git / file explorer
| Key | Action |
|---|---|
| `<leader>gs` | Git status (Neo-tree float) |
| `<leader>e` | Toggle file explorer |
| `\` | Reveal current file in explorer |

### Terminal
| Key | Action |
|---|---|
| `` <C-\> `` | Toggle terminal (default direction) |
| `<leader>tf` | Terminal (float) |
| `<leader>tv` | Terminal (vertical) |

### UI / misc
| Key | Action |
|---|---|
| `<leader>ub` | Toggle background transparency |
| `<leader>nd` / `nl` / `nh` | Noice: dismiss / last / history |
| `<C-f>` / `<C-b>` | Scroll noice popup down / up |
| `<leader>pi` | Paste image from clipboard |

### Editing conveniences
| Key | Action |
|---|---|
| `x` | Delete char without yanking |
| `p` (visual) | Paste without clobbering register |
| `<C-d>` / `<C-u>` | Scroll + center |
| `n` / `N` | Next/prev search result + center |
| `j` / `k` | Wrap-aware up/down |
| `<S-Tab>` / `<` / `>` | Indent adjustments |
| `<C-s>` / `<A-s>` | Save (with/without autoformat) |
| `<C-q>` | Quit |
| `ib` / `ab` | Inner/around code cell (treesitter textobject) |
| `]b` / `[b` | Next/previous code cell |

---

## Dashboard
| Key | Action |
|---|---|
| `f` | Find files |
| `r` | Recent files |
| `d` | Open a directory (absolute from ~) |
| `1`-`5` | Jump to a recent project (cwd + auto-session restore) |
| `s` | Search saved sessions (`:SessionSearch`) |
| `S` | Save current session |
| `c` | Browse nvim config files |
| `u` | Update plugins |
 `q` | Quit |
