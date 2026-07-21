(* titration_acetic_2501.wl
   生成 0.1 mol/L NaOH 滴定 0.1 mol/L 醋酸 (CH3COOH) 的 pH-体积曲线，
   并导出 PDF、PNG 与 CSV
   在 Mathematica/ WolframScript 中运行：
     MathKernel.exe -script titration_acetic_2501.wl
   或使用 wolframscript：
     wolframscript -file titration_acetic_2501.wl
*)

(* 参数 *)
Ca = 0.10; (* CH3COOH mol/L *)
VaML = 20.00; (* 初始醋酸体积, mL *)
Va = VaML/1000.; (* L *)
Cb = 0.10; (* NaOH mol/L *)
Ka = 1.8*10^-5; (* 醋酸 Ka *)
Kw = 1.0*10^-14;

(* pH 计算函数 (Vml 单位 mL) *)
pHofV[Vml_] := Module[{V = Vml/1000., nA, nB, Vt, NaConc, CT, f, Hinit, solH, H},
  nA = Ca*Va; nB = Cb*V; Vt = Va + V;
  NaConc = nB/Vt; (* [Na+] 来自加入的 NaOH *)
  CT = nA/Vt;    (* 醋酸/醋酸根总浓度 *)

  (* 定义电中性方程 f(H) = 0: Na + H - Aminus(H) - OH(H) = 0
     其中 Aminus(H) = Ka*CT/(H + Ka), OH(H) = Kw/H *)
  f[H_?NumericQ] := NaConc + H - (Ka*CT)/(H + Ka) - Kw/H;

  (* 扫描幂级 H 值以寻找符号变化，找到后用 Brent 有界方法求根，保证稳定且唯一 *)
  Module[{Hvals, signs, idx = None, i, Hlow, Hhigh, trySol = $Failed},
    Hvals = Table[10.^k, {k, -14, 0, 0.25}];
    signs = f /@ Hvals;
    For[i = 1, i < Length[Hvals], i++,
      If[signs[[i]]*signs[[i + 1]] < 0,
        idx = i; Break[];
      ]
    ];
    If[idx =!= None,
      Hlow = Hvals[[idx]]; Hhigh = Hvals[[idx + 1]];
      trySol = Quiet@Check[H /. FindRoot[f[H] == 0, {H, Hlow, Hhigh}, Method -> "Brent", MaxIterations -> 200], $Failed];
    ];

    If[trySol === $Failed || ! NumericQ[trySol] || trySol <= 0,
      (* 回退策略：使用解析近似或过量 OH 近似，保证不会返回非物理值 *)
      If[nB < nA,
        (* 未到当量：弱酸二次方程解（考虑已反应的 HA 浓度） *)
        H = Module[{c = (nA - nB)/Vt, x}, x = (-Ka + Sqrt[Ka^2 + 4 Ka c])/2; x],
        (* 过当量：由过量 OH 计算 [H+] *)
        H = Kw/((nB - nA)/Vt)
      ],
      H = trySol
    ];
  ];
  -Log[10, H]
];

(* 为数值稳定，改进当量处计算表达式（替代上面在极小差值时的判断） *)

pHofVsafe[Vml_] := Module[{V = Vml/1000., nA, nB, Vt, cHA, cAminus, c, x, Kb, OH},
  nA = Ca*Va; nB = Cb*V; Vt = Va + V;
  If[nB < nA,
    (* 未到当量：对极端小 nB (比如 0) 仍然使用精确解 *)
    If[nB == 0,
      c = Ca; x = (-Ka + Sqrt[Ka^2 + 4 Ka c])/2; -Log[10, x],
      cHA = (nA - nB)/Vt; cAminus = nB/Vt; -Log[10, Ka] + Log[10, cAminus/cHA]
    ],
    If[Abs[nB - nA] < 1.*10^-9,
      (* 当量点：用水解近似求 OH- *)
      c = nA/Vt; Kb = Kw/Ka; x = (-Kb + Sqrt[Kb^2 + 4 Kb c])/2; 14 - (-Log[10, x]),
      (* 过当量 *)
      OH = (nB - nA)/Vt; 14 + Log[10, OH]
    ]
  ]
];

(* 绘图与输出设置 *)
Vmax = 40; (* mL *)
curve = Plot[pHofV[V], {V, 0, Vmax}, PlotRange -> {0, 14},
  AxesLabel -> {"V (mL)", "pH"}, PlotStyle -> {Thick, Black},
  GridLines -> None, ImageSize -> 700,
  PlotPoints -> 350, MaxRecursion -> 8, Exclusions -> None, PerformanceGoal -> "Quality"];

(* 导出图像与表格 *)
Export["chapters/titration_acetic_2501.pdf", curve, ImageResolution -> 300];
Export["chapters/titration_acetic_2501.png", curve, ImageResolution -> 300];

(* 生成示例表格：采用一些关键体积点并计算 pH *)
sampleV = Join[Range[0, 18, 2], {19.8, 19.9, 19.98, 19.99, 20.0, 20.01, 20.02, 20.2}, Range[22, 40, 4]];
rows = Table[{v, pHofV[v]}, {v, sampleV}];
Export["chapters/titration_acetic_2501.csv", Prepend[rows, {"V_mL", "pH"}], "CSV"];

Print["已导出: chapters/titration_acetic_2501.pdf/.png/.csv"];

curve
