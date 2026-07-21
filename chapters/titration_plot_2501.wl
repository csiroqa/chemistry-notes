(* titration_plot_2501.wl
   生成 0.1M NaOH 滴定 20.00 mL 0.1M HCl 的 pH 曲线，
   并在当量点处绘制指示剂变色带（甲基橙/甲基红/酚酞），导出 PDF。 
   在 Mathematica/ WolframScript 中运行此脚本：
     MathKernel.exe -script titration_plot_2501.wl
   或在 Notebook 中粘贴并运行。
*)

(* 参数 *)
Ca = 0.10; (* HCl mol/L *)
VaML = 20.00; (* 初始 HCl 体积, mL *)
Va = VaML/1000.; (* L *)
Cb = 0.10; (* NaOH mol/L *)
Kw = 1.0*10^-14;

(* 字体设置：首选思源黑体，若系统中名称不同请替换为本地安装名（如 "Source Han Sans SC" 或 "Noto Sans CJK SC"） *)
fontName = "Source Han Sans SC";

(* 计算 pH 的分段函数（参数 Vml 单位 mL） *)
pHofV[Vml_] := Module[{V = Vml/1000., nA = Ca Va, nB, Vt, h, oh, eps = 1.*10^-8},
  nB = Cb V; Vt = Va + V;
  (* 残余质子浓度（正为 H+，负为过量 OH- 的负值） *)
  h = (nA - nB)/Vt;
  (* 设定阈值：当 |h| 非常小时由水的自电离决定，避免数值发散导致绘图断裂 *)
  Which[
    h > eps, (* 明显酸性区 *) -Log10[h],
    h < -eps, (* 明显碱性区 *) (14 + Log10[-h]),
    True, (* 接近当量点，用水的自离子浓度近似 pH=7，保证连续性 *) 7.0
  ]
];

(* 绘图范围与当量点 *)
Vmax = 40; Ve = VaML; (* mL *)

curvePlot = Plot[pHofV[V], {V, 0, Vmax}, PlotRange -> {0, 14},
  AxesLabel -> {"V (mL)", "pH"}, PlotStyle -> {Thick, Black},
  GridLines -> None, ImageSize -> 600,
  PlotPoints -> 300, MaxRecursion -> 6, Exclusions -> None, PerformanceGoal -> "Quality",
  BaseStyle -> {FontFamily -> fontName}, LabelStyle -> {FontFamily -> fontName}];

(* 指示剂变色范围（取自表格） *)
moRange = {3.1, 4.4}; (* 甲基橙 *)
mrRange = {4.4, 6.2}; (* 甲基红 *)
phRange = {8.0, 10.0}; (* 酚酞 *)

(* 指示剂带在 x 方向上精确定位并缩窄到 ±0.6 mL *)
xHalf = 0.6; xLeft = Ve - xHalf; xRight = Ve + xHalf; (* mL *)

indicatorRects = {
  Opacity[0.5], Orange, EdgeForm[None],
    Rectangle[{xLeft, moRange[[1]]}, {xRight, moRange[[2]]}],
  Opacity[0.5], Red, EdgeForm[None],
    Rectangle[{xLeft, mrRange[[1]]}, {xRight, mrRange[[2]]}],
  Opacity[0.45], Magenta, EdgeForm[None],
    Rectangle[{xLeft, phRange[[1]]}, {xRight, phRange[[2]]}]
};

(* 标注：横虚线 pH=7，竖虚线 V=Ve，以及指示剂文字和数值标记 *)
annotations = {
  Dashed, GrayLevel[0.6], Line[{{0, 7}, {Vmax, 7}}], (* 水平虚线 pH=7 *)
  Dashed, GrayLevel[0.6], Line[{{Ve, 0}, {Ve, 14}}],   (* 垂直虚线 当量体积 *)

  (* 指示剂文本（无箭头）置于指示带右侧 *)
  Text[Style["甲基橙", FontSize -> 14, Orange, FontFamily -> fontName], {xRight + 1.8, Mean[moRange]}],
  Text[Style["甲基红", FontSize -> 14, Red, FontFamily -> fontName], {xRight + 1.8, Mean[mrRange]}],
  Text[Style["酚酞", FontSize -> 14, Magenta, FontFamily -> fontName], {xRight + 1.8, Mean[phRange]}],

  (* 在指示剂带处画短横线并标注代表 pH 值（更精确地靠近当量处） *)
  Thick, Black,
    Line[{{Ve - 0.35, 4.3}, {Ve + 0.35, 4.3}}],
    Text[Style["4.3", 14, FontFamily -> fontName], {Ve - 1.0, 4.3}],

  Line[{{Ve - 0.35, 9.7}, {Ve + 0.35, 9.7}}],
    Text[Style["9.7", 14, FontFamily -> fontName], {Ve - 1.0, 9.7}],

  (* 图例注释：pH 突跃，放在当量点 (Ve,7) 的右侧 *)
  Text[Style["pH突跃", 20, Bold, FontFamily -> fontName], {Ve + 2.8, 7}]
};

finalGraphics = Show[curvePlot,
  Graphics[{indicatorRects, annotations}],
  PlotRange -> {{0, Vmax}, {0, 14}}, ImageSize -> 800];

(* 导出 PDF 到 chapters 文件夹 *)
Export["chapters/titration_indicators_2501.pdf", finalGraphics, ImageResolution -> 300];

(* 也导出 PNG 便于预览 *)
Export["chapters/titration_indicators_2501.png", finalGraphics, ImageResolution -> 300];

Print["导出完成: chapters/titration_indicators_2501.pdf 和 .png"];

(* 显示图像（在 Notebook 中运行时会显示） *)
finalGraphics
