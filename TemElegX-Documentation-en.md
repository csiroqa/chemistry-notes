# TemElegX Family Documentation

> TemElegX is a LaTeX template family offering elegant typographic configuration, math support, color themes, and theorem environments.
> Version overview: liTemElegXv2.4 (lite core), TemElegXv2.2 (legacy full package), pTemElegX (pLaTeX/upLaTeX traditional typesetting), xeTemElegX (XeLaTeX font configuration), TemElegXcolor (color definitions), TemElegXref (hyperref setup), TemEnvX (colored theorem environments).

---

## liTemElegXv2.4.sty — Lite Core Package

This is the main entry point of the TemElegX family, using the kvoptions key-value system to load modules on demand.

### Modifications to LaTeX Primitives

None.

### Referenced Packages

**Always loaded:**
| Package | Purpose |
|---------|---------|
| `calc` | Length arithmetic |
| `xparse` | Multi-argument command definition |
| `circledsteps` | Circled number markers |
| `ulem` (normalem, normalbf) | Underline and emphasis |
| `cancel` (thicklines) | Mathematical cancellation |
| `siunitx` | Physical unit formatting |
| `nicematrix` | Enhanced matrix environments |
| `enumitem` | List spacing control |
| `kvoptions` | Key-value option system |

**Conditionally loaded:**

| Option | Packages loaded |
|--------|----------------|
| `geometry` | `geometry` |
| `fancy` | `fancyhdr` |
| `color` | `TemElegXcolor`, `tcolorbox` (most library) |
| `font` | `amssymb`, `amsfonts` |
| `graphicx` | `graphicx` |
| `table` | `tabu`, `multirow`, `colortbl`, `makecell`, `booktabs`, `tabularx`, `arydshln` |
| `math` | `amsmath`, `amssymb`, `amsfonts`, `amsthm`, `fixdif`, `upgreek`, `mathtools`, `mathrsfs`; additionally `unicode-math` and `fontsetup` when not using upLaTeX |
| `chem` | `chemfig`, `extarrows`, `mhchem` (v4) |
| `phys` | *reserved* |
| `env` | If `color` is enabled, loads `TemEnvX`; otherwise defines basic theorem environments via `\newtheorem` |

**AtEndPreamble:**
- `circledtext`
- `circledsteps`
- `footmisc` (perpage, ragged, stable, hang, multiple)

### Modifications to Existing Commands

| Command | Modification |
|---------|-------------|
| `\figurename` | Redefined as **Fig.** (bold) |
| `\tablename` | Redefined as **Tab.** (bold) |
| `\leq` | Replaced with `\leqslant` (slanted version) |
| `\geq` | Replaced with `\geqslant` (slanted version) |
| `\log` | Overloaded with smart parentheses: `\log` (plain "log"), `\log{x}` → `\log(x)`, `\log[2]{x}` → `\log_2(x)` |
| `\ln` | Overloaded with smart parentheses |
| `\lg` | Overloaded with smart parentheses |
| `\title` (fancy option) | Stores the title into `\thetitle` for footer display |
| `\thefootnote` | Wraps footnote number with `\circledtext` |
| `\@makefntext` | Displays footnote markers as non-superscript within the footnote text |

### Defined Commands

#### General
| Command | Meaning |
|---------|---------|
| `\n` | Equivalent to `\par` (paragraph break) |
| `\thetitle` | Stores the document title (under fancy option) |
| `\settitle{title}` | Sets `\thetitle` value |
| `\pic[width]` | Image inclusion, default width 0.8\textwidth |
| `\abs[expr]` | Absolute value with auto-scaling vertical bars |

#### Font Styles (font option)
| Command | Meaning |
|---------|---------|
| `\re{text}` | Reference style, equivalent to `\textit` |
| `\co{text}` | Concept style, equivalent to `\textsf` |

#### Math Symbols (math option)

**Blackboard bold number sets:**
| Command | Meaning |
|---------|---------|
| `\HH` | Quaternions `\mathbb{H}` |
| `\CC` | Complex numbers `\mathbb{C}` |
| `\RR` | Real numbers `\mathbb{R}` |
| `\NN` | Natural numbers `\mathbb{N}` |
| `\QQ` | Rational numbers `\mathbb{Q}` |
| `\ZZ` | Integers `\mathbb{Z}` |

