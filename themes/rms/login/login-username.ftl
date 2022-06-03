<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
<#if section = "title">
${msg("loginTitle",(realm.displayName!''))}
<#elseif section = "header">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<script></script>
<#elseif section = "form">
<div class="card card-3">



<#if realm.password>
<div class="card-body">
<div style="text-align:center;">
<img src="${url.resourcesPath}/img/kims_logo.png" alt="logo" style="height:60px; margin-top:30px; margin-bottom:60px">
</div>
<form id="kc-form-login" class="form form1" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
<div class="input-group">
<h2 style="margin-bottom:25px; color: #5F6062; text-align: center">Login</h2>
</div>
<div class="input-group">
<div>
   <#if usernameEditDisabled??>
      <input tabindex="1" id="username"
            aria-invalid="<#if message?has_content && message.type = 'error'>true</#if>"
            class="input--style-3 input-width" name="username"
            value="${(login.username!'')}"
            type="text" disabled/>
   <#else>
   <input id="username" class="input--style-3 input-width" type="text" placeholder="Phone"
      class="${properties.kcInputClass!}" name="username"
      value="${(login.username!'')}"
      type="text" autofocus autocomplete="off"/>
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
<span><a style="color:#e6186d;" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
</#if>
</div>
</#if>
<div class="p-b-20" style="text-align:center;">
<button class="submit" value="${msg('doLogIn')}" type="submit">Submit</button>
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
<div style="margin-top:50px;text-align:center">
<span style="text-size:13px;">Don't have an account?</span>

<a href="${url.registrationUrl}" style="color:#CF3438;">Sign Up Now</a>
<div>
</div>

</div>
</div>
<div class="card-heading" style="background: url('${url.resourcesPath}/img/kims.png'); background-size: 100% 100%">
<div class="card-sample-text">
<h2>KIMS facilitates with a Best in class Emergency Response Team</h2>
</div>
</div>
</#if>
</@layout.registrationLayout>