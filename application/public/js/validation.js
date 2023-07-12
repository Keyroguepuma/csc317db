function validateUsername(){
    var usernameInput = document.getElementById('username');
    var username = usernameInput.value;
    var usernameError = document.getElementById('error-username');
    var usernameCondition = /^[a-zA-Z][a-zA-Z0-9]*$/;
    
    if (!usernameCondition.test(username)){
        usernameInput.classList.add('invalid-text');
        usernameInput.classList.remove('valid-text');
        usernameError.textContent = "First character should be a letter"
        return false;
    }else{
        usernameInput.classList.add('valid-text');
        usernameInput.classList.remove('invalid-text');
        usernameError.textContent = ""

    }
    if(username.length < 3){
        usernameInput.classList.add('invalid-text');
        usernameInput.classList.remove('valid-text');
        usernameError.textContent = "Username should contain at least 3 letters"
        return false;
    }else{
        usernameInput.classList.add('valid-text');
        usernameInput.classList.remove('invalid-text');
        usernameError.textContent = ""
    
    }
    return true;

}
function validatePassword(){
    var passwordInput = document.getElementById('password');
    var password = passwordInput.value;
    var password2Input = document.getElementById('password2');
    var password2 = password2Input.value;
    var passwordError = document.getElementById('error-password');
    var password2Error = document.getElementById('error-password2');
    var passowrdCondition = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\/*\-+!@#$^&~\[\]])[a-zA-Z\d\/*\-+!@#$^&~\[\]]{8,}$/;

    if(!passowrdCondition.test(password)){
        passwordInput.classList.add('invalid-text');
        passwordInput.classList.remove('valid-text');
        passwordError.textContent="The password must be 8+ characters long and include at least 1 uppercase letter, 1 number, and 1 special character: / * - + ! @ # $ ^ & ~ [ ]";
        return false;
    }else{
        passwordInput.classList.add('valid-text');
        passwordInput.classList.remove('invalid-text');
        passwordError.textContent=""
    }

    if(password === password2){
        password2Input.classList.add('valid-text');
        password2Input.classList.remove('invalid-text');
        password2Error.textContent=""
        
    }else{
        password2Input.classList.add('invalid-text');
        password2Input.classList.remove('valid-text');
        password2Error.textContent="Password should match"
        return false;
    }
    return true;
}

var usernameInput = document.getElementById('username');
usernameInput.addEventListener('input', validateUsername)
var passwordInput = document.getElementById('password');
passwordInput.addEventListener('input', validatePassword)
var password2Input = document.getElementById('password2');
password2Input.addEventListener('input', validatePassword)

document.getElementById('reg-form').addEventListener('submit', function(ev){
    ev.preventDefault();
    if(validatePassword()  && validateUsername() ){
        document.getElementById('reg-form').submit();
    }
   

})