ClearAll["Global`*"];

(* 1. colors and labels *)
colors = <|
   "alkali" -> RGBColor[1.0, 0.75, 0.75],
   "alkaline" -> RGBColor[1.0, 0.88, 0.70],
   "transition" -> RGBColor[0.75, 0.88, 1.0],
   "post" -> RGBColor[0.85, 0.78, 0.95],
   "metalloid" -> RGBColor[0.72, 0.92, 0.92],
   "nonmetal" -> RGBColor[0.98, 0.95, 0.65],
   "halogen" -> RGBColor[0.90, 0.82, 0.98],
   "noble" -> RGBColor[0.80, 0.90, 0.98],
   "lanthanide" -> RGBColor[1.0, 0.82, 0.88],
   "actinide" -> RGBColor[1.0, 0.75, 0.80],
   "other" -> RGBColor[0.90, 0.90, 0.90]
|>;

labels = <|
   "alkali" -> "Alkali Metal",
   "alkaline" -> "Alkaline Earth",
   "transition" -> "Transition Metal",
   "post" -> "Post-Transition",
   "metalloid" -> "Metalloid",
   "nonmetal" -> "Reactive Nonmetal",
   "halogen" -> "Halogen",
   "noble" -> "Noble Gas",
   "lanthanide" -> "Lanthanide",
   "actinide" -> "Actinide"
|>;

(* 2. element data cache *)
getCategory[classes_] := Which[
   MemberQ[classes, EntityClass["Element", "Lanthanide"]], "lanthanide",
   MemberQ[classes, EntityClass["Element", "Actinide"]], "actinide",
   MemberQ[classes, EntityClass["Element", "NobleGas"]], "noble",
   MemberQ[classes, EntityClass["Element", "Halogen"]], "halogen",
   MemberQ[classes, EntityClass["Element", "AlkaliMetal"]], "alkali",
   MemberQ[classes, EntityClass["Element", "AlkalineEarthMetal"]], "alkaline",
   MemberQ[classes, EntityClass["Element", "Metalloid"]], "metalloid",
   MemberQ[classes, EntityClass["Element", "TransitionMetal"]], "transition",
   MemberQ[classes, EntityClass["Element", "Metal"]], "post",
   MemberQ[classes, EntityClass["Element", "Nonmetal"]], "nonmetal",
   True, "other"
];

fmtMass[m_, z_] := If[MissingQ[m], "[" <> ToString[z] <> "]",
   Module[{val = QuantityMagnitude[m]},
    If[IntegerQ[val], ToString[val], ToString[NumberForm[val, {5, 2}]]]
   ]
];

elementCache = Association@Table[
   z -> <|
     "Symbol" -> ElementData[z, "Abbreviation"],
     "Name" -> ElementData[z, "StandardName"],
     "Mass" -> fmtMass[ElementData[z, "AtomicWeight"], z],
     "Group" -> ElementData[z, "Group"],
     "Period" -> ElementData[z, "Period"],
     "Category" -> getCategory[ElementData[z, "EntityClasses"]]
   |>,
   {z, 118}
];

casGroup = <|
   1 -> "1A", 2 -> "2A", 3 -> "3B", 4 -> "4B", 5 -> "5B", 6 -> "6B", 7 -> "7B",
   8 -> "8B", 9 -> "8B", 10 -> "8B", 11 -> "1B", 12 -> "2B", 13 -> "3A", 14 -> "4A",
   15 -> "5A", 16 -> "6A", 17 -> "7A", 18 -> "8A"
|>;

(* 3. cell drawing *)
drawCell[z_Integer, x_, y_, w_: 0.975, h_: 0.9875] := Module[{data, col, sym, nm},
   data = elementCache[z];
   col = Lookup[colors, data["Category"], White];
   sym = data["Symbol"];
   nm = data["Name"];
   {
    {FaceForm[col], EdgeForm[Directive[AbsoluteThickness[0.5], GrayLevel[0.35]]],
     Rectangle[{x - w/2, y - h/2}, {x + w/2, y + h/2}]},
    (* atomic number *)
    Text[Style[z, 20, Bold, GrayLevel[0.2], FontFamily -> "NewComputerModernSans10"], {x - w/2 + 0.04, y + h/2 - 0.02}, {Left, Top}],
    (* symbol *)
    Text[Style[sym, 26, Bold, Black, FontFamily -> "NewComputerModernSans10"], {x, y + 0.14}],
    (* name *)
    Text[Style[nm, If[StringLength[nm] > 9, 14, 15], Bold, GrayLevel[0.1], FontFamily -> "NewComputerModernSans10"], {x, y - 0.18}],
    (* atomic mass *)
    Text[Style[data["Mass"], 14, GrayLevel[0.2], FontFamily -> "NewComputerModernSans10"], {x, y - 0.34}]
   }
];

drawPlaceholder[text_, cat_, x_, y_, w_: 0.975, h_: 0.9875] := {
   {FaceForm[colors[cat]], EdgeForm[Directive[AbsoluteThickness[0.5], GrayLevel[0.35]]],
    Rectangle[{x - w/2, y - h/2}, {x + w/2, y + h/2}]},
   Text[Style[text, 14, Bold, GrayLevel[0.2], FontFamily -> "NewComputerModernSans10"], {x, y}]
};

