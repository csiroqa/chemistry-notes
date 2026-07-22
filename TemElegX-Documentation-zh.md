# TemElegX 家族文档

> TemElegX 是一个为 LaTeX 设计的模板家族，提供优雅的排版配置、数学支持、颜色主题和定理环境。
> 版本概览：liTemElegXv2.4（精简版核心包）、TemElegXv2.2（旧版完整包）、pTemElegX（pLaTeX/upLaTeX 传统排版）、xeTemElegX（XeLaTeX 字体配置）、TemElegXcolor（颜色定义）、TemElegXref（超链接配置）、TemEnvX（彩色定理环境）。

---

## liTemElegXv2.4.sty — 精简版核心包

本包是 TemElegX 家族的主入口，采用 kvoptions 选项机制，按需加载各功能模块。

### 对 LaTeX 原语的修改

无直接修改 LaTeX 底层原语的操作。

### 引用的宏包

**始终加载：**
| 宏包 | 用途 |
|------|------|
| `calc` | 长度计算 |
| `xparse` | 多参数命令定义 |
| `circledsteps` | 圆圈数字标记 |
| `ulem` (normalem, normalbf) | 下划线和强调 |
| `cancel` (thicklines) | 数学删除线 |
| `siunitx` | 物理单位排版 |
| `nicematrix` | 增强型矩阵 |
| `enumitem` | 列表项间距控制 |
| `kvoptions` | 键值选项系统 |

**按条件加载：**

| 选项 | 加载的宏包 |
|------|-----------|
| `geometry` | `geometry` |
| `fancy` | `fancyhdr` |
| `color` | `TemElegXcolor`, `tcolorbox` (most 库) |
| `font` | `amssymb`, `amsfonts` |
| `graphicx` | `graphicx` |
| `table` | `tabu`, `multirow`, `colortbl`, `makecell`, `booktabs`, `tabularx`, `arydshln` |
| `math` | `amsmath`, `amssymb`, `amsfonts`, `amsthm`, `fixdif`, `upgreek`, `mathtools`, `mathrsfs`；非 upLaTeX 时额外加载 `unicode-math`, `fontsetup` |
| `chem` | `chemfig`, `extarrows`, `mhchem` (v4) |
| `phys` | *预留* |
| `env` | 若开启 `color` 则加载 `TemEnvX`，否则使用 `\newtheorem` 定义基本定理环境 |

**AtEndPreamble 加载：**
- `circledtext`
- `circledsteps`
- `footmisc` (perpage, ragged, stable, hang, multiple)

### 对已有宏的修改

| 命令 | 修改内容 |
|------|---------|
| `\figurename` | 改为 **Fig.**（加粗） |
| `\tablename` | 改为 **Tab.**（加粗） |
| `\leq` | 重定义为 `\leqslant`（slant 版本） |
| `\geq` | 重定义为 `\geqslant`（slant 版本） |
| `\log` | 重载为智能加括号版本：`\log`（无参显示 "log"）、`\log{x}` 显示 `\log(x)`、`\log[2]{x}` 显示 `\log_2(x)` |
| `\ln` | 重载为智能加括号版本 |
| `\lg` | 重载为智能加括号版本 |
| `\title`（fancy 选项） | 保存标题到 `\thetitle`，用于页脚显示 |
| `\thefootnote` | 使用 `\circledtext` 将脚注编号圈起来 |
| `\@makefntext` | 使脚注标记不以上标形式出现在正文中 |

### 定义的宏

#### 通用
| 命令 | 含义 |
|------|------|
| `\n` | 等价于 `\par`，段落换行 |
| `\thetitle` | 存储文档标题（fancy 选项下） |
| `\settitle{标题}` | 设置 `\thetitle` 的值 |
| `\pic[宽度]` | 图片插入，默认宽度 0.8\textwidth |
| `\abs[表达式]` | 绝对值，自动伸缩竖线 |

#### 字体样式（font 选项）
| 命令 | 含义 |
|------|------|
| `\re{文本}` | 参考样式 (Reference)，等价于 `\textit` |
| `\co{文本}` | 概念样式 (Concept)，等价于 `\textsf` |

#### 数学符号（math 选项）

