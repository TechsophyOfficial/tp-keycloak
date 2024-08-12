<#import "template.ftl" as layout>

<@layout.registrationLayout displayInfo=social.displayInfo; section>


    <#if section == "header">
        <!-- reCAPTCHA Script -->
        <#if properties.recaptchaRequired?boolean>
            <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        </#if>
    </#if>

    <#if section == "form">
        <div class="main-container">
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
                    <label style="display: none;">
                        <#if login.rememberMe??>
                            <input class="remember-me-text" tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                        <#else>
                            <input class="remember-me-text" tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                        </#if>
                    </label>

                    <#if realm.resetPasswordAllowed>
                        <a tabindex="5" href="${url.loginResetCredentialsUrl}" class="forgot-password-text" style="margin-left: auto;">${msg("doForgotPassword")}</a>
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

                <!-- Error Message Container -->
                <div id="error-message" class=" alert alert-message-icon-div" style="display: none;">
                    <img src="${url.resourcesPath}/img/erroragain.svg" class="error-msg-icon" alt="img"/>
                    <span class="message-text">An error occurred. Please try again.</span>
                </div>

            </form>

            <!-- Introduction Content -->
            <div class="introduction-content-container">
                <div class="introduction-content">
                    <h2 class="font-text-blue">Introducing CyberWasp</h2>
                    <p class="introducing-cyberwasp-text">Engineered for uncompromising security, CyberWasp safeguards your digital assets with confidence.</p>
                </div>
            </div>
        </div>
    </#if>

</@layout.registrationLayout>

<!-- JavaScript for reCAPTCHA Verification and Error Handling -->
<script>
    var recaptchaResponse = "";
    var recaptchaRequired = ${properties.recaptchaRequired?string};

    function recaptchaCallback(response) {
        recaptchaResponse = response;
    }

    function verifyRecaptcha() {
        if (recaptchaRequired) {
            if (recaptchaResponse === "") {
                showError("Please complete the reCAPTCHA");
                return false; // Prevent form submission if reCAPTCHA is not completed
            }
        }
        return true; // Allow form submission
    }

    function showError(message) {
        var errorMessageElement = document.getElementById('error-message');
        var messageText = errorMessageElement.querySelector('.message-text');
        messageText.textContent = message; // Set the error message
        errorMessageElement.style.display = 'flex'; // Display the error message
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
</script>