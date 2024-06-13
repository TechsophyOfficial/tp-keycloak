<#import "template.ftl" as layout>
    <@layout.registrationLayout displayInfo=social.displayInfo; section>
        <#if section="title">
            ${msg("loginTitle",(realm.displayName!''))}
            <#elseif section="header">

            <link href="https://fonts.googleapis.com/css?family=Barlow" rel="stylesheet"/>
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

                <script>
                function togglePassword() {
                    var x = document.getElementById("password");
                    var v = document.getElementById("vi");
                    if (x.type === "password") {
                        x.type = "text";
                        v.src = "${url.resourcesPath}/img/eye.png";
                    } else {
                        x.type = "password";
                        v.src = "${url.resourcesPath}/img/eye-off.png";
                    }
                }

                
                </script>
                <#elseif section="form">
              
                    <div class="box">
                
                        <div class="box-container">
                          
                            
                            <#if realm.password>
                                <div class="login-form-container">
                                 <h1 class="login-form-title">Log in</h1>
                                <form id="kc-form-login" class="login-form" onsubmit="return true;" action="${url.loginAction}" method="post">
                                    <div class="form-input-container">
                                        <label for="username">${msg("Username")}</label>
                                        <input id="username" class="login-field" placeholder="${msg('username')}" type="text" name="username" tabindex="1">
                                    </div>
                                    <div class="form-input-container password-field">
                                        <label for="password">${msg("Password")}</label>
                                        <input id="password" class="login-field password-input" placeholder="${msg('password')}" type="password" name="password" tabindex="2">
                                        <img id="vi" src="${url.resourcesPath}/img/eye-off.png" onclick="togglePassword()" class="password-toggle">
                                    </div>
                                  <div class="form-options">
                                    <div class="form-rememberme-box">
                                        <input type="checkbox" id="remember-me" name="rememberMe">
                                        <label for="remember-me">${msg("rememberMe")}</label>
                                    </div>
                                    <#if realm.resetPasswordAllowed>
                                        <a tabindex="5" href="${url.loginResetCredentialsUrl}" class="forgot-password">${msg("doForgotPassword")}</a>
                                    </#if>
                                </div>
                                <input class="submit" type="submit" value="Sign in" tabindex="3">
                                <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                                     <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span> 
                                </#if>  
                            </form>
                            
                              
                                </div>
                                 
                            </#if>
                           
                            <div style="display: flex; gap: 2%; width:100%; justify-content:center;">
                                <div class="introduction-content">
                                    <h2>Introducing CyberWasp</h2>
                                    <p>Engineered for uncompromising security,CyberWasp safeguards your digital assets with confidence.</p>
                                </div>
                            </div>
                                <#if realm.resetPasswordAllowed && realm.password && realm.registrationAllowed && !registrationDisabled??>
                                </#if>
                               
                               
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