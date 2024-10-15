var passwordInputEyeButton = eyeButton1;
var passwordConfirmInputEyeButton = eyeButton2;

function revealHidePasswordInput() {
    if (passwordInputEyeButton.classList.contains("fa-eye-slash")) {
      passwordInputEyeButton.classList.remove("fa-eye-slash");
      passwordInputEyeButton.classList.add("fa-eye");
      passwordInput.type = "text";
    } else {
      passwordInputEyeButton.classList.remove("fa-eye");
      passwordInputEyeButton.classList.add("fa-eye-slash");
      passwordInput.type = "password";
    }
  }
  
  function revealHidePasswordConfirmInput() {
    if (passwordConfirmInputEyeButton.classList.contains("fa-eye-slash")) {
      passwordConfirmInputEyeButton.classList.remove("fa-eye-slash");
      passwordConfirmInputEyeButton.classList.add("fa-eye");
      passwordConfirmInput.type = "text";
    } else {
      passwordConfirmInputEyeButton.classList.remove("fa-eye");
      passwordConfirmInputEyeButton.classList.add("fa-eye-slash");
      passwordConfirmInput.type = "password";
    }
  }