**Constants and symbols:**
| Command | Meaning |
|---------|---------|
| `\ii` | Imaginary unit `\mathrm{i}` |
| `\jj` | Imaginary unit `\mathrm{j}` |
| `\ee` | Euler's number `\mathrm{e}` |
| `\diff` | Differential symbol `\d` |
| `\dotlessi` | Dotless i (\i) |
| `\dotlessj` | Dotless j (\j) |
| `\mrm` | Shorthand for `\mathrm` |
| `\leqhorz` | Original horizontal ≤ (backup of `\leq`) |
| `\geqhorz` | Original horizontal ≥ (backup of `\geq`) |
| `\logd` | Logarithm operator "log" |
| `\lnd` | Natural logarithm operator "ln" |
| `\lbd` | Binary logarithm operator "lb" |
| `\lgd` | Common logarithm operator "lg" |
| `\lb[expr]` | Binary logarithm with smart parentheses |
| `\transpose{matrix}` | Transpose notation `...^{\mathrm{T}}` |
| `\bbsc` | Switch to Blackboard Bold StylisticSet 5 |

**Derivative commands:**
| Command | Meaning |
|---------|---------|
| `\deriv[order]{numerator}{denominator}` | Ordinary derivative `\d y/\d x`, supports higher orders |
| `\pderiv[order]{numerator}{denominator}` | Partial derivative `\partial y/\partial x` |
| `\mpderiv{func}{var1}{order1}{var2}{order2}` | Mixed partial derivative |
| `\upderiv[order]{numerator}{denominator}` | Derivative in upright partial symbol |
| `\mupderiv{func}{var1}{order1}{var2}{order2}` | Mixed partial derivative using upright ∂ |

#### Theorem Environments (env option, without color)
| Environment | Display Name |
|-------------|-------------|
| `Theorem` | Theorem |
| `Lemma` | Lemma |
| `Axiom` | Axiom |
| `Hypothesis` | Hypothesis |
| `Goal` | Goal |
| `Conjecture` | Conjecture |
| `Prop` | Proposition |
| `Corollary` | Corollary |
| `Def` | Definition |
| `Remark` | Remark |
| `Info` | Information |
| `Note` | Note |
| `Tactic` | Tactic |
| `Calc` | Calculation |
| `Algorithm` | Algorithm |
| `Example` | Example |
| `Exercise` | Exercise |
| `Proof` | Proof |
| `Think` | Think |
| `Quiz` | Quiz |

#### Other Environments (color option)
| Environment | Description |
|-------------|-------------|
| `entry{border-color}{bg-color}` | Generic tcolorbox with colored left border, enhanced mode, breakable |

---

## pTemElegX.sty — pLaTeX/upLaTeX Traditional Font Package

A font configuration package for upLaTeX using Source Han fonts (Source Han Serif / Sans) mapped via dvipdfmx specials, designed for traditional Japanese typesetting.

### Modifications to LaTeX Primitives

None.

### Referenced Packages

| Package | Purpose |
|---------|---------|
| `kvoptions` | Key-value option system |
| `otf` (uplatex, deluxe, jis2004) | OpenType font support |
| `plext` | Vertical typesetting enhancement |
| `plautopatch` | pLaTeX patches |
| `pxufont` | upLaTeX font definitions |

### Defined Commands

| Command | Meaning |
|---------|---------|
| `\ujlreq` | jlreq kanji font family (based on ujlreq), mincho (serif) style |
| `\ujlreqg` | jlreqg kanji font family (based on ujlreqg), gothic (sans) style |
| `\currentpTemElegXindex` | Reports the current font region index (set via the `index` option, default 2) |

### Font Mappings

Using `\AtBeginDvi` and `\special{pdf:mapline}`, the following upLaTeX virtual fonts are mapped to the Source Han font family:

