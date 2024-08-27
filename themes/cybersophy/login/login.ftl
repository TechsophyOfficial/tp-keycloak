<#import "template.ftl" as layout>
 
<#--  <@layout.registrationLayout displayInfo=social.displayInfo; section>  -->
 
<@layout.registrationLayout displayInfo=social.displayInfo displayMessage=true; section>
 
 
    <#if section == "header">
        <!-- reCAPTCHA Script -->
        <#if properties.recaptchaRequired?boolean>
            <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        </#if>
    </#if>
 
    <#if section == "form">
        <div class="login-section">
            <form id="kc-form-login" class="login-form-container" onsubmit="return verifyRecaptcha();" action="${url.loginAction}" method="post">
                <!-- Login Form Title -->
                <h1 class="login-form-title">Log in</h1>
 
                <!-- Username Input -->
                <div class="form-input-container">
                    <label for="username" class="font-text-blue">${msg("Username")}</label>
                    <input id="username" class="input-field" type="text" name="username" tabindex="1">
                </div>
 
                 <!-- Password Input -->
                <div class="form-input-container password-field">
                    <label for="password" class="font-text-blue">${msg("Password")}</label>
                    <input id="password" class="input-field password-input" type="password" name="password" tabindex="2">
                    <img id="password-toggle-icon" src="${url.resourcesPath}/img/eye-close.svg" onclick="togglePasswordVisibility()" class="password-toggle">
                </div>
 
               
                <!-- Remember Me and Forgot Password -->
                <div class="remember-me-div" style="display: flex;">
                    <div id="kc-form-options">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="checkbox">
                                <label>
                                    <#if login.rememberMe??>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                    <#else>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                    </#if>
                                </label>
                            </div>
                        </#if>
                    </div>

                    <#if realm.resetPasswordAllowed>
                        <a tabindex="5" href="${url.loginResetCredentialsUrl}" class="forgot-password-text" style="margin-left: auto; text-decoration:underline;">${msg("doForgotPassword")}</a>
                    </#if>
                </div>
 
                            <!-- reCAPTCHA Widget -->
                <#if properties.recaptchaRequired?boolean>
                <div class="recaptcha" id="kc-captcha">
                    <div class="g-recaptcha" data-sitekey="${properties.recaptchaSiteKey}" data-callback="recaptchaCallback"></div>
                </div>
                </#if>
 
                <!-- Submit Button -->
                <input class="submit-btn" type="submit" value="Sign in" tabindex="3">
                <span class="display-alert-message" id="display-error-message"></span>
 
               
 
            </form>
 
            <!-- Introduction Content -->
            <div class="introduction-content-container">
                <div class="introduction-content">
                    <h2 class="intro-header-blue">Introducing CyberWasp</h2>
                    <p class="introducing-cyberwasp-text">Engineered for uncompromising security, CyberWasp <br /> safeguards your digital assets with confidence.</p>
                </div>
            </div>
        </div>
    </#if>
 
</@layout.registrationLayout>
 
<script>
    var recaptchaResponse = "";
    var recaptchaRequired = ${properties.recaptchaRequired?string};
    var submitButton = document.querySelector('.submit-btn');
 
    // Initially disable the submit button and apply the disabled color
    if(recaptchaRequired){
        submitButton.disabled = true;
        submitButton.classList.add('disabled');
    }
 
    function recaptchaCallback(response) {
        recaptchaResponse = response;
 
        // Enable the submit button when reCAPTCHA is completed
        if (recaptchaResponse !== "") {
            submitButton.disabled = false;
            submitButton.classList.remove('disabled');
        }
    }
 
    function verifyRecaptcha() {
        if (recaptchaRequired) {
            if (recaptchaResponse === "") {
                showError("recaptcha", "Please complete the reCAPTCHA");
                return false; // Prevent form submission if reCAPTCHA is not completed
            }
        }
        return true; // Allow form submission
    }
 
    function togglePasswordVisibility() {
        var passwordInput = document.getElementById('password');
        var toggleIcon = document.getElementById('password-toggle-icon');
        
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            toggleIcon.src = '${url.resourcesPath}/img/eye-open.svg'; // Path to eye-open icon
        } else {
            passwordInput.type = 'password';
            toggleIcon.src = '${url.resourcesPath}/img/eye-close.svg'; // Path to eye-close icon
        }
    }
 
 
    // Wait until the DOM is fully loaded
    document.addEventListener("DOMContentLoaded", function() {
        // Get the alert message content
        var alertMessageElement = document.getElementById('alert-message');
        var errorMessageElement = document.getElementById('display-error-message');
        var messageEl = document.getElementById("message-text")

        if (messageEl && errorMessageElement) {
            // Move the content from the alert div to the p element
            errorMessageElement.innerHTML = messageEl.innerHTML;
            errorMessageElement.classList = messageEl.classList
            
            alertMessageElement.style.display = 'none';

            // Optionally, hide the original alert div
        }
    });
 
   
</script>