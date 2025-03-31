/*
observe scripts/language/language.gml and datafiles/language.json
if language.json is updated:
 - check if all enum values exists
 - check if every values exists in every languages

if language.gml is updated:
 - check if every values exists in every languages

After every updates, generate scripts/dictionary/dictionary.gml with every dictionnaries and the enum-to-key mapping function
*/
const { watchFile, readFileSync, writeFileSync } = require("fs");
const { resolve } = require("path");
const { exit } = require("process");

const languageKeys = new Map();

const languageJsonFile = resolve(__dirname, "datafiles", "language.json");
const languageGmlFile = resolve(
  __dirname,
  "scripts",
  "language",
  "language.gml"
);

let isWritingJson = false;
let isWritingGml = false;

const readJson = () => {
  const json = readFileSync(languageJsonFile, "utf8");
  return JSON.parse(json);
};

const readGml = () => {
  const json = readFileSync(languageGmlFile, "utf8");
  const lines = json.split("\n");
  const codes = [];
  let started = false;
  let continueReading = true;
  let lineEnd = 0;
  while (continueReading) {
    const line = lines.shift();
    lineEnd++;

    try {
      if (line.includes("}")) {
        started = false;
      }

      if (line.includes("#endregion")) {
        continueReading = false;
        break;
      }

      if (started) {
        codes.push(line);
      }

      if (line.startsWith("enum")) {
        started = true;
      }
    } catch (error) {
      console.log("Error parsing line:", line, lineEnd);
      console.log("Error message:", error.message);
      exit(1);
    }
  }

  return [
    codes.map((line) =>
      line.replaceAll("\t", "").replaceAll("\r", "").replaceAll(",", "".trim())
    ),
    lineEnd,
  ];
};

const manageMap = (keyCamel, store) => {
  if (languageKeys.has(keyCamel)) {
    const gmlKeyValue = languageKeys.get(keyCamel);

    gmlKeyValue[store] = true;

    languageKeys.set(keyCamel, gmlKeyValue);
  } else {
    const baseValue = {
      gml: false,
      en: false,
      fr: false,
      value: keyCamel,
    };

    baseValue[store] = true;

    languageKeys.set(keyCamel, baseValue);
  }
};

const writeGml = (values, lineEnd) => {
  const gml = readFileSync(languageGmlFile, "utf8");
  const lines = gml.split("\n");

  const keepLines = lines.slice(lineEnd);

  //console.log("lineEnd", lineEnd);
  //console.log("keepLines", keepLines);

  const enumKeys = [];
  const switchKeys = [];

  values.forEach((languageElement, index) => {
    const end = index === values.length - 1 ? "\r" : ",\r";
    const keySnake = camelToSnakeCase(languageElement.value);
    enumKeys.push(`\t${keySnake}${end}`);
    switchKeys.push(
      `\t\tcase Translation.${keySnake}: return "${languageElement.value}";\r`
    );
  });

  /// @func setLanguage(lang) Return the language identifier

  const newLines = [
    "#region Auto-Generated Translations",
    "enum Translation {",
    ...enumKeys,
    "}\r",
    "\r",
    "/// @func getTranslationKey(_key) Return the translation key\r",
    "/// @param {Struct.Translation} _key\r",
    "function getTranslationKey(_key) {\r",
    "\tswitch(_key) {\r",
    ...switchKeys,
    '\t\tdefault: return "";\r',
    "\t}\r",
    "}\r",
    "#endregion\r",
  ];

  //console.log("newLines", newLines);
  //console.log("keepLines", keepLines);

  isWritingGml = true;

  writeFileSync(
    languageGmlFile,
    [...newLines, ...keepLines].join("\n"),
    "utf8"
  );
};

const writeJson = (values) => {
  const jsonRaw = readFileSync(languageJsonFile, "utf8");
  const json = JSON.parse(jsonRaw);

  values.forEach((value) => {
    if (json.french[value.value] === undefined) {
      if (json.english[value.value] === undefined) {
        json.french[value.value] = `(NC)${value.value}`;
      } else {
        json.french[value.value] = `(NT)${json.english[value.value]}`;
      }
    }

    if (json.english[value.value] === undefined) {
      json.english[value.value] = `(NC)${value.value}`;
    }
  });

  isWritingJson = true;
  writeFileSync(languageJsonFile, JSON.stringify(json, null, 2), "utf8");
};

const checkFiles = () => {
  const json = readJson();
  const [gml, lineEnd] = readGml();

  gml.forEach((gmlKey) => {
    const gmlKeyCamel = snakeToCamelCase(gmlKey);

    manageMap(gmlKeyCamel, "gml");
  });

  Object.keys(json.english).forEach((key) => {
    manageMap(key, "en");
  });

  Object.keys(json.french).forEach((key) => {
    manageMap(key, "fr");
  });

  const values = [...Array.from(languageKeys.values())].sort((a, b) =>
    a.value.localeCompare(b.value)
  ).filter((value) => value.en === true);

  writeGml(values, lineEnd);
  writeJson(values);
};

const ucFirst = (str) => {
  return str.charAt(0).toUpperCase() + str.slice(1).toLowerCase();
};

const snakeToCamelCase = (str) => {
  return str
    .split("_")
    .map((word, index) => (index === 0 ? word.toLowerCase() : ucFirst(word)))
    .join("");
};

const camelToSnakeCase = (str) => {
  return str
    .split("")
    .map((word, index) => {
      if (index === 0) {
        return word.toUpperCase();
      }

      if (/[A-Z]/.test(word)) {
        return "_" + word.toUpperCase();
      }

      return word.toUpperCase();
    })
    .join("");
};

console.log("Watching for changes in language.json and language.gml");

checkFiles();

/*watchFile(languageJsonFile, () => {
  if (isWritingJson) {
    isWritingJson = false;
    return;
  }
  checkFiles();
});

watchFile(languageGmlFile, () => {
  if (isWritingGml) {
    isWritingGml = false;
    return;
  }
  checkFiles();
});*/
