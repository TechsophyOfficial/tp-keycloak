<#import "template.ftl" as layout>
    <@layout.registrationLayout displayInfo=social.displayInfo; section>
        <#if section="title">
            ${msg("loginTitle",(realm.displayName!''))}
            <#elseif section="header">
                <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" />
                <link href="${url.resourcesPath}/img/favicon.png" rel="icon" />
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
                    <div style="text-align: center"> 
<img class="logo" src="${url.resourcesPath}/img/Group 24042057.svg" alt="Logo-insur">
                    </div>
                    <div class="box">
                
                        <div class="box-container">
                            <div>
                                <div class="application-name"> <img class="loginHeading-image" src="${url.resourcesPath}/img/Group 779.svg"> Log In</div>
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
                           
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>
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