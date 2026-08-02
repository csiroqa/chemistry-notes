(* ::Package:: *)

(* titration_plot_2501.wl
   \:751f\:6210 0.1M NaOH \:6ef4\:5b9a 20.00 mL 0.1M HCl \:7684 pH \:66f2\:7ebf\:ff0c
   \:5e76\:5728\:5f53\:91cf\:70b9\:5904\:7ed8\:5236\:6307\:793a\:5242\:53d8\:8272\:5e26\:ff08\:7532\:57fa\:6a59/\:7532\:57fa\:7ea2/\:915a\:915e\:ff09\:ff0c\:5bfc\:51fa PDF\:3002 
   \:5728 Mathematica/ WolframScript \:4e2d\:8fd0\:884c\:6b64\:811a\:672c\:ff1a
     MathKernel.exe -script titration_plot_2501.wl
*)

(* \:53c2\:6570 *)
Ca = 0.10; (* HCl mol/L *)
VaML = 20.00; (* \:521d\:59cb HCl \:4f53\:79ef, mL *)
Va = VaML/1000.; (* L *)
Cb = 0.10; (* NaOH mol/L *)
Kw = 1.0*10^-14;

(* \:5b57\:4f53\:8bbe\:7f6e\:ff1a\:9996\:9009\:601d\:6e90\:9ed1\:4f53\:ff0c\:82e5\:7cfb\:7edf\:4e2d\:540d\:79f0\:4e0d\:540c\:8bf7\:66ff\:6362\:4e3a\:672c\:5730\:5b89\:88c5\:540d\:ff08\:5982 "Source Han Sans SC" \:6216 "Noto Sans CJK SC"\:ff09 *)
fontName = "NewComputerModernSans10";
serifFont = "NewComputerModern10";  (* V \:7528\:886c\:7ebf\:659c\:4f53 *)
mathFont = "NewComputerModernMath"; (* \:22c5 \:70b9\:4e58\:7528 NewCM \:6570\:5b66\:5b57\:4f53\:6e32\:67d3 *)

(* \:8ba1\:7b97 pH \:7684\:5206\:6bb5\:51fd\:6570\:ff08\:53c2\:6570 Vml \:5355\:4f4d mL\:ff09 *)
pHofV[Vml_] := Module[{V = Vml/1000., nA = Ca Va, nB, Vt, h, oh, eps = 1.*10^-8},
  nB = Cb V; Vt = Va + V;
  (* \:6b8b\:4f59\:8d28\:5b50\:6d53\:5ea6\:ff08\:6b63\:4e3a H+\:ff0c\:8d1f\:4e3a\:8fc7\:91cf OH- \:7684\:8d1f\:503c\:ff09 *)
  h = (nA - nB)/Vt;
  (* \:8bbe\:5b9a\:9608\:503c\:ff1a\:5f53 |h| \:975e\:5e38\:5c0f\:65f6\:7531\:6c34\:7684\:81ea\:7535\:79bb\:51b3\:5b9a\:ff0c\:907f\:514d\:6570\:503c\:53d1\:6563\:5bfc\:81f4\:7ed8\:56fe\:65ad\:88c2 *)
  Which[
    h > eps, (* \:660e\:663e\:9178\:6027\:533a *) -Log10[h],
    h < -eps, (* \:660e\:663e\:78b1\:6027\:533a *) (14 + Log10[-h]),
    True, (* \:63a5\:8fd1\:5f53\:91cf\:70b9\:ff0c\:7528\:6c34\:7684\:81ea\:79bb\:5b50\:6d53\:5ea6\:8fd1\:4f3c pH=7\:ff0c\:4fdd\:8bc1\:8fde\:7eed\:6027 *) 7.0
  ]
];

(* \:7ed8\:56fe\:8303\:56f4\:4e0e\:5f53\:91cf\:70b9 *)
Vmax = 40; Ve = VaML; (* mL *)

curvePlot = Plot[pHofV[V], {V, 0, Vmax}, PlotRange -> {0, 14},
  Frame -> True, Axes -> False,
  FrameLabel -> {Row[{Style["V", Italic, FontFamily -> serifFont], Style["\:22c5", FontFamily -> mathFont], Superscript[Style["mL", FontFamily -> fontName], Style["\[Dash]1", FontFamily -> fontName]]}], "pH"}, PlotStyle -> {Thick, Black},
  GridLines -> None, ImageSize -> 600,
  PlotPoints -> 300, MaxRecursion -> 6, Exclusions -> None, PerformanceGoal -> "Quality",
  BaseStyle -> {FontFamily -> fontName}, LabelStyle -> {FontFamily -> fontName, FontSize -> 16}];

