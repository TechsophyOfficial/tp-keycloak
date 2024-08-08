<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section="title">
        ${msg("loginTitle", (realm.displayName!''))}
    <#elseif section="header">
        <link href="https://fonts.googleapis.com/css?family=Barlow" rel="stylesheet"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

       <#if properties.recaptchaRequired?boolean>
            <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        </#if>
        
        <script>
            console.log("url printing ","${url.resourcesPath}")
        </script>
    <#elseif section="form">
      <div class="box">
        <div class="login-form-container">
            <h1 class="login-form-title">Log in</h1>
            <form id="kc-form-login" class="login-form" onsubmit="return verifyRecaptcha();" action="${url.loginAction}" method="post">
                <div class="form-input-container">
                    <label for="username">${msg("Username")}</label>
                    <input id="username" class="login-field" placeholder="${msg('username')}" type="text" name="username" tabindex="1">
                </div>
                <div class="form-input-container password-field">
                    <label for="password">${msg("Password")}</label>
                    <input id="password" class="login-field password-input" placeholder="${msg('password')}" type="password" name="password" tabindex="2">
                    <img id="vi" src="${url.resourcesPath}/img/eye-close.svg" onclick="togglePassword()" class="password-toggle">
                </div>
                <div class="form-options">
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
                        <a tabindex="5" href="${url.loginResetCredentialsUrl}" class="forgot-password">${msg("doForgotPassword")}</a>
                    </#if>
                </div>
                 <#if properties.recaptchaRequired?boolean>
                    <div class="recaptcha" id="kc-captcha">
                        <div class="g-recaptcha" data-sitekey="${properties.recaptchaSiteKey}" data-callback="recaptchaCallback"></div>
                    </div>
                   
                </#if>
                <input class="submit" type="submit" value="Sign in" tabindex="3">
                <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                    <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                </#if>

                 <div id="alert-message" class="alert-message-icon-div" style="display: none;">
                        <img src="${url.resourcesPath}/img/erroragain.svg" alt="img"/>
                        <span class="message-text">Please complete the reCAPTCHA</span>
                    </div>

            </form>
            <div class="introduction-content-container">
                <div class="introduction-content">
                    <h2>Introducing CyberWasp</h2>
                    <p>Engineered for uncompromising security, CyberWasp safeguards your digital assets with confidence.</p>
                </div>
            </div>
            <#if social.providers??>
                <div id="social-providers">
                    <#list social.providers as p>
                        <input class="social-link-style" type="button" onclick="location.href='${p.loginUrl}';" value="${p.displayName}" />
                    </#list>
                </div>
            </#if>
        </div>
    </div>
    </#if>
</@layout.registrationLayout>

<script>
    var recaptchaResponse = "";
    var recaptchaRequired = ${properties.recaptchaRequired?string};

    function recaptchaCallback(response) {
        recaptchaResponse = response;
    }

    function verifyRecaptcha() {
        if (recaptchaRequired) {
            if (recaptchaResponse === "") {
                var alertMessage = document.getElementById('alert-message');
                alertMessage.style.display = 'block';
                return false;
            }
        }
        return true;
    }
</script>