| Virtual Font Name | Mapped Font |
|-------------------|-------------|
| `uphminl` / `uphminln` | SourceHanSerif-Light.ttc (serif light) |
| `uphminr` / `uphminrn` | SourceHanSerif-Regular.ttc (serif regular) |
| `uphminb` / `uphminbn` | SourceHanSerif-Bold.ttc (serif bold) |
| `uphgothr` / `uphgothrn` | SourceHanSans-Regular.ttc (sans regular) |
| `uphgothb` / `uphgothbn` | SourceHanSans-Bold.ttc (sans bold) |
| `uphgotheb` / `uphgothebn` | SourceHanSans-Heavy.ttc (sans heavy) |
| `uphmgothr` / `uphmgothrn` | SourceHanSans-Medium.ttc (sans medium) |

Each font has both horizontal (‑h) and vertical (‑v) variants mapped separately; vertical variants use the `-w 1` parameter.

### Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `index` | string | `2` | Region index for Source Han fonts (0=jp, 1=kr, 2=sc, 3=tc, 4=hc) |

---

## TemElegXcolor.sty — Color Definitions Package

### Modifications to LaTeX Primitives

None.

### Referenced Packages

| Package | Purpose |
|---------|---------|
| `xcolor` (dvipsnames, svgnames, x11names) | Color system |

### Defined Commands

| Command | Meaning |
|---------|---------|
| `\bacolor{color}{content}` | Equivalent to `\colorbox`, background coloring |
| `\tecolor{color}{content}` | Equivalent to `\textcolor`, text coloring |

### Defined Colors

**Basic palette (each with dark and light variants):**

| Color Name | Dark (‑) | Light (+) |
|-----------|----------|-----------|
| `green` | `#119927` | `#e7fceb` |
| `blue` | `#00579b` | `#d6edff` |
| `pink` | `#ff28ff` | `#ffd9ff` |
| `orange` | `#e07c00` | `#fff1e0` |
| `purple` | `#7700e5` | `#f3e5ff` |
| `red` | `#d00023` | `#ffe4e8` |
| `grey` | `#787878` | `#eeeeee` |
| `yellow` | `#d8d800` | `#ffffd8` |

**Anime theme colors:**

| Series | Colors |
|--------|--------|
| Puella Magi Madoka Magica | `anime-madoka-init`, `anime-madoka-homura`, `anime-madoka-sayaka`, `anime-madoka-mami`, `anime-madoka-kyouko`, `anime-madoka-qb` |
| Is the Order a Rabbit? | `anime-gotyuumon-init`, `anime-gotyuumon-kokoa`, `anime-gotyuumon-tino`, `anime-gotyuumon-rize`, `anime-gotyuumon-tiya`, `anime-gotyuumon-syaro`, `anime-gotyuumon-maya`, `anime-gotyuumon-megumi`, `anime-gotyuumon-aoyama`, `anime-gotyuumon-rin`, `anime-gotyuumon-moka`, `anime-gotyuumon-tippi`, `anime-gotyuumon-anko`, `anime-gotyuumon-wildg` |
| K-ON! | `anime-k-on-init`, `anime-k-on-yui`, `anime-k-on-mio`, `anime-k-on-ritu`, `anime-k-on-tumugi`, `anime-k-on-azusa` |
| Bocchi the Rock! | `anime-botti-init`, `anime-botti-hitori`, `anime-botti-hazika`, `anime-botti-ryou`, `anime-botti-ikuyo`, `anime-botti-kikuri` |
| BanG Dream! It's MyGO!!!!! | `anime-mygo-init`, `anime-mygo-tomori`, `anime-mygo-anon`, `anime-mygo-raana`, `anime-mygo-soyo`, `anime-mygo-taki` |
| BanG Dream! Ave Mujica | `anime-mujica-init`, `anime-mujica-uika`, `anime-mujica-mutimi`, `anime-mujica-umiri`, `anime-mujica-nyamu`, `anime-mujica-sakiko` |