(* \:6307\:793a\:5242\:53d8\:8272\:8303\:56f4\:ff08\:53d6\:81ea\:8868\:683c\:ff09 *)
moRange = {3.1, 4.4}; (* \:7532\:57fa\:6a59 *)
mrRange = {4.4, 6.2}; (* \:7532\:57fa\:7ea2 *)
phRange = {8.0, 10.0}; (* \:915a\:915e *)

(* \:6307\:793a\:5242\:5e26\:5728 x \:65b9\:5411\:4e0a\:7cbe\:786e\:5b9a\:4f4d\:5e76\:7f29\:7a84\:5230 \[PlusMinus]0.6 mL *)
xHalf = 0.6; xLeft = Ve - xHalf; xRight = Ve + xHalf; (* mL *)

indicatorRects = {
  Opacity[0.5], Orange, EdgeForm[None],
    Rectangle[{xLeft, moRange[[1]]}, {xRight, moRange[[2]]}],
  Opacity[0.5], Red, EdgeForm[None],
    Rectangle[{xLeft, mrRange[[1]]}, {xRight, mrRange[[2]]}],
  Opacity[0.45], Magenta, EdgeForm[None],
    Rectangle[{xLeft, phRange[[1]]}, {xRight, phRange[[2]]}]
};

(* \:6807\:6ce8\:ff1a\:6a2a\:865a\:7ebf pH=7\:ff0c\:7ad6\:865a\:7ebf V=Ve\:ff0c\:4ee5\:53ca\:6307\:793a\:5242\:6587\:5b57\:548c\:6570\:503c\:6807\:8bb0 *)
annotations = {
  Dashed, GrayLevel[0.6], Line[{{0, 7}, {Vmax, 7}}], (* \:6c34\:5e73\:865a\:7ebf pH=7 *)
  Dashed, GrayLevel[0.6], Line[{{Ve, 0}, {Ve, 14}}],   (* \:5782\:76f4\:865a\:7ebf \:5f53\:91cf\:4f53\:79ef *)

  (* \:6307\:793a\:5242\:6587\:672c\:ff08\:65e0\:7bad\:5934\:ff09\:7f6e\:4e8e\:6307\:793a\:5e26\:53f3\:4fa7 *)
  Text[Style["Methyl Orange", FontSize -> 16, Orange, FontFamily -> fontName], {xRight + 0.8, Mean[moRange]}, {Left, Center}],
  Text[Style["Methyl Red", FontSize -> 16, Red, FontFamily -> fontName], {xRight + 0.8, Mean[mrRange]}, {Left, Center}],
  Text[Style["Phenolphthalein", FontSize -> 16, Magenta, FontFamily -> fontName], {xRight + 0.8, Mean[phRange]}, {Left, Center}],

  (* \:5728\:6307\:793a\:5242\:5e26\:5904\:753b\:77ed\:6a2a\:7ebf\:5e76\:6807\:6ce8\:4ee3\:8868 pH \:503c\:ff08\:66f4\:7cbe\:786e\:5730\:9760\:8fd1\:5f53\:91cf\:5904\:ff09 *)
  Thick, Black,
    Line[{{Ve - 0.35, 4.3}, {Ve + 0.35, 4.3}}],
    Text[Style["4.3", 14, FontFamily -> fontName], {Ve - 1.0, 4.3}],

  Line[{{Ve - 0.35, 9.7}, {Ve + 0.35, 9.7}}],
    Text[Style["9.7", 14, FontFamily -> fontName], {Ve - 1.0, 9.7}],

  (* \:56fe\:4f8b\:6ce8\:91ca\:ff1apH \:7a81\:8dc3\:ff0c\:653e\:5728\:5f53\:91cf\:70b9 (Ve,7) \:7684\:53f3\:4fa7 *)
  Text[Style["pH Jump", 20, Bold, FontFamily -> fontName], {Ve + 0.8, 7}, {Left, Center}]
};

finalGraphics = Show[curvePlot,
  Graphics[{indicatorRects, annotations}],
  PlotRange -> {{0, Vmax}, {0, 14}}, ImageSize -> 800];

(* \:5bfc\:51fa PDF \:5230 chapters \:6587\:4ef6\:5939 *)
Export["chapters/titration_indicators_2501.pdf", finalGraphics, ImageResolution -> 300];

(* \:4e5f\:5bfc\:51fa PNG \:4fbf\:4e8e\:9884\:89c8 *)
Export["chapters/titration_indicators_2501.png", finalGraphics, ImageResolution -> 300];

Print["\:5bfc\:51fa\:5b8c\:6210: chapters/titration_indicators_2501.pdf \:548c .png"];

(* \:663e\:793a\:56fe\:50cf\:ff08\:5728 Notebook \:4e2d\:8fd0\:884c\:65f6\:4f1a\:663e\:793a\:ff09 *)
finalGraphics
