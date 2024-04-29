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
                <div style="text-align: center;">
                    <img style="margin-bottom:0;margin-top:-20vh" class="logo" src="${url.resourcesPath}/img/cybersophy-logo.svg" alt="cyberwasp">
                </div>
                    <div class="box">
                
                        <div class="box-container">
                            <div style="margin-bottom:2vh">
                                <div class="application-name">  
                                <img class="loginHeading-image"  src="${url.resourcesPath}/img/Group.png">

                                Log In</div>
                            </div>
                            
                            <#if realm.password>
                                <div>
                                    <form id="kc-form-login" class="form" onsubmit="return true;" action="${url.loginAction}" method="post">
                                        <input id="usericon" class="login-field" placeholder="${msg("username")}" type="text" name="username" tabindex="1">
                                        <#-- <div><label class="visibility" id="v" onclick="togglePassword()"><img id="vi" src="${url.resourcesPath}/img/eye-off.png"></label></div> -->
                                        <input id="password" class="login-field passwordicon" placeholder="${msg("password")}" type="password" name="password" tabindex="2">
                                        <input class="submit" type="submit" value="Login" tabindex="3">
                                    </form>
                                </div>
                            </#if>

                     <#--  forgot password implementation  -->

                           
                            <div style="display: flex; gap: 2%; width:100%; justify-content:center;">
                                <#if realm.resetPasswordAllowed>
                                    <span>
                                        <a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                                    </span>
                                </#if>
                                <#if realm.resetPasswordAllowed && realm.password && realm.registrationAllowed && !registrationDisabled??>
                                <span> || </span>
                                </#if>
                                <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                                     <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span> 
                                </#if>
                                
                            </div> 
                            <#if social.providers??>
                                <#--  <p class="para">${msg("selectAlternative")}</p>  -->
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