**Flag colors:**
| Color Name | Description |
|-----------|-------------|
| `Asia-PRC-red`, `Asia-PRC-yellow` | People's Republic of China |
| `Asia-ROC1-red`, `Asia-ROC2-yellow`, `Asia-ROC3-blue`, ... | Republic of China (Taiwan) |
| `Asia-Qing-*` | Qing Dynasty |
| `Asia-Japan-red` | Japan |
| `Asia-ROK-*` | South Korea |
| `Asia-DPRK-*` | North Korea |
| `Europe-EU-*` | European Union |
| `Europe-Austria-yellow` | Austria |
| `Europe-Ottoman-red` | Ottoman Empire |
| `Europe-UK-*` | United Kingdom |
| `Europe-RF-*` | Russian Federation |
| `Europe-HR-blue` | Croatia |
| `Europe-Byzantine-*` | Byzantine Empire |
| `Europe-RI-*` | Italy (Repubblica Italiana) |
| `Europe-FRG-*` | Germany (Federal Republic) |
| `Europe-FR-*` | France |
| `America-NATO-blue` | NATO |
| `America-USA-*` | United States |

**Transgender pride colors:** `tblue` (`#5BCEFA`), `tpink` (`#F5A9B8`)

---

## TemElegXref.sty — Hyperlink Configuration Package

### Modifications to LaTeX Primitives

None.

### Referenced Packages

| Package | Purpose |
|---------|---------|
| `hyperref` | Hyperlinks, PDF bookmarks, document properties |
| `bookmark` | Enhanced bookmark support |

### Configuration Notes

This package defines no new commands. It configures `hyperref` with the following settings:

- Hide PDF toolbar, show menu bar
- Numbered PDF bookmarks
- Colored links (links, files, URLs and citations all colored)
- PDF initial view set to fit page
- Duplex printing with long-edge flip
- Page layout: `TwoPageLeft` (two-page spread with odd pages on the left)

---

## TemElegXv2.2.sty — Legacy Full Package (v2.2)

*Note: This is the predecessor of liTemElegXv2.4. Its functionality has largely been inherited and refactored by the lite edition. Only unique features are listed below.*

### Modifications to LaTeX Primitives

None.

### Referenced Packages

Mostly identical to liTemElegXv2.4, with these differences:
- Loads `ctex` (UTF8, fontset=none) and `fontspec` (no-math)
- Uses `xcolor` directly instead of the separate `TemElegXcolor.sty`
- Defines `\bacolor` and `\tecolor` inline rather than delegating to the color package
- AtEndPreamble loads `hyperref` + `bookmark` instead of using `TemElegXref.sty`

### Modifications to Existing Commands

Same as liTemElegXv2.4 (not repeated), plus the following v2.2-specific changes:

| Command | Modification |
|---------|-------------|
| `\TeX` | Re-kerned TeX logo |
| `\LaTeX` | Re-kerned LaTeX logo |

### Defined Commands

Commands unique to v2.2:

| Command | Meaning |
|---------|---------|
| `\subsubsubsection{title}` | 4th-level heading (equivalent to `\paragraph`) |
| `\Circ{content}` | Same as `\Circled` from `circledsteps` with small horizontal spacing |
| `\XeLaTeX` | XeLaTeX engine logo |
| `\LuaLaTeX` | LuaLaTeX engine logo |
| `\ciratio` | Upright pi symbol (same as `\ppi`) |
| `\ppi` | Upright pi `\symup{\pi}` |

**v2.2 font definitions** (also present in `xeTemElegX.sty`):

Latin fonts via `fontspec` and `\newfontfamily` (NewCM family); CJK fonts via ctex and `\newCJKfontfamily`. See the `xeTemElegX.sty` section for details.

---

## xeTemElegX.sty — XeLaTeX Font Configuration Package

A standalone XeLaTeX font package defining a complete set of body, sans-serif, monospace, and CJK fonts.

### Modifications to LaTeX Primitives

None.

### Referenced Packages

| Package | Purpose |
|---------|---------|
| `amssymb`, `amsfonts` | Math symbols |
| `fontspec` (no-math) | Font selection |
| `ctex` (UTF8, fontset=none) | Chinese typesetting support |
| `xeCJK` | CJK font auto-fallback and spacing |

### Modifications to Existing Commands

| Command | Modification |
|---------|-------------|
| `\TeX` | Re-kerned TeX logo with adjusted letter spacing and vertical alignment |
| `\LaTeX` | Re-kerned LaTeX logo with adjusted letter spacing and vertical alignment |

### Defined Commands

