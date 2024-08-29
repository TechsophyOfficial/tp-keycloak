<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
        <#if properties.recaptchaRequired?boolean>
            <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        </#if>
    <#if section = "header">
        ${msg("doLogIn")}
        
       
    <#elseif section = "form">
    <div id="kc-form" <#if realm.password && social.providers??>class="${properties.kcContentWrapperClass!}"</#if>>
      <div id="kc-form-wrapper" <#if realm.password && social.providers??>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
        <div style="margin-bottom:2vh">
            <div class="application-name">Log in</div>
        </div>
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <div class="${properties.kcFormGroupClass!}">
                    <label class="${properties.kcLabelClass!}">Username</label>
                    <#if usernameEditDisabled??>
                        <#--  placeholder="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>"   -->
                        <input id="usericon" tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled />
                    <#else>
                         <#--  placeholder="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>"    -->
                        <input id="usericon" tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off" />
                    </#if>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <label class="${properties.kcLabelClass!}">Password</label>
                    <#--  placeholder="${msg("password")}"    -->
                    <input tabindex="2" id="passwordicon"  class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off" style="position:relative;margin-bottom:-26px" />
                    <img  id="vi" src="${url.resourcesPath}/img/eye-close.svg" class="eye-icon" onclick="togglePassword()" alt="icon"/>
                </div>

                <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
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
                        <div class="${properties.kcFormOptionsWrapperClass!}" >
                            <#if realm.resetPasswordAllowed>
                                <span><a style="border-bottom:1px solid #0046FF" tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                            </#if>
                        </div>

                  </div>

            <#if properties.recaptchaRequired?boolean>
                <div class="recaptcha" id="kc-captcha">
                    <div class="g-recaptcha" data-sitekey="${properties.recaptchaSiteKey}" data-callback="recaptchaCallback"></div>
                </div>
            </#if>

                  <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                      <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                      <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                  </div>
            </form>
        </#if>
        
        </div>
        <div class="login-page-text-header">
            <div class="header-text-rb">Introducing Cyberwasp</div>
            <p class="subHeader-text-rb">Engineered for uncompromising security,<br/> CyberWasp safeguards your digital assets with confidence.</p>
        </div>
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}">
                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
                    <#list social.providers as p>
                    <li class="${properties.kcFormSocialAccountListLinkClass!}">
                    <#if p.providerId == "apple">
                    	<a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial appstore"> <span>${p.displayName}</span></a>
                    <#else>
                    	<a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span>${p.displayName}</span></a>
                    </#if>
                    </li>
                    </#list>
                </ul>
            </div>
        </#if>
      </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>


 <script >
    function togglePassword() {
        var x = document.getElementById("passwordicon");
        var v = document.getElementById("vi");
            if (x.type === "password") {
                x.type = "text";
                v.src = "${url.resourcesPath}/img/eye-open.svg";
            } else {
                x.type = "password";
                v.src = "${url.resourcesPath}/img/eye-close.svg";
                }
    }

    var recaptchaResponse = "";
    var recaptchaRequired = ${properties.recaptchaRequired?string};
    var submitButton = document.getElementById('kc-login');

    // Initially disable the submit button and apply the disabled color
    submitButton.disabled = true;
    submitButton.classList.add('disabled');


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
</script>