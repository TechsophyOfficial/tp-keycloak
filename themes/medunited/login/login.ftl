<#import "template.ftl" as layout>
    <style>
    .emr-login-text {
        text-align: center;
        font-size: 22px;
        font-weight: 900;
        color: #004c91;
        position: absolute;
        top: -25px;
        left: 0;
        width: 100%;
    }

    .login {
        height: 300px;
        position: absolute;
        left: 10px;
        right: 10px;
        top: 0;
        bottom: 0;
        margin: auto;
        font-size: .865em;
        max-width: 500px;
    }

    .login form {
        border-radius: 0 0 10px 10px;
        box-shadow: 0 10px 10px -10px #666;
        background: #fff;
    }

    .login header {
        border-radius: 10px 10px 0 0;
        box-sizing: border-box;
        color: #fff;
        font-weight: 700;
        font-size: 20px;
        line-height: 52px;
        padding: 0 20px;
        background: #004c91;
    }

    .reg-header {
        overflow: hidden;
        height: 60px;
    }

    .login header {
        border-radius: 10px 10px 0 0;
        box-sizing: border-box;
        color: #fff;
        font-weight: 700;
        font-size: 20px;
        line-height: 52px;
        padding: 0 20px;
    }

    .login-body {
        display: flex;
        flex-direction: column;
    }

    .login .login-body .form-field {
        display: flex;
        width: 100%;
        padding: unset;
        margin: unset;
    }

    .form-group {
        padding: 10px;
        margin-bottom: unset !important;
    }

    .form-input {
        height: 100% !important;
        width: 100% !important;
        min-height: unset !important;
        border-radius: 5px !important;
    }

    .form-footer {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .form-field {
        display: block;
        margin: 10px 13px 10px 17px;
        padding-bottom: 35px;
    }

    .field-attribute,
    .field-value {
        width: 100%;
    }

    .header-text {
        text-align: center;
        margin: 0px auto 25px;
        color: #004c91;
        font-size: 18px;
        width: 100%;
    }

    .united-text {
        color: #f47321;
    }
    </style>
    <@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
        <#if section="header">
            <#-- ${msg("loginAccountTitle")} -->
                <#elseif section="form">
                    <div id="kc-form" class="login">
                        <div id="kc-form-wrapper">
                            <div class="header-text">
                                <b>Welcome To Med<span class="united-text">United</span></b>
                            </div>
                            <header class="reg-header" style="background: #004c91">
                                <div class="left">Login</div>
                            </header>
                            <#if realm.password>
                                <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                                    <div class="login-body">
                                        <div class="form-group">
                                            <div class="form-field">
                                                <div class="field-attribute">
                                                    <label for="username" class="${properties.kcLabelClass!}">
                                                        <#if !realm.loginWithEmailAllowed>
                                                            ${msg("username")}
                                                            <#elseif !realm.registrationEmailAsUsername>
                                                                ${msg("usernameOrEmail")}
                                                                <#else>
                                                                    ${msg("email")}
                                                        </#if>
                                                    </label>
                                                </div>
                                                <div class="field-value">
                                                    <#if usernameEditDisabled??>
                                                        <input tabindex="1" id="username" class="${properties.kcInputClass!} form-input" name="username" value="${(login.username!'')}" type="text" disabled />
                                                        <#else>
                                                            <input tabindex="1" id="username" class="${properties.kcInputClass!} form-input" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" />
                                                    </#if>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-field">
                                                <div class="field-attribute">
                                                    <label for="password" class="${properties.kcLabelClass!}">
                                                        ${msg("password")}
                                                    </label>
                                                </div>
                                                <div class="field-value">
                                                    <input tabindex="2" id="password" class="${properties.kcInputClass!} form-input" name="password" type="password" autocomplete="off" />
                                                </div>
                                            </div>
                                        </div>
                                        <div id="kc-form-buttons" class=" form-footer">
                                            <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"
                            </#if>/>
                            <input tabindex="4"
                                style="
                                        display: inline-block;
                                        margin: 2px;width: 73%;
                                        background: #004c91;
                                        border: 1px solid #004c91;
                                        width: 178px;
                                        border-radius: 3px;
                                        color: #fff;
                                        cursor: pointer;"
                                class="
                                        ${properties.kcButtonClass!}
                                        ${properties.kcButtonPrimaryClass!} 
                                        ${properties.kcButtonBlockClass!} 
                                        ${properties.kcButtonLargeClass!}"
                                name="login"
                                id="kc-login"
                                type="submit"
                                value="Login" />
                        </div>
                    </div>
                    </form>
        </#if>
        </div>
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                <hr />
                <h4>
                    ${msg("identity-provider-login-label")}
                </h4>
                <ul class="${properties.kcFormSocialAccountListClass!}
                        <#if social.providers?size gt 3>
                        ${properties.kcFormSocialAccountListGridClass!}
                        </#if>">
                    <#list social.providers as p>
                        <a id="social-${p.alias}" class="${properties.kcFormSocialAccountListButtonClass!}
                                <#if social.providers?size gt 3>
                                ${properties.kcFormSocialAccountGridItem!}
                                </#if>"
                            type="button" href="${p.loginUrl}">
                            <#if p.iconClasses?has_content>
                                <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">
                                    ${p.displayName!}
                                </span>
                                <#else>
                                    <span class="${properties.kcFormSocialAccountNameClass!}">
                                        ${p.displayName!}
                                    </span>
                            </#if>
                        </a>
                    </#list>
                </ul>
            </div>
        </#if>
        </div>
        <#elseif section="info">
            </#if>
    </@layout.registrationLayout>