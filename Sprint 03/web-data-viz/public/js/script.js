var passwordInput = password_input;
var passwordConfirmInput = password_confirm_input;
var PasswordInputValue = passwordConfirmInput.value;
var PasswordConfimInputValue = "";
var invalidPasswordText = invalid_password_message;

function checkValuePasswordInput() {
  PasswordInputValue = passwordInput.value.replaceAll(" ", "");
}

function checkValueConfirmPasswordInput() {
  PasswordConfimInputValue = passwordConfirmInput.value.replaceAll(" ", "");
}

function checkInput() {
  console.log("função invocada");
  if (PasswordInputValue != PasswordConfimInputValue) {
    passwordConfirmInput.style.borderColor = "#ff0000";
    invalidPasswordText.innerHTML = "As senhas devem ser iguais";
    invalidPasswordText.style.display = "block";
    console.log(PasswordInputValue);
  } else {
    passwordConfirmInput.style.borderColor = "#fff";
    invalidPasswordText.style.display = "none";
    console.log(PasswordConfimInputValue);
  }
}