**数集黑板体：**
| 命令 | 含义 |
|------|------|
| `\HH` | 四元数集 `\mathbb{H}` |
| `\CC` | 复数集 `\mathbb{C}` |
| `\RR` | 实数集 `\mathbb{R}` |
| `\NN` | 自然数集 `\mathbb{N}` |
| `\QQ` | 有理数集 `\mathbb{Q}` |
| `\ZZ` | 整数集 `\mathbb{Z}` |

**常数与符号：**
| 命令 | 含义 |
|------|------|
| `\ii` | 虚数单位 `\mathrm{i}` |
| `\jj` | 虚数单位 `\mathrm{j}` |
| `\ee` | 自然常数 `\mathrm{e}` |
| `\diff` | 微分符号 `\d` |
| `\dotlessi` | 无点 i |
| `\dotlessj` | 无点 j |
| `\mrm` | 等价于 `\mathrm` |
| `\leqhorz` | 原始的横向 ≤（`\leq` 的备份） |
| `\geqhorz` | 原始的横向 ≥（`\geq` 的备份） |
| `\logd` | 对数运算符 "log" |
| `\lnd` | 自然对数运算符 "ln" |
| `\lbd` | 二进制对数运算符 "lb" |
| `\lgd` | 常用对数运算符 "lg" |
| `\lb[表达式]` | 二进制对数，智能加括号 |
| `\transpose{矩阵}` | 转置记号 `...^{\mathrm{T}}` |
| `\bbsc` | 切换到 Blackboard Bold StylisticSet 5 |

**导数命令：**
| 命令 | 含义 |
|------|------|
| `\deriv[阶数]{分子}{分母}` | 普通导数 `\d y/\d x`，支持高阶 |
| `\pderiv[阶数]{分子}{分母}` | 偏导数 `\partial y/\partial x` |
| `\mpderiv{函数}{变量1}{阶数1}{变量2}{阶数2}` | 混合偏导数 |
| `\upderiv[阶数]{分子}{分母}` | 直立体偏导符的导数 |
| `\mupderiv{函数}{变量1}{阶数1}{变量2}{阶数2}` | 直立体混合偏导数 |

#### 定理环境（env 选项，无 color 时）
| 环境 | 名称 |
|------|------|
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

#### 其他环境（color 选项）
| 环境 | 说明 |
|------|------|
| `entry{边框色}{背景色}` | 通用 tcolorbox 带左边框的盒子，增强模式，可跨页 |

---

## pTemElegX.sty — pLaTeX/upLaTeX 传统字体包

专为 upLaTeX 引擎设计的传统日文排版字体配置包，使用 Source Han 字体（思源宋体/黑体）通过 dvipdfmx 映射。

### 对 LaTeX 原语的修改

无直接修改。

### 引用的宏包

| 宏包 | 用途 |
|------|------|
| `kvoptions` | 键值选项系统 |
| `otf` (uplatex, deluxe, jis2004) | OpenType 字体支持 |
| `plext` | 纵组排版增强 |
| `plautopatch` | pLaTeX 补丁 |
| `pxufont` | upLaTeX 字体定义 |

### 定义的宏

| 命令 | 含义 |
|------|------|
| `\ujlreq` | jlreq 字体族（基于 ujlreq 字体），细明体风格 |
| `\ujlreqg` | jlreqg 字体族（基于 ujlreqg 字体），哥特体风格 |
| `\currentpTemElegXindex` | 返回当前的字体索引值（由 `index` 选项指定，默认 2） |

### 字体映射

通过 `\AtBeginDvi` 和 `\special{pdf:mapline}` 将以下 upLaTeX 字体映射到 Source Han 字体系列：

| 虚拟字体名称 | 映射字体 |
|-------------|---------|
| `uphminl` / `uphminln` | SourceHanSerif-Light.ttc（宋体 细体） |
| `uphminr` / `uphminrn` | SourceHanSerif-Regular.ttc（宋体 常规） |
| `uphminb` / `uphminbn` | SourceHanSerif-Bold.ttc（宋体 粗体） |
| `uphgothr` / `uphgothrn` | SourceHanSans-Regular.ttc（黑体 常规） |
| `uphgothb` / `uphgothbn` | SourceHanSans-Bold.ttc（黑体 粗体） |
| `uphgotheb` / `uphgothebn` | SourceHanSans-Heavy.ttc（黑体 特粗） |
| `uphmgothr` / `uphmgothrn` | SourceHanSans-Medium.ttc（黑体 中等） |

