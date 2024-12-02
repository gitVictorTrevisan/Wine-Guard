var completeNameInput = complete_name_input;
completeNameInput.value = "";
var emailInput = email_input;
emailInput.value = "";
var passwordInput = password_input;
var passwordConfirmInput = password_confirm_input;
var adviceEmail = invalid_email_message;
var inputEmailValue = "";
var adviceMandatoryInputs = mandatory_inputs_message;

function getEmailValue() {
  inputEmailValue = emailInput.value;
}

function checkEmail() {
  var original_text = inputEmailValue;
  var textWithAt = original_text.indexOf("@");
  var indexOfCom = original_text.indexOf(".com", textWithAt);
  var domainName = original_text.substring(textWithAt + 1, indexOfCom);
  var textWithUppercase = original_text.toUpperCase();
  var textWithLowercase = original_text.toLowerCase();
  var symbols = "!@#$%^&*()_+-=[]{};':\"\\|,.<>/?";
  var numbers = "1234567890";
  var endsWithBrOrCom = false;
  var includesAt = false;
  var startsWithCharacter = false;
  var hasAnyUppercase = false;
  var hasAProvider = false;

  if (original_text.includes("@")) {
    includesAt = true;
    console.log("o email tem @");
  } else {
    includesAt = false;
    console.log("o email não tem @");
  }

  if (textWithAt == 0) {
    startsWithCharacter = false;
    console.log("O email deve comecar com um caracter");
  }

  if (domainName == "") {
    hasAProvider = false;
  } else {
    hasAProvider = true;
  }

  if (
    symbols.includes(original_text[0]) ||
    numbers.includes(original_text[0])
  ) {
    startsWithCharacter = false;
  } else {
    startsWithCharacter = true;
  }

  if (original_text.endsWith(".com") || original_text.endsWith(".br")) {
    endsWithBrOrCom = true;
    console.log("o email termina com .br ou .com");
  } else {
    endsWithBrOrCom = false;
    console.log("o email não termina com .br ou .com");
  }

  if (original_text == textWithLowercase) {
    hasAnyUppercase = false;
    console.log("o email tem letras minúsculas");
  } else if (original_text != textWithUppercase) {
    hasAnyUppercase = true;
    console.log("o email tem letras maiúsculas");
  } else {
    hasAnyUppercase = false;
    console.log("o email não tem letras minúsculas");
  }

  if (
    includesAt &&
    endsWithBrOrCom &&
    startsWithCharacter &&
    !hasAnyUppercase &&
    hasAProvider
  ) {
    emailInput.style.borderColor = "#fff";
    adviceEmail.style.display = "none";
  } else {
    emailInput.style.borderColor = "#ff0000";
    adviceEmail.innerHTML = "Informe um email válido";
    adviceEmail.style.display = "block";
  }
}

var emailInputIsFilled = false;
var passwordInputIsFilled = false;
var passwordConfirmInputIsFilled = false;
var completeNameInputIsFilled = false;

function checkInputs() {
  if (completeNameInput.value == "") {
    completeNameInput.style.borderColor = "#ff0000";
    completeNameInputIsFilled = false;
  } else {
    completeNameInput.style.borderColor = "#fff";
    completeNameInputIsFilled = true;
  }

  if (emailInput.value == "") {
    emailInput.style.borderColor = "#ff0000";
    emailInputIsFilled = false;
    adviceEmail.style.display = "none";
  } else {
    emailInputIsFilled = true;
  }

  if (passwordInput.value == "") {
    passwordInput.style.borderColor = "#ff0000";
    passwordInputIsFilled = false;
  } else {
    passwordInput.style.borderColor = "#fff";
    passwordInputIsFilled = true;
  }

  if (passwordConfirmInput.value == "") {
    passwordConfirmInput.style.borderColor = "#ff0000";
    passwordConfirmInputIsFilled = false;
  } else {
    passwordConfirmInputIsFilled = true;
  }

  if (
    completeNameInputIsFilled &&
    emailInputIsFilled &&
    passwordInputIsFilled &&
    passwordConfirmInputIsFilled
  ) {
    adviceMandatoryInputs.style.display = "none";
  } else {
    adviceMandatoryInputs.innerHTML = "*Preencha os campos";
    adviceMandatoryInputs.style.display = "block";
  }
}

console.log(passwordConfirmInput.value, passwordInput.value);
