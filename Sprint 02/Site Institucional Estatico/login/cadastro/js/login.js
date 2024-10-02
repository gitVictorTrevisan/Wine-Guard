const loginContainer = document.getElementById("login-container");

function moveOverlay() {
  loginContainer.classList.toggle("move");
}

function getQueryParam(param) {
  const urlParams = new URLSearchParams(window.location.search);
  return urlParams.get(param);
}

document.addEventListener("DOMContentLoaded", () => {
  loginContainer.classList.add("no-transition");

  const formType = getQueryParam("formType");

  if (formType === "cadastrar") {
    moveOverlay();
  }

  setTimeout(() => {
    loginContainer.classList.remove("no-transition");
  }, 100);
});

document.getElementById("open-register").addEventListener("click", moveOverlay);
document.getElementById("open-login").addEventListener("click", moveOverlay);