#### Engine Logos
| Command | Meaning |
|---------|---------|
| `\XeLaTeX` | XeLaTeX engine logo |
| `\LuaLaTeX` | LuaLaTeX engine logo |
| `\lgrquotes` | Left double quotation mark glyph `\char"201C` |
| `\rgrquotes` | Right double quotation mark glyph `\char"201E` |

#### Default Font Settings

| Font Category | Font Name |
|--------------|-----------|
| Body Roman | NewCM10-Regular.otf (italic, bold, bold-italic each specified) |
| Sans-serif | NewCMSans10-Regular.otf |
| Monospace | NewCMMono10-Regular.otf |
| CJK Roman | Source Han Serif SC Light (bold = Source Han Serif SC SemiBold, italic = LXGW WenKai GB Light) |
| CJK Sans | Source Han Sans SC Light (bold = Source Han Sans SC Medium) |
| CJK Mono | Sarasa Fixed Slab SC (等距更纱黑体 Slab SC) |

#### Supplementary Latin Fonts
| Font Command | Font |
|-------------|------|
| `\gentium` | Gentium Plus |
| `\genbook` | Gentium Book Plus |
| `\sserif` | Source Serif 4 |
| `\ssans` | Source Sans 3 |
| `\cascadia` | Cascadia Mono |
| `\sarasa` | Sarasa Fixed Slab SC |

#### Special Script Fonts
| Font Command | Description |
|-------------|-------------|
| `\sanskrittext` | Devanagari Sanskrit (NewCM10Devanagari) |
| `\greek` | Greek (CharacterVariant=4, StylisticSet=7) |
| `\greeksans` | Greek sans-serif (CharacterVariant=4, StylisticSet=6+7) |
| `\russian` | Russian Cyrillic (CharacterVariant=3) |
| `\russiansans` | Russian Cyrillic sans-serif (CharacterVariant=3) |
| `\ipafont` | International Phonetic Alphabet (StylisticSet=5) |
| `\textca` | Canadian Aboriginal Syllabics |
| `\newcmgreekguillemots` | Greek with French guillemets |
| `\newcmrussianguillemots` | Russian with French guillemets |
| `\showtiefont` | CharacterVariant=5 style |

#### CJK Font Variants by Weight

**Serif variants (Source Han Serif SC):**
| Command | Weight | Description |
|---------|--------|-------------|
| `\song` | Light / SemiBold | Default serif (songti) |
| `\xbs` | ExtraLight | Small-standard song |
| `\bs` | Regular | Standard song |
| `\das` | Medium | Large song |
| `\cus` | Heavy | Bold song |

**Sans-serif variants (Source Han Sans SC):**
| Command | Weight | Description |
|---------|--------|-------------|
| `\hei` | Light / Medium | Default sans-serif (heitii) |
| `\xih` | ExtraLight | Thin hei |
| `\bh` | Normal | Standard hei |
| `\dah` | Regular | Large hei |
| `\cuh` | Heavy | Bold hei |

**Kai (script) variants (LXGW WenKai):**
| Command | Weight | Description |
|---------|--------|-------------|
| `\kai` | Regular | Standard kai (script) |
| `\xik` | Light | Thin kai |
| `\cuk` | Medium | Bold kai |

**Founder Type fonts (note: commercial license required):**
| Command | Font |
|---------|------|
| `\fzfs` | FZFangSong-Z02 (FangSong, imitation song) |
| `\fzss` | FZShuSong-Z01 (ShuSong, book song) |
| `\fzkt` | FZKai-Z03 (Kai, script) |

**Mixed-purpose:**
| Command | Font Configuration |
|---------|-------------------|
| `\cre` | LXGW WenKai GB Light (bold = Medium), for Chinese reference |
| `\cco` | Source Han Sans SC Light (bold = Regular), for Chinese concept |

---

## TemEnvX.sty — Colored Theorem Environments Package

A collection of tcolorbox-driven colored theorem environments, designed to work with `TemElegXcolor.sty`. Each environment renders as a box with a colored left border and background fill.

### Modifications to LaTeX Primitives

None.

### Referenced Packages

Loaded by liTemElegXv2.4 under the `color` + `env` options. Depends on `tcolorbox` (enhanced mode) and the `entry` environment.

