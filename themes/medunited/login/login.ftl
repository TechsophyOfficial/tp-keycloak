<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
<#if section = "title">
${msg("loginTitle",(realm.displayName!''))}
<#elseif section = "header">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<script></script>
<#elseif section = "form">
<h2 class="title" style="text-align:center;">Welcome To Med<span>United</span> - Appointments</h2>


<div class="login-card card">
<#if realm.password>
<div class="card-body">
<h4>Login</h4>
<form id="kc-form-login" class="form form1" return true;" action="${url.loginAction}" method="post">
<div style="margin-top:40px"></div>
   <div class="input-group">
      <label>Username <span>*</span> </label>
      <div>
         <input id="username" class="input--style-3 input-width" type="text" placeholder="Email" name="username">
      </div>
   </div>
   <div class="input-group">
      <label>Password <span>*</span> </label>
      <div>
         <input class="input--style-3 input-width" id="txtPassword" type="password" placeholder="Password" name="password">                       
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
   <div class="" style="text-align:center;padding-bottom:20px">
      <button class="submit" value="${msg('doLogIn')}" type="submit">Login</button>
   </div>
</form>
</#if>
<#if social.providers??>
<div id="social-providers" style="text-align:center;">
   <p><span style="text-align:center;"> or Login With </span></p>
</div>
<#list social.providers as p>
<div style="display: flex; margin-left:20px;">
   <input class="${p.displayName}" 
      style="margin-left:10;margin-right: 10"
      type="button" onclick="location.href='${p.loginUrl}';" value="${p.displayName}"/>
   </#list>
</div>
</#if>
<#--
<div style="margin-top:50px;text-align:center">
   <span style="text-size:16px;">Don't have an account?</span>
   <a href="${url.registrationUrl}" style="color:#e6186d;">Signup</a>
   <div> -->
   </div>
</div>
</#if>
</@layout.registrationLayout>