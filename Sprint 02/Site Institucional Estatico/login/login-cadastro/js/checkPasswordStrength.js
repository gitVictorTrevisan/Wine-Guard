var passwordIndicator = password_strength_indicator;
var strengthVeryWeak = strength_vw;
var strengthWeak = strength_w;
var strengthMean = strength_m;
var strengthStrong = strength_s;
var strengthVeryStrong = strength_vs;
var strengthTextIndicator = strength_text_indicator;

function check() {
  var checkEightCharacters = false;
  var checkLowercase = false;
  var checkUppercase = false;
  var checkUppercaseAndLowercase = false;
  var checkSpecialCharacters = false;
  var checkNumber = false;

  function hasEightCharacters() {
    if (passwordInput.value.length >= 8) {
      checkEightCharacters = true;
    } else {
      checkEightCharacters = false;
    }
  }

  function hasLowercase() {
    var original_text = passwordInput.value;
    var lowercasedText = original_text.toUpperCase();

    if (original_text != lowercasedText) {
      checkLowercase = true;
    } else {
      checkLowercase = false;
    }
  }

  function hasUppercase() {
    var originalText = passwordInput.value;
    var uppercasedText = originalText.toLowerCase();

    if (originalText != uppercasedText) {
      checkUppercase = true;
    } else {
      checkUppercase = false;
    }
  }

  function hasLowercaseAndUppercase() {
    if (checkLowercase && checkUppercase) {
      checkUppercaseAndLowercase = true;
    } else {
      checkUppercaseAndLowercase = false;
    }
  }

  function hasSpecialCharacter() {
    var original_text = passwordInput.value;
    var simbolos = "!@#$%^&*()_+-=[]{};':\"\\|,.<>/?";
    var hasAnySpecialCharacter = false;

    for (var i = 0; i < original_text.length; i++) {
      if (simbolos.includes(original_text[i])) {
        hasAnySpecialCharacter = true;
      }
    }

    checkSpecialCharacters = hasAnySpecialCharacter;
  }

  function hasNumber() {
    var original_text = passwordInput.value;

    var hasAnyNumber = false;

    for (var i = 0; i < original_text.length; i++) {
      if (!isNaN(original_text[i]) && original_text[i] !== " ") {
        hasAnyNumber = true;
      }
    }

    checkNumber = hasAnyNumber;
  }

  hasEightCharacters();
  hasLowercase();
  hasUppercase();
  hasLowercaseAndUppercase();
  hasSpecialCharacter();
  hasNumber();

  var value = passwordInput.value.length;

  var satisfiedConditions = 0;
  if (checkEightCharacters) satisfiedConditions++;
  if (checkUppercaseAndLowercase) satisfiedConditions++;
  if (checkSpecialCharacters) satisfiedConditions++;
  if (checkNumber) satisfiedConditions++;

  if (value > 0) {
    passwordIndicator.style.display = "block";
    if (satisfiedConditions === 0) {
      strengthTextIndicator.innerHTML = "Muito fraca";
      strengthVeryWeak.style.display = "block";
    }
    if (satisfiedConditions === 1) {
      strengthTextIndicator.innerHTML = "Fraca";
      strengthVeryWeak.style.display = "block";
      strengthWeak.style.display = "block";
      console.log("weak");
    } else {
      strengthWeak.style.display = "none";
    }
    if (satisfiedConditions === 2) {
      strengthTextIndicator.innerHTML = "Média";
      strengthVeryWeak.style.display = "block";
      strengthWeak.style.display = "block";
      strengthMean.style.display = "block";
      console.log("medium");
    } else {
      strengthMean.style.display = "none";
    }
    if (satisfiedConditions === 3) {
      strengthTextIndicator.innerHTML = "Forte";
      strengthVeryWeak.style.display = "block";
      strengthWeak.style.display = "block";
      strengthMean.style.display = "block";
      strengthStrong.style.display = "block";
      console.log("strong");
    } else {
      strengthStrong.style.display = "none";
    }
    if (satisfiedConditions === 4) {
      strengthTextIndicator.innerHTML = "Muito forte";
      strengthVeryWeak.style.display = "block";
      strengthWeak.style.display = "block";
      strengthMean.style.display = "block";
      strengthStrong.style.display = "block";
      strengthVeryStrong.style.display = "block";
      console.log("very strong");
    } else {
      strengthVeryStrong.style.display = "none";
    }
  } else {
    passwordIndicator.style.display = "none";
    strengthVeryWeak.style.display = "none";
    strengthWeak.style.display = "none";
    strengthMean.style.display = "none";
    strengthStrong.style.display = "none";
    strengthVeryStrong.style.display = "none";
    strengthTextIndicator.innerHTML = "";
  }
  console.log(
    checkEightCharacters,
    checkUppercaseAndLowercase,
    checkSpecialCharacters,
    checkNumber
  );
}