每个字体的横排 (‑h) 和纵排 (‑v) 版本均单独映射，纵排版本带 `-w 1` 参数。

### 选项

| 选项 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `index` | 字符串 | `2` | Source Han 字体的 region 索引（0=jp, 1=kr, 2=sc, 3=tc, 4=hc） |

---

## TemElegXcolor.sty — 颜色定义包

### 对 LaTeX 原语的修改

无。

### 引用的宏包

| 宏包 | 用途 |
|------|------|
| `xcolor` (dvipsnames, svgnames, x11names) | 颜色系统 |

### 定义的宏

| 命令 | 含义 |
|------|------|
| `\bacolor{颜色}{内容}` | 等价于 `\colorbox`，背景着色 |
| `\tecolor{颜色}{内容}` | 等价于 `\textcolor`，文字着色 |

### 定义的颜色

**基本色调（各含深色和浅色两档）：**

| 颜色名称 | 深色 (‑) | 浅色 (+) |
|---------|----------|----------|
| `green` | `#119927` | `#e7fceb` |
| `blue` | `#00579b` | `#d6edff` |
| `pink` | `#ff28ff` | `#ffd9ff` |
| `orange` | `#e07c00` | `#fff1e0` |
| `purple` | `#7700e5` | `#f3e5ff` |
| `red` | `#d00023` | `#ffe4e8` |
| `grey` | `#787878` | `#eeeeee` |
| `yellow` | `#d8d800` | `#ffffd8` |

**动画主题色：**

| 作品 | 颜色列表 |
|------|---------|
| 魔法少女小圆 | `anime-madoka-init`, `anime-madoka-homura`, `anime-madoka-sayaka`, `anime-madoka-mami`, `anime-madoka-kyouko`, `anime-madoka-qb` |
| 请问您今天要来点兔子吗 | `anime-gotyuumon-init`, `anime-gotyuumon-kokoa`, `anime-gotyuumon-tino`, `anime-gotyuumon-rize`, `anime-gotyuumon-tiya`, `anime-gotyuumon-syaro`, `anime-gotyuumon-maya`, `anime-gotyuumon-megumi`, `anime-gotyuumon-aoyama`, `anime-gotyuumon-rin`, `anime-gotyuumon-moka`, `anime-gotyuumon-tippi`, `anime-gotyuumon-anko`, `anime-gotyuumon-wildg` |
| K-ON! 轻音少女 | `anime-k-on-init`, `anime-k-on-yui`, `anime-k-on-mio`, `anime-k-on-ritu`, `anime-k-on-tumugi`, `anime-k-on-azusa` |
| 孤独摇滚！ | `anime-botti-init`, `anime-botti-hitori`, `anime-botti-hazika`, `anime-botti-ryou`, `anime-botti-ikuyo`, `anime-botti-kikuri` |
| BanG Dream! It's MyGO!!!!! | `anime-mygo-init`, `anime-mygo-tomori`, `anime-mygo-anon`, `anime-mygo-raana`, `anime-mygo-soyo`, `anime-mygo-taki` |
| BanG Dream! Ave Mujica | `anime-mujica-init`, `anime-mujica-uika`, `anime-mujica-mutimi`, `anime-mujica-umiri`, `anime-mujica-nyamu`, `anime-mujica-sakiko` |

**旗帜颜色：**
| 颜色名称 | 说明 |
|---------|------|
| `Asia-PRC-red`, `Asia-PRC-yellow` | 中华人民共和国 |
| `Asia-ROC1-red`, `Asia-ROC2-yellow`, `Asia-ROC3-blue`, ... | 中华民国 |
| `Asia-Qing-*` | 大清 |
| `Asia-Japan-red` | 日本 |
| `Asia-ROK-*` | 韩国 |
| `Asia-DPRK-*` | 朝鲜 |
| `Europe-EU-*` | 欧盟 |
| `Europe-Austria-yellow` | 奥地利 |
| `Europe-Ottoman-red` | 奥斯曼帝国 |
| `Europe-UK-*` | 英国 |
| `Europe-RF-*` | 俄罗斯联邦 |
| `Europe-HR-blue` | 克罗地亚 |
| `Europe-Byzantine-*` | 拜占庭帝国 |
| `Europe-RI-*` | 意大利 |
| `Europe-FRG-*` | 德国（联邦） |
| `Europe-FR-*` | 法国 |
| `America-NATO-blue` | 北约 |
| `America-USA-*` | 美国 |

**跨性别旗帜色：** `tblue` (`#5BCEFA`), `tpink` (`#F5A9B8`)

---

## TemElegXref.sty — 超链接配置包

### 对 LaTeX 原语的修改

无。

### 引用的宏包

| 宏包 | 用途 |
|------|------|
| `hyperref` | 超链接，PDF 书签，文档属性 |
| `bookmark` | 增强的书签支持 |

### 配置说明

本包不定义新命令，仅在加载 `hyperref` 时通过选项设置 PDF 行为：

- 隐藏 PDF 工具栏，显示菜单栏
- 在 PDF 中生成带编号的书签
- 彩色链接（链接、文件、URL 和引用均着彩色）
- PDF 起始视图为适合页面
- 双面打印长边翻转
- 页面布局为 `TwoPageLeft`（双页对开，奇数页在左）

---

## TemElegXv2.2.sty — 旧版完整包（v2.2）

*注：此为 liTemElegXv2.4 的前身，功能基本被精简版继承并重构；以下只列出其特有内容。*

### 对 LaTeX 原语的修改

无直接修改。

### 引用的宏包

与 liTemElegXv2.4 大部分相同，但有以下区别：
- 加载 `ctex` (UTF8, fontset=none) 和 `fontspec` (no-math)
- 使用 `xcolor` 而非独立的 `TemElegXcolor.sty`
- 直接定义 `\bacolor` 和 `\tecolor` 而非调用颜色包
- AtEndPreamble 使用 `hyperref` + `bookmark` 而非 `TemElegXref.sty`

### 对已有宏的修改

与 liTemElegXv2.4 相同的内容不再重复，以下为 v2.2 独有的：

| 命令 | 修改内容 |
|------|---------|
| `\TeX` | 重定距的 TeX 标志 |
| `\LaTeX` | 重定距的 LaTeX 标志 |

### 定义的宏

v2.2 独有的宏：

| 命令 | 含义 |
|------|------|
| `\subsubsubsection{标题}` | 四级标题（等价于 `\paragraph`） |
| `\Circ{内容}` | 与 `\circledsteps` 的 `\Circled` 相同，左右加小间距 |
| `\XeLaTeX` | XeLaTeX 标志 |
| `\LuaLaTeX` | LuaLaTeX 标志 |
| `\ciratio` | 直立 π 符号（同 `\ppi`） |
| `\ppi` | 直立 π 符号 `\symup{\pi}` |

**v2.2 字体定义（在 `xeTemElegX.sty` 中也出现）：**

拉丁文字体通过 `fontspec` 和 `\newfontfamily` 定义（NewCM 系列）；CJK 字体通过 ctex 和 `\newCJKfontfamily` 定义。具体见 `xeTemElegX.sty` 节。

---

## xeTemElegX.sty — XeLaTeX 字体配置包

独立的 XeLaTeX 字体方案，定义了完整的正文、无衬线、等宽和 CJK 字体集。

### 对 LaTeX 原语的修改

无直接修改。

### 引用的宏包

| 宏包 | 用途 |
|------|------|
| `amssymb`, `amsfonts` | 数学符号 |
| `fontspec` (no-math) | 字体选择 |
| `ctex` (UTF8, fontset=none) | 中文支持 |
| `xeCJK` | CJK 字体自动回退和间距 |

### 对已有宏的修改

| 命令 | 修改内容 |
|------|---------|
| `\TeX` | 调整字母间距和升降的 TeX 标志 |
| `\LaTeX` | 调整字母间距和升降的 LaTeX 标志 |

### 定义的宏

#### 引擎标志
| 命令 | 含义 |
|------|------|
| `\XeLaTeX` | XeLaTeX 标志 |
| `\LuaLaTeX` | LuaLaTeX 标志 |
| `\lgrquotes` | 左双引号字形 `\char"201C` |
| `\rgrquotes` | 右双引号字形 `\char"201E` |

#### 默认字体设置

| 字体类型 | 字体名称 |
|---------|---------|
| 正文罗马体 | NewCM10-Regular.otf（斜体、粗体、粗斜体各指定） |
| 无衬线体 | NewCMSans10-Regular.otf |
| 等宽体 | NewCMMono10-Regular.otf |
| CJK 罗马体 | 思源宋体 Light（粗体=思源宋体 SemiBold，斜体=霞鹜文楷 GB Light） |
| CJK 无衬线 | 思源黑体 Light（粗体=思源黑体 Medium） |
| CJK 等宽 | 等距更纱黑体 Slab SC |

#### 拉丁辅助字体
| 字体命令 | 字体 |
|---------|------|
| `\gentium` | Gentium Plus |
| `\genbook` | Gentium Book Plus |
| `\sserif` | Source Serif 4 |
| `\ssans` | Source Sans 3 |
| `\cascadia` | Cascadia Mono |
| `\sarasa` | Sarasa Fixed Slab SC |

#### 特殊脚本字体
| 字体命令 | 说明 |
|---------|------|
| `\sanskrittext` | 天城文梵语（NewCM10Devanagari） |
| `\greek` | 希腊文（CharacterVariant=4, StylisticSet=7） |
| `\greeksans` | 希腊文无衬线（CharacterVariant=4, StylisticSet=6+7） |
| `\russian` | 俄文西里尔（CharacterVariant=3） |
| `\russiansans` | 俄文西里尔无衬线（CharacterVariant=3） |
| `\ipafont` | 国际音标（StylisticSet=5） |
| `\textca` | 加拿大原住民音节文字 |
| `\newcmgreekguillemots` | 带法式引号的希腊文 |
| `\newcmrussianguillemots` | 带法式引号的俄文 |
| `\showtiefont` | CharacterVariant=5 样式 |

#### CJK 字重变体

**宋体系列（基于思源宋体）：**
| 命令 | 字重 | 说明 |
|------|------|------|
| `\song` | Light / SemiBold | 默认宋体 |
| `\xbs` | ExtraLight | 小标宋 |
| `\bs` | Regular | 标宋 |
| `\das` | Medium | 大宋 |
| `\cus` | Heavy | 粗宋 |

**黑体系列（基于思源黑体）：**
| 命令 | 字重 | 说明 |
|------|------|------|
| `\hei` | Light / Medium | 默认黑体 |
| `\xih` | ExtraLight | 细黑 |
| `\bh` | Normal | 标黑 |
| `\dah` | Regular | 大黑 |
| `\cuh` | Heavy | 粗黑 |

**楷体系列（基于霞鹜文楷）：**
| 命令 | 字重 | 说明 |
|------|------|------|
| `\kai` | Regular | 标准楷体 |
| `\xik` | Light | 细楷 |
| `\cuk` | Medium | 粗楷 |

**方正字体（注意商业授权）：**
| 命令 | 字体 |
|------|------|
| `\fzfs` | FZFangSong-Z02（仿宋） |
| `\fzss` | FZShuSong-Z01（书宋） |
| `\fzkt` | FZKai-Z03（楷体） |

**混合用途：**
| 命令 | 字体配置 |
|------|---------|
| `\cre` | 霞鹜文楷 GB Light（粗体=Medium），用于中文参考 |
| `\cco` | 思源黑体 Light（粗体=Regular），用于中文概念 |

---

## TemEnvX.sty — 彩色定理环境包

tcolorbox 驱动的彩色定理环境集合，需搭配 `TemElegXcolor.sty` 使用。每个环境以带颜色左边框的盒子和颜色背景呈现。

### 对 LaTeX 原语的修改

无。

### 引用的宏包

由 liTemElegXv2.4 在 `color` 和 `env` 选项下代为调用，依赖 `tcolorbox`（enhanced 模式）和 `entry` 环境。

### 定义的颜色

| 颜色名 | RGB | 用途 |
|--------|-----|------|
| `leanblue` | (0,0,255) | 关键字/标点色 |
| `sorry` | (255,0,0) | 留作他用 |
| `comment` | (0,128,0) | 注释色 |
| `string` | (163,21,21) | 字符串色 |
| `num` | (9,134,88) | 数字色 |
| `thname` | (121,94,38) | 定理名色 |
| `background` | #EEEEEE | 背景色 |
| `delim` | (20,105,176) | 定界符色 |

### 定义的定理环境

每个定理环境使用 `\NewDocumentEnvironment` 定义，其中 `thm`、`dfn` 等主要环境参数格式为 `{omoo}`：
- `#1`（可选）：标签名，用于 `\label`，自动加上环境名前缀（如 `thm:`）
- `#2`（必选）：标题文字
- `#3`（可选）：补充说明，显示在标题旁的括号中
- `#4`（可选）：未在体内使用（保留）

部分环境（如 `rmk`、`pbm`）的参数个数有所不同，具体请参考源码。

| 环境名 (缩写) | 完整定理名 | 边框色 | 背景色 | 说明 |
|-------------|-----------|--------|--------|------|
| `axm` | Axiom（公理） | `yellow-` | `yellow+` | 黄色边框 |
| `dfn` | Definition（定义） | `green-` | `green+` | 绿色边框 |
| `ppt` | Property（性质） | `pink-` | `pink+` | 粉色边框 |
| `lma` | Lemma（引理） | `blue-` | `blue+` | 蓝色边框 |
| `thm` | Theorem（定理） | `blue-` | `blue+` | 蓝色边框 |
| `crl` | Corollary（推论） | `purple-` | `purple+` | 紫色边框 |
| `prf` | Proof（证明） | `grey-` | `grey+` | 灰色边框，无编号 |
| `xmp` | Example（例子） | `purple-` | `purple+` | 紫色边框 |
| `cxmp` | Counterexample（反例） | `red-` | `red+` | 红色边框 |
| `rmk` | Remark（备注） | `orange-` | `orange+` | 橙色边框，无标签参数 |
| `pbm` | Problem（问题） | `blue-` | `blue+` | 蓝色边框，支持编号复位 |
| `slt` | Solution（解答） | `grey-` | `grey+` | 灰色边框，无编号 |

#### 参数格式详解（以 `\begin{thm}` 为例）

```latex
\begin{thm}[euclid-thm]{欧几里得定理}[Euclid]
  ... 定理内容 ...
\end{thm}
```

- `[euclid-thm]`（可选 #1）：标签名，展开为 `\label{thm:euclid-thm}`
- `{欧几里得定理}`（必选 #2）：标题文字
- `[Euclid]`（可选 #3）：补充说明，显示为 `(Euclid)`，若为空则忽略

部分环境（如 `rmk` 仅接受一个可选参数；`pbm` 的可选参数用于重置计数器；`prf`、`slt` 无参数），具体请参考源码。

---

## 版本历史

| 文件 | 版本 | 日期 | 说明 |
|------|------|------|------|
| TemElegXv2.2 | v2.2 | 2025-08-22 | 原版完整包，含 ctex 和直接字体定义 |
| pTemElegX | v1.0 | 2025-08-25 | upLaTeX 字体映射包 |
| TemElegXcolor | v1.0 | 2025-08-25 | 颜色定义 |
| TemElegXref | v1.0 | 2025-08-30 | 超链接配置 |
| xeTemElegX | v1.0 | 2026-02-03 | XeLaTeX 字体配置独立包 |
| liTemElegXv2.4 | v2.4 | 2026-02-06 | 精简版核心包，重构自 v2.2 |
| TemEnvX | *未标注* | — | 彩色定理环境（与 liTemElegXv2.4 配合） |

---

## 使用示例

### 基本用法（XeLaTeX）

```latex
% 使用精简版核心包
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

% 如需要中文字体，额外加载
\usepackage{xeTemElegX}

% 如需超链接配置
\usepackage{TemElegXref}
```

### 基本用法（upLaTeX）

```latex
\usepackage{pTemElegX}
\usepackage[uplatex]{liTemElegXv2.4}
```
