var passwordInput = password_input;
var passwordConfirmInput = password_confirm_input
var valorPasswordInput = passwordConfirmInput.value;
var valorPasswordConfimInput = "";
var invalidPasswordText = invalid_password_message;

function verificarValorPasswordInput() {
  valorPasswordInput = passwordInput.value; 
}

function verificarValorConfirmPasswordInput() {
  valorPasswordConfimInput = passwordConfirmInput.value;
}

function verificarInput() {
  console.log("função invocada");
  if (valorPasswordInput != valorPasswordConfimInput) {
    passwordConfirmInput.style.borderColor = "#ff0000";
    invalidPasswordText.innerHTML = "As senhas devem ser iguais";
    invalidPasswordText.style.display = "block";
    console.log("caiu no if");
  } else {
    passwordConfirmInput.style.borderColor = "#fff";
    invalidPasswordText.style.display = "none";
    console.log("caiu no else");
  }
}
