var completeNameInput = complete_name_input;
completeNameInput.value = "";
var emailInput = email_input;
emailInput.value = "";
var passwordInput = password_input;
var passwordConfirmInput = password_confirm_input;
var adviceEmail = invalid_email_message;
var inputEmailValue = "";

function getEmailValue() {
  inputEmailValue = emailInput.value;
}

function checkEmail() {
  var original_text = inputEmailValue;
  var textWithAt = original_text.indexOf("@");
  var simbols = "!@#$%^&*()_+-=[]{};':\"\\|,.<>/?";
  var endsWithBrOrCom = false;
  var includesAt = false;
  var startsWithCaracter = false;

  if (original_text.includes("@")) {
    includesAt = true;
    console.log("o email tem @");
  } else {
    includesAt = false;
    console.log("o email não tem @");
  }

  if (textWithAt == 0) {
    startsWithCaracter = false;
    console.log("O email deve comecar com um caracter");
  } 
  if (simbols.includes(original_text[0])) {
    startsWithCaracter = false;
  } else {
    startsWithCaracter = true;
  }

  if (original_text.endsWith(".com") || original_text.endsWith(".br")) {
    endsWithBrOrCom = true;
    console.log("o email termina com .br ou .com");
  } else {
    endsWithBrOrCom = false;
    console.log("o email não termina com .br ou .com");
  }

  if (includesAt && endsWithBrOrCom && startsWithCaracter) {
    emailInput.style.borderColor = "#fff";
    adviceEmail.style.display = "none";
  } else {
    emailInput.style.borderColor = "#ff0000";
    adviceEmail.innerHTML = "Informe um email válido";
    adviceEmail.style.display = "block";
  }
}

function checkInputs() {
  if ((completeNameInput.value == "")) {
    completeNameInput.style.borderColor = "#ff0000";
  } else {
    completeNameInput.style.borderColor = "#fff";
  }
  if ((emailInput.value == "")) {
    emailInput.style.borderColor = "#ff0000";
    adviceEmail.style.display = "none";
  }
  if ((passwordInput.value == "")) {
    passwordInput.style.borderColor = "#ff0000";
  } else {
    passwordInput.style.borderColor = "#fff";
  }
  if ((passwordConfirmInput.value =="")) {
    passwordConfirmInput.style.borderColor = "#ff0000";
  }
}

console.log(passwordConfirmInput.value, passwordInput.value);
