#!/usr/bin/env wolframscript
(* ::Package:: *)

(* utility functions *)
error[message_]:=(Print[message]; Abort[];)


(* parameters *)
rootDir = Directory[];
fragmentDir = rootDir <> "/artifacts/fragments/";
pageDir = rootDir <> "/artifacts/pages/";
templateDir = rootDir <> "/templates/";
githubRoot = "https://github.com/sigfig/translunar/blob/main/";


(* retrieve command line arguments *)
argv = Rest@$ScriptCommandLine;
argc = Length@argv;


(* validate input filepath *)
If[argc!=1, error["too many arguments"], Null];
If[FileExistsQ[argv[[1]]], Null, error["notebook file does not exist"]];
notebookFile = argv[[1]];


(* import notebook file *)
notebook = NotebookOpen[File[notebookFile],"Visible"->False];
notebookName = FileBaseName[FileNameTake[notebookFile]];


(* TODO article link pre-processing *)
(* TODO title/style metadata collection *)


(* initial export as an html fragment *)
fragmentPath = rootDir <> fragmentDir <> notebookName <> ".html"

Export[fragmentPath, notebook, "HTML",
	"FullDocument"->False,
	"GraphicsOutput"->"PNG",
	"Graphics3DOutput"->"PNG",
	"MathOutput"->"SVG"
];


(* reimport and xml processing *)

fragmentHTML = Import[fragmentPath, "XMLObject"];

(* TODO this part sequence is not reliable *)
bodyElements = html[[2]][[3]][[1]][[3]];


(* TODO png/svg collection *)


(* build article slot elements *)

(* TODO nested path elements *)
pathElement = XMLElement["div",{"class" -> "path element final"},{notebookName}];

githubElement = XMLElement["a",
	{"href" -> githubRoot <> "notebooks/" <> notebookName <> ".nb"},
	{"github"}
];


(* load and apply the template *)

(* TODO support multiple templates *)
template = XMLTemplate[File[templateDir <> "mathematica-notebook.html"]];

page = TemplateApply[template, <|
	"path" -> pathElement,
	"github" -> githubElement,
	"title" -> notebookName,
	"content" -> bodyElements
|>];


(* export the formatted article *)

(* TODO move collected assets with page *)

Export[pageDir <> notebookName <> ".html", page, "Text"];
