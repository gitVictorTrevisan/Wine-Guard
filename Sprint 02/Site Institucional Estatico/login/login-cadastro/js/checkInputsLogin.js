var passwordInput = password_input;
passwordInput.value = "";
var usernameOrEmail = username_email;
usernameOrEmail.value = "";
var advice = mandatory_inputs_message;

function checkInputs() {
  if (passwordInput.value == "") {
    passwordInput.style.borderColor = "#ff0000";
    advice.innerHTML = "*Preencha os campos";
    advice.style.display = "block";
  } else {
    passwordInput.style.borderColor = "#fff";
    advice.style.display = "none";
  }

  if (usernameOrEmail.value == "") {
    usernameOrEmail.style.borderColor = "#ff0000";
    advice.innerHTML = "*Preencha os campos";
    advice.style.display = "block";
  } else if (usernameOrEmail.value == "" && passwordInput.value == "") {
    usernameOrEmail.style.borderColor = "#fff";
    advice.style.display = "none";
  } else {
    usernameOrEmail.style.borderColor = "#fff";
  }
}