### Defined Colors

| Color Name | RGB | Purpose |
|-----------|-----|---------|
| `leanblue` | (0,0,255) | Keywords and punctuation |
| `sorry` | (255,0,0) | Reserved |
| `comment` | (0,128,0) | Comments |
| `string` | (163,21,21) | Strings |
| `num` | (9,134,88) | Numbers |
| `thname` | (121,94,38) | Theorem names |
| `background` | #EEEEEE | Background |
| `delim` | (20,105,176) | Delimiters |

### Defined Theorem Environments

Each environment is defined using `\NewDocumentEnvironment`. The main environments (`thm`, `dfn`, etc.) use the `{omoo}` parameter pattern:

- `#1` (optional): label key, used for `\label` with an auto-prefix (e.g. `thm:`)
- `#2` (mandatory): title text
- `#3` (optional): supplementary note, shown in parentheses beside the title
- `#4` (optional): unused in the body (reserved)

Some environments (e.g. `rmk`, `pbm`) have different parameter counts; refer to the source code for details.

| Short Name | Full Name | Border Color | Background Color | Notes |
|-----------|-----------|-------------|-----------------|-------|
| `axm` | Axiom | `yellow-` | `yellow+` | Yellow border |
| `dfn` | Definition | `green-` | `green+` | Green border |
| `ppt` | Property | `pink-` | `pink+` | Pink border |
| `lma` | Lemma | `blue-` | `blue+` | Blue border |
| `thm` | Theorem | `blue-` | `blue+` | Blue border |
| `crl` | Corollary | `purple-` | `purple+` | Purple border |
| `prf` | Proof | `grey-` | `grey+` | Unnumbered, grey border |
| `xmp` | Example | `purple-` | `purple+` | Purple border |
| `cxmp` | Counterexample | `red-` | `red+` | Red border |
| `rmk` | Remark | `orange-` | `orange+` | Orange border, no label argument |
| `pbm` | Problem | `blue-` | `blue+` | Blue border, supports counter reset |
| `slt` | Solution | `grey-` | `grey+` | Unnumbered, grey border |

#### Parameter Details (using `\begin{thm}` as example)

```latex
\begin{thm}[euclid-thm]{Euclidean Theorem}[Euclid]
  ... theorem content ...
\end{thm}
```

- `[euclid-thm]` (optional #1): label key, expands to `\label{thm:euclid-thm}`
- `{Euclidean Theorem}` (mandatory #2): title text
- `[Euclid]` (optional #3): supplementary note, shown as `(Euclid)`; if blank, ignored
- Optional #4 is unused in the body (reserved)

Some environments (e.g. `rmk` accepts only one optional argument; `pbm` uses its optional argument for counter reset; `prf` and `slt` take no arguments) differ; refer to the source code for details.

---

## Version History

| File | Version | Date | Description |
|------|---------|------|-------------|
| TemElegXv2.2 | v2.2 | 2025-08-22 | Original full package with ctex and inline font definitions |
| pTemElegX | v1.0 | 2025-08-25 | upLaTeX font mapping package |
| TemElegXcolor | v1.0 | 2025-08-25 | Color definitions |
| TemElegXref | v1.0 | 2025-08-30 | Hyperlink configuration |
| xeTemElegX | v1.0 | 2026-02-03 | Standalone XeLaTeX font configuration |
| liTemElegXv2.4 | v2.4 | 2026-02-06 | Lite core package, refactored from v2.2 |
| TemEnvX | *unmarked* | — | Colored theorem environments (paired with liTemElegXv2.4) |

---

## Usage Examples

### Basic Usage (XeLaTeX)

```latex
% Load the lite core package with options
\usepackage[
  geometry,
  fancy,
  font,
  color,
  graphicx,
  table,
  math,
  env,
  chem,
]{liTemElegXv2.4}

% For Chinese font support, additionally load
\usepackage{xeTemElegX}

% For hyperlink configuration
\usepackage{TemElegXref}
```

### Basic Usage (upLaTeX)

```latex
\usepackage{pTemElegX}
\usepackage[uplatex]{liTemElegXv2.4}
```
