// Custom log
console.bold = function() {
  var args = [].slice.call(arguments);
  console.log("%c" + args.shift(), "font-weight: bold", args.pop());
};

// ## The fun begins ##

function looseEquals() {
  // == and ===
  function isEmpty(str) {
    return str == false;
  }

  var whitespace_chars = "\t \r\n";

  console.bold("whitespace_chars is empty:", isEmpty(whitespace_chars));

  function isReallyEmpty(str) {
    return str === "";
  }

  console.bold("whitespace_chars is really empty:", isReallyEmpty(whitespace_chars));

  console.bold("\"0\" == true:", "0" == true);
  console.bold("\"1\" == true:", "1" == true);
}

function withVariableOverride() {
  // with block

  var person = {
    name: "Shane"
  };

  function setName(name) {
    with (person) {
      name = name;
    }
  }

  console.bold("Name should be Shane:", person.name);
  setName("Chris");
  console.bold("Name should be Chris:", person.name);
}

function whoaEval() {
  // eval

  var name_counts = {
    Shane: 1
  };

  var user_input = prompt("What's your name?");

  name_counts[user_input] = 1;
  console.bold("Name counts:", name_counts);
}

function switchFallthrough() {
  // Switch statements and accidental fall-through

  var operator_a = 6,
      operator_b = 3;

  var operation = prompt("Use which operation?");

  switch(operation) {
    case "+":
      console.bold("Addition:", operator_a + operator_b);
      break;
    case "-":
      console.bold("Subtraction:", operator_a - operator_b);
      break;
    case "*":
      console.bold("Multiplication:", operator_a * operator_b);
      break;
    case "/":
      console.bold("Division:", operator_a / operator_b);
      break;
    default:
      console.log("Sorry, I don't recognize that operator");
  }
}

function missingBraces() {
  // Omitting braces for conditions

  var js_count = 0,
      ruby_count = 0;

  function pickLanguage(language) {
    if (language === "js") {
      js_count++;
      console.log("Yay! Javascript is the best!");
    }


    else if (language === "ruby") {
      ruby_count++;
      console.log("Woohoo! Ruby is the awesome!");
    }

    else {
      console.log("Blech! No one likes that language!");
    }
  }

  pickLanguage("js");
  pickLanguage("ruby");
  console.bold("JS", js_count);
  console.bold("Ruby", ruby_count);
}

function oopsGlobal() {
  // Accidental global variable

  var i = 0;

  function logFiveTimes() {
    for (i = 0; i < 5; i++) {
      console.log(i);
    }
  }

  console.bold("i", i);
  logFiveTimes();
  console.bold("i", i);
}

function sameLineReturn() {
  // Always start return statement on same line

  function newPerson(name) {
    return {
      name: name
    };
  }

  console.bold("Name:", newPerson("Shane"));
}

function floatingPointHell() {
  // Floating point numbers lead to unexpected values

  var gum = .1,
      mint = .2;

  console.bold("Expected total spent:", .3);
  console.bold("Actual total spent:", (gum * 100 + mint * 100) / 100);
}
