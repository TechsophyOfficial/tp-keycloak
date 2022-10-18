<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username') displayInfo=(realm.password && realm.registrationAllowed && !registrationDisabled??); section>
<#if section = "title">
${msg("loginTitle",(realm.displayName!''))}
<#elseif section = "header">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<style>
 .card-body {
  padding: 32px 50px 0 50px !important;
  width: 45% !important;
  display: table-cell;
  background-color: #ffffff;
  border-radius: 8px;
  
}
.submit {
  /* width: 100%;
  height: 36px; */
  padding: 10px 20px;
  border-radius: 7px;
  background-color: #162952;
  font-size: 14px;
  font-style: normal;
  text-align: center;
  color: #ffffff;
  border-style: none;
  cursor: pointer;
}
</style>
<#elseif section = "form">
<div class="card card-3" style="background: url('${url.resourcesPath}/img/background.svg'); background-size: 100%; background-repeat: no-repeat">

<#if realm.password>
<div class="card-body">
<#--  <h2 class="title" style="font-family:'Roboto';">Welcome</h2>  -->
<div style="text-align: center">
<img src="${url.resourcesPath}/img/techsophy_logo.svg" height="20" style="margin-right: 5px; vertical-align: middle"/>
</div>
<#--  <p>Login your account with</p>  -->
<form id="kc-form-login" class="form form1" return true;" action="${url.loginAction}" method="post">
   <div class="input-group">
      <p style="margin: 0px 0px 10px 0px; padding: 0; text-align: center; font-size: 20px; color:#162952">Login</p>
      <div>
         <#if usernameEditDisabled??>
            <input tabindex="1" id="username" placeholder="Phone / Email"
                  aria-invalid="<#if message?has_content && message.type = 'error'>true</#if>"
                  class="input--style-3 input-width" name="username"
                  value="${(login.username!'')}"
                  type="text" disabled/>
         <#else>
            <input tabindex="1" id="username" placeholder="Phone / Email"
                  aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                  class="input--style-3 input-width" name="username"
                  value="${(login.username!'')}"
                  type="text" autofocus autocomplete="off"/>
         </#if>
         <#if messagesPerField.existsError('username')>
               <span id="input-error-username" aria-live="polite">
                  ${kcSanitize(messagesPerField.get('username'))?no_esc}
               </span>
         </#if>
      </div>
   </div>
   <#if realm.rememberMe && !usernameEditDisabled??>
   <div class="checkbox">
      <label>
      <#if login.rememberMe??>
      <input id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
      <#else>
      <input id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
      </#if>
      </label>
   </div>
   <div style="float: right; margin-top: -25px">
      <#if realm.resetPasswordAllowed>
      <span><a style="color:#e6186d;"  href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
      </#if>  
   </div>
   </#if>  
   <div class="p-b-20" style="text-align:center;">
      <button name="loginWithOTP" class="submit" type="submit" value="Send OTP")}">Send OTP</button>
   </div>
   <div style="text-align:center; margin-top: 15px">
      <button name="loginWithPassword" type="submit" style="color: #4D6CD9" value="Or Enter Password">Or Enter Password</button>
   </div>
</form>
</#if>
   <#--  <div style="margin: 30px 0">
      <p style="margin: 10px 0 20px; border-bottom: 1px solid #a7a0b3; line-height: 0.1em"><span style="padding:0 10px;">Or</span></p>
   </div>  -->
<#if realm.password && social.providers??>
<#list social.providers as p>
<#--  <div>
   <button class="${p.displayName}" type="button" onclick="location.href='${p.loginUrl}';" value="Login With ${p.displayName}"><img src="${url.resourcesPath}/img/${p.displayName}.png" height="20" style="margin-right: 5px; vertical-align: middle"/> Login With ${p.displayName}</button>
</div>  -->
</#list>
</#if>
 <div style="margin-top:50px;text-align:center">
   <#--  <span style="text-size:13px;">Don't have an account?</span>  -->
   <a href="${url.registrationUrl}" style="color:#162952;">Register</a>
    <#--  <div id="kc-registration">
                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>  -->
</div>

      <#--  <div style="margin-top:50px;text-align:center">
         <footer>
            <p class="copyright" style="font-size:11px">© 2021 Hiringhood, All Rights Reserved</p>
         </footer>
      </div>  -->
</div>
</#if>
</@layout.registrationLayout>