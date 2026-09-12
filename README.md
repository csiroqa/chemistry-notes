# 化学笔记

## 内容结构

### 前置部分（`frontmatter/`）

| 篇 | 内容 | 文件 |
| --- | --- | --- |
| 序 | 文言序（含小字题识），不编号章，入目录 | `preface.tex` |

序用 `\input` 引入（非 `\include`）：`main.tex` 的 `\includeonly` 白名单会**静默跳过**未列出的 `\include`，序因此曾整篇不入 PDF。序无 `\label`，不需要独立 `.aux`，`\input` 足够。
`\frontmatter` 置于 `\tableofcontents` 之前，故序与目录用罗马数字页码，正文起于阿拉伯数字 1。

### 二〇二五学年第一学期（`chapters/2501/`）

| 章   | 内容                                                         | 文件                        |
| ---- | ------------------------------------------------------------ | --------------------------- |
| §3.0 | 基础知识复习（电解质、强弱电解质）                           | `2501-00.tex`               |
| §3.1 | 水的电离和溶液酸碱性（pH 计算体系）                          | `2501-01.tex`               |
| §3.2 | 弱电解质的电离平衡（电离度 $\alpha$、电离常数 $K_\text{i}$） | `2501-02.tex`               |
| §3.3 | 盐类水解（原理、规律、常数、双水解）                         | `2501-03.tex`               |
| 专题 | 溶液中的微粒浓度比较（三大守恒）                             | `2501-04.tex`               |
| §3.3 | 酸碱滴定（原理、仪器、指示剂、误差分析、氧化还原滴定）       | `2501-05.tex`               |
| §3.4 | 沉淀溶解平衡（溶度积 $K_\text{sp}$、沉淀生成与转化）         | `2501-06.tex`               |
| —    | （空占位文件）                                               | `2501-07.tex`               |
| §2.1 | VSEPR 理论与杂化轨道理论                                     | `2501-08.tex`               |
| §2.2 | 分子结构与物质性质（极性、范德华力、氢键）                   | `2501-09.tex`               |
| —    | （空占位文件）                                               | `2501-10.tex`               |

### 二〇二五学年第二学期（`chapters/2502/`）

| 章    | 内容                                               | 文件                   |
| ----- | -------------------------------------------------- | ---------------------- |
| 第2章 | **晶体结构与性质**                                 | `2502-crystal.tex`     |
|       | 晶体基本概念（自范性、各向异性）、晶胞与均摊法     |                        |
|       | 四类晶体（离子、共价、分子、金属）的对比与典型晶胞 |                        |
|       | 混合型晶体（石墨）、过渡晶体、密度计算、X 射线衍射 |                        |
| 第3章 | **化学反应与电能**                                 | `2502-electrochem.tex` |
| §3.1  | 氧化还原反应复习                                   | `2502-00.tex`          |
| §3.2  | 原电池（Zn-Cu、盐桥、离子交换膜、浓差电池）        | `2502-01.tex`          |
| §3.3  | 化学电源（锌锰/铅蓄/锂离子/燃料电池）              | `2502-02.tex`          |
| §3.4  | 电解池（放电顺序、精炼铜、电镀、氯碱工业）         | `2502-03.tex`          |
| §3.5  | 金属腐蚀与防护（吸氧/析氢、牺牲阳极、外加电流）    | `2502-04.tex`          |
| 专题  | 化合价与氧化还原配平（内容待核，暂空）             | `2502-05.tex`          |

实际教学顺序：有机基础（后半）→ 晶体 → 电化学（收尾）。

### 附录（`appendix/`）

| 附录 | 内容                   | 文件                    |
| ---- | ---------------------- | ----------------------- |
| A    | 元素周期表（PDF 占位） | `appendix-periodic.tex` |
| B    | 常用数据               | `appendix-data.tex`     |
| C    | 知识清单               | `appendix-concepts.tex` |
| D    | 公式清单               | `appendix-formulas.tex` |

## 编译方法

使用 LuaLaTeX（LuaHBTeX）编译（支持中文、microtype 完整生效），输出到 `TexMP/` 目录：

```bash
latexmk -lualatex -synctex=1 -outdir=TexMP main.tex
```

产物为 `TexMP/main.pdf`（A4 双面排版，附带 `main.synctex.gz` 供编辑器反向同步）。

**电子版 / 打印版颜色开关**：默认（电子版）PDF 保留红/蓝超链接颜色；需要打印版时，在项目根目录创建空文件 `printmode.txt` 后重新编译，链接颜色全部转黑（链接仍可点击）。`printmode.txt` 已加入 `.gitignore`。

首次编译会构建 luaotfload 字体缓存，耗时较长；之后增量编译很快。

## LuaLaTeX 字体

- 引擎改为 **LuaHBTeX**（`lualatex`），中文经 `ctex` + `luatexja` 排版，`microtype` 的凸出/伸缩完整生效。
- `LuaTemElegX.sty` 默认直接加载 `C:/Windows/Fonts/` 下的系统字体（思源宋体/黑体 ttc 用 `FontIndex=2` 取简体中文 face，霞鹜文楷、等距更纱黑体等）；若仓库根目录存在 `fonts/` 捆绑目录则优先使用（更便携，但体积约 388MB，不入库）。
- 若需在非 Windows 环境编译，请自行安装相应字体或提供 `fonts/` 捆绑。

## 依赖与环境

- **引擎**：LuaHBTeX（TeX Live 2026+，`lualatex`）
- **中文支持**：`ctex` 宏包（LuaLaTeX 下走 `luatexja`）+ 思源宋体/黑体、霞鹜文楷
- **排版基础**：New Computer Modern 系列西文字体
- **化学**：`mhchem` v4、`chemfig` 结构式
- **数学**：`unicode-math` + `fontsetup`（NewCMMath）、`siunitx` 单位
- **自定义宏包**：
  - `liTemElegXv2.4.sty` — 主样式（几何、页眉、数学、化学、表格、颜色等）
  - `LuaTemElegX.sty` — LuaLaTeX（LuaHBTeX）字体配置（luatexja + microtype + luacode），替代 `xeTemElegX`/`pTemElegX`
  - `TemEnvX.sty` — 定理/示例环境（`xmp`、`pbm`/`slt`、`dfn`、`rmk`、`thm` 等）
  - `TemElegXcolor.sty` — 自定义颜色
  - `preamble.tex` — `\cemh{}`、`\xleq{}`、`\conc{}`、`\cellfigph{}` 等便捷命令，以及打印版开关（`printmode.txt`）
  - `.vscode/settings.json` — LaTeX Workshop 的 `lualatexmk` 配方

### 自定义命令速查

| 命令                 | 用途                                         | 示例                        |
| -------------------- | -------------------------------------------- | --------------------------- |
| `\cemh{...}`         | 化学式（mhchem v4 封装），**禁用裸 `\ce{}`** | `\cemh{CuSO4}`              |
| `\xleq[上]{下}`      | 反应箭头＋上下标注                           | `\xleq[电解]{}`             |
| `\conc{Na+}`         | 浓度记号                                     | `c(\cemh{Na+})`             |
| `\SI{...}`           | 带单位数值                                   | `\SI{0.1}{\mole\per\litre}` |
| `\Circled{1}`        | 带圈数字                                     | `\Circled{1}`               |
| `\cmark` / `\hcmark` | 对勾 / 粗对勾                                |                             |
| `\cellfig{文件}{说明}` | 晶胞/位置贡献实图（`figures/crystal/*.pdf`，Mathematica 生成） | `\cellfig{cell-na-cl}{Cl⁻（绿）与 Na⁺（紫）}` |
| `\input{figures/electrochem/*.tikz}` | 电化学装置 TikZ 示意图（电解池/精炼铜/氯碱/保护法等） | `\input{figures/electrochem/fig-electrolytic-cell.tikz}` |

上下标注（ruby）统一使用文档惯例：`\overset{\text{标注}}{\text{正文}}`（上加字）与 `\underset{\text{标注}}{\text{正文}}`（下加字）。

## 目录说明

```tree
.
├── main.tex              # 主入口，前置＋两学期 part 结构
├── frontmatter/
│   └── preface.tex        # 序（文言，含小字题识；\input 引入）
├── preamble.tex           # 前导（宏包加载、自定义命令、打印版开关）
├── liTemElegXv2.4.sty     # 主样式宏包（当前采用）
├── LuaTemElegX.sty        # LuaLaTeX 字体配置（当前采用；xeTemElegX/pTemElegX 为旧版）
├── TemEnvX.sty            # 定理/示例环境定义
├── TemElegXcolor.sty      # 颜色定义
├── chapters/
│   ├── 2501.tex           # 第一学期章入口
│   ├── 2501/              # 第一学期各节
│   ├── 2502.tex           # 第二学期章入口
│   └── 2502/              # 第二学期各节（晶体＋电化学）
├── appendix/              # 附录（A 周期表、B 常用数据、C 知识清单、D 公式清单）
├── figures/               # 插图源（crystal/ 晶胞 PDF；electrochem/ 电化学装置 TikZ）
├── tools/                 # 脚本工具集（自解析路径，见 tools/README.md）
│   ├── notes_img/         # 手写笔记照片 → AI 识图就绪图片（主脚本 + qc/ + archive/）
│   ├── ppt/               # PPT/PPTX → 图片 + 文本 Markdown
│   └── tex/               # LaTeX 文稿生成脚本
├── 2501notes/             # 第一学期手写扫描 PDF 源
├── 2502notes/             # 第二学期手写扫描 PDF 源
├── .book/                 # 人教版教科书 PDF（参考）
├── .ppt/                  # PPT 源文件（参考）
│   └── PPT_Export_Results/ # PPT 导出 markdown 笔记
├── printmode.txt          # （可选）存在时输出打印版（链接颜色隐藏）
└── TexMP/                 # 编译输出目录（main.pdf、aux、synctex 等）
```

## 脚本工具

正文之外的一切脚本都在 `tools/` 下（曾经散落在仓库根），详见 [`tools/README.md`](tools/README.md)：

| 工具 | 命令（在仓库根执行） |
| --- | --- |
| 笔记照片 → AI 识图就绪图（**主力脚本**） | `python tools/notes_img/notes_ai_crop.py --only-new` |
| 管线 QC（量化/验收/预览） | `python tools/notes_img/qc/_qc_gen.py it32 --core` 等 |
| PPT → 图片 + 文本 Markdown | `python tools/ppt/ppt_to_ai_ready.py` |

脚本一律**自解析仓库根**（不硬编码机器路径，也不依赖当前工作目录），
数据目录（`notes.zz/`、`notes.zz.ai/`、`_qc/`）留在仓库根且不入库。

## 输出

编译得 `TexMP/main.pdf`，A4 双面排版；电子版默认彩色链接，打印版见上文 `printmode.txt` 开关。

## 特殊符号说明

〔〕标注漏字（补充）

（）标注衍字（删去）

## 许可

个人学习笔记，仅供学术参考。