(* 4. main render *)
draw[] := Module[{mainCells, lanCells, actCells, headers, blocks, legend},

   (* main table cells *)
   mainCells = Table[
     With[{g = elementCache[z]["Group"], p = elementCache[z]["Period"]},
      If[MissingQ[g] || MissingQ[p] || (57 <= z <= 71) || (89 <= z <= 103),
       Nothing,
       drawCell[z, g, 7.3 - p]
      ]
     ],
     {z, 118}
   ];

   AppendTo[mainCells, drawPlaceholder["57-71\nLa-Lu", "lanthanide", 3, 7.3 - 6]];
   AppendTo[mainCells, drawPlaceholder["89-103\nAc-Lr", "actinide", 3, 7.3 - 7]];

   (* lanthanide/actinide sub-tables *)
   lanCells = Table[drawCell[57 + i - 1, i + 2, -0.95], {i, 15}];
   actCells = Table[drawCell[89 + i - 1, i + 2, -1.95], {i, 15}];

   (* headers *)
   headers = {
     Text[Style["Group \[RightArrow]", 20, Bold, GrayLevel[0.3], FontFamily -> "NewComputerModernSans10"], {0.1, 7.85}, {Right, Center}],
     Table[{
       Text[Style[casGroup[g], 18, GrayLevel[0.3], FontFamily -> "NewComputerModernSans10"], {g, 7.9}],
       Text[Style[g, 20, Bold, Black, FontFamily -> "NewComputerModernSans10"], {g, 7.5}]
      }, {g, 1, 18}],

     Text[Style["Period", 20, Bold, GrayLevel[0.3], FontFamily -> "NewComputerModernSans10"], {-0.5, 7.0}],
     Table[Text[Style[p, 20, Bold, Black, FontFamily -> "NewComputerModernSans10"], {-0.5, 7.3 - p}], {p, 1, 7}]
   };

   (* orbital blocks *)
   blocks = {
     {Line[{{0.52, 6.89}, {2.48, 6.89}}], Text[Row[{Style["s", 20, Bold, Italic, GrayLevel[0.3], FontFamily -> "NewComputerModernSans10"], Style["-block", 20, Bold, GrayLevel[0.3], FontFamily -> "NewComputerModernSans10"]}], {1.5, 6.89 + 0.15}]},
     {Line[{{2.52, 3.89}, {10.48, 3.89}}], Text[Row[{Style["d", 20, Bold, Italic, GrayLevel[0.3], FontFamily -> "NewComputerModernSans10"], Style["-block", 20, Bold, GrayLevel[0.3], FontFamily -> "NewComputerModernSans10"]}], {6.5, 3.89 + 0.15}]},
     {Line[{{12.52, 6.89}, {18.48, 6.89}}], Text[Row[{Style["p", 20, Bold, Italic, GrayLevel[0.3], FontFamily -> "NewComputerModernSans10"], Style["-block", 20, Bold, GrayLevel[0.3], FontFamily -> "NewComputerModernSans10"]}], {15.5, 6.89 + 0.15}]},
     {Line[{{2.52, -2.544}, {17.48, -2.544}}], Text[Row[{Style["f", 20, Bold, Italic, GrayLevel[0.3], FontFamily -> "NewComputerModernSans10"], Style["-block", 20, Bold, GrayLevel[0.3], FontFamily -> "NewComputerModernSans10"]}], {10, -2.544 - 0.15}]},
     (* ds 区：11-12 族（P4-P6），上下两条横线 *)
     {Line[{{10.52, 3.89}, {12.48, 3.89}}], Line[{{10.52, 0.706}, {12.48, 0.706}}],
      Text[Row[{Style["ds", 20, Bold, Italic, GrayLevel[0.3], FontFamily -> "NewComputerModernSans10"], Style["-block", 20, Bold, GrayLevel[0.3], FontFamily -> "NewComputerModernSans10"]}], {11.5, 4.1}]}
   };

   (* legend *)
   legend = Module[{keys, items},
     keys = {"alkali", "alkaline", "transition", "post", "metalloid", "nonmetal", "halogen", "noble", "lanthanide", "actinide"};
     items = Table[
       With[{col = colors[keys[[i]]], txt = labels[keys[[i]]],
             xPos = 3.5 + Floor[(i - 1)/5]*4.3,
             yPos = 6.15 - Mod[i - 1, 5]*0.42},
        {
         {FaceForm[col], EdgeForm[Directive[AbsoluteThickness[0.4], GrayLevel[0.4]]], Rectangle[{xPos, yPos - 0.12}, {xPos + 0.4, yPos + 0.12}]},
         Text[Style[txt, 18, Bold, GrayLevel[0.2], FontFamily -> "NewComputerModernSans10"], {xPos + 0.55, yPos}, {Left, Center}]
        }
       ],
       {i, Length[keys]}
     ];
     Flatten[{
       Text[Style["LEGEND", 20, Bold, GrayLevel[0.2], FontFamily -> "NewComputerModernSans10"], {3.5, 6.6}, {Left, Center}],
       items
     }]
   ];

   Graphics[
    Flatten[{
      headers, legend, mainCells, lanCells, actCells, blocks,
      Text[Style["Lanthanides", 20, Bold, Darker@colors["lanthanide"], FontFamily -> "NewComputerModernSans10"], {2.3, -0.95}, {Right, Center}],
      Text[Style["Actinides", 20, Bold, Darker@colors["actinide"], FontFamily -> "NewComputerModernSans10"], {2.3, -1.95}, {Right, Center}]
    }],
    ImageSize -> 2100,
    PlotRange -> {{-1.1, 19.1}, {-5.14, 9.19}},
    Background -> White
   ]
];

(* 5. export *)
dir = If[$InputFileName != "", DirectoryName[$InputFileName], NotebookDirectory[]];
pt = draw[];

Export[FileNameJoin[{dir, "periodic-table.pdf"}], pt];
Export[FileNameJoin[{dir, "periodic-table.png"}], Rasterize[pt, ImageResolution -> 300]];
