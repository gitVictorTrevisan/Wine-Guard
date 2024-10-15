var passwordIndicator = password_strength_indicator;
var strengthVeryWeak = strength_vw;
var strengthWeak = strength_w;
var strengthMean = strength_m;
var strengthStrong = strength_s;
var strengthVeryStrong = strength_vs;
var strengthTextIndicator = strength_text_indicator;

function verificar() {
  var checkEightCharacters = false;
  var checkLowercase = false;
  var checkUppercase = false;
  var checkUppercaseAndLowercase = false;
  var checkSpecialCharacters = false;
  var checkNumber = false;

  function possuiOitoCaracteres() {
    if (passwordInput.value.length >= 8) {
      checkEightCharacters = true;
    } else {
      checkEightCharacters = false;
    }
  }

  function possuiLetraMinuscula() {
    var texto_original = passwordInput.value;
    var textoMaiuscula = texto_original.toUpperCase();

    if (texto_original != textoMaiuscula) {
      checkLowercase = true;
    } else {
      checkLowercase = false;
    }
  }

  function possuiLetraMaiuscula() {
    var texto_original = passwordInput.value;
    var textoMaiuscula = texto_original.toLowerCase();

    if (texto_original != textoMaiuscula) {
      checkUppercase = true;
    } else {
      checkUppercase = false;
    }
  }

  function possuiMaiusculaEMinuscula() {
    if (checkLowercase && checkUppercase) {
      checkUppercaseAndLowercase = true;
    } else {
      checkUppercaseAndLowercase = false;
    }
  }

  function possuiCaracteresEspeciais() {
    const texto_original = passwordInput.value;
    const simbolos = "!@#$%^&*()_+-=[]{};':\"\\|,.<>/?";
    var hasAnySpecialCharacter = false;

    for (var i = 0; i < texto_original.length; i++) {
      if (simbolos.includes(texto_original[i])) {
        hasAnySpecialCharacter = true;
      }
    }

    checkSpecialCharacters = hasAnySpecialCharacter;
  }

  function possuiNumeros() {
    const texto_original = passwordInput.value;

    var hasAnyNumber = false;

    for (var i = 0; i < texto_original.length; i++) {
      if (!isNaN(texto_original[i]) && texto_original[i] !== " ") {
        hasAnyNumber = true;
      }
    }

    checkNumber = hasAnyNumber;
  }

  possuiOitoCaracteres();
  possuiLetraMinuscula();
  possuiLetraMaiuscula();
  possuiMaiusculaEMinuscula();
  possuiCaracteresEspeciais();
  possuiNumeros();

  const value = passwordInput.value.length;

  var condicoesSatisfeitas = 0;
  if (checkEightCharacters) condicoesSatisfeitas++;
  if (checkUppercaseAndLowercase) condicoesSatisfeitas++;
  if (checkSpecialCharacters) condicoesSatisfeitas++;
  if (checkNumber) condicoesSatisfeitas++;

  if (value > 0) {
    passwordIndicator.style.display = "block";
    if (condicoesSatisfeitas === 0) {
      strengthTextIndicator.innerHTML = "Muito fraca";
      strengthVeryWeak.style.display = "block";
    } else if (condicoesSatisfeitas === 1) {
      strengthTextIndicator.innerHTML = "Fraca";
      strengthVeryWeak.style.display = "block";
      strengthWeak.style.display = "block";
      console.log("weak");
    } else if (condicoesSatisfeitas === 2) {
      strengthTextIndicator.innerHTML = "Média";
      strengthVeryWeak.style.display = "block";
      strengthWeak.style.display = "block";
      strengthMean.style.display = "block";
      console.log("medium");
    } else if (condicoesSatisfeitas === 3) {
      strengthTextIndicator.innerHTML = "Forte";
      strengthVeryWeak.style.display = "block";
      strengthWeak.style.display = "block";
      strengthMean.style.display = "block";
      strengthStrong.style.display = "block";
      console.log("strong");
    } else if (condicoesSatisfeitas === 4) {
      strengthTextIndicator.innerHTML = "Muito forte";
      strengthVeryWeak.style.display = "block";
      strengthWeak.style.display = "block";
      strengthMean.style.display = "block";
      strengthStrong.style.display = "block";
      strengthVeryStrong.style.display = "block";
      console.log("very strong");
    }
  } else {
    passwordIndicator.style.display = "none";
  }
  console.log(
    checkEightCharacters,
    checkUppercaseAndLowercase,
    checkSpecialCharacters,
    checkNumber
  );
}
