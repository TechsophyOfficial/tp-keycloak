<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"/>
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
    <#elseif section = "form">
<div class="box2" style="width: 100%">

<div style="position: relative; width: 100%; height: 100vh; overflow: hidden;">
                <img src="${url.resourcesPath}/img/Export-bg.svg" style="width: 100%; height: 100%; object-fit: cover;" alt="loginbannerimg" />
            </div>
   
      
              
 <div class="box2-container" style="position: absolute">
    <div style="display: flex; flex-direction: column; align-items: flex-start; width: 100%;">
            
                <div class="application-name"> Log In</div>
                <#--  <p class="application-data">Log in to continue to Parasakti Portal</p>  -->
            </div>
        <#if realm.password>
            <div>
               <form id="kc-form-login" class="form" onsubmit="return true;" action="${url.loginAction}" method="post">
                
                    <input id="usericon" class="login-field" placeholder="${msg("username")}" type="text" name="username" tabindex="1">
                    <#--  <div>
                        <label class="visibility" id="v" onclick="togglePassword()"><img id="vi" src="${url.resourcesPath}/img/eye-off.png"></label>
                    </div>  -->
                    
                <input id="password" class="login-field passwordicon" placeholder="${msg("password")}" type="password" name="password" tabindex="2">
                <input class="submit" type="submit" value="SIGN IN" tabindex="3">
                </form>
                
            </div>
             <#if social.providers??>
            <div id="social-providers" style="display: flex; flex-direction: row; justify-content: center; flex-wrap: wrap; gap: 2%">
                <#list social.providers as p>
                <a class="social-link-style" href="${p.loginUrl}" style="width: fit-content; border-radius: 40px; text-decoration:none; font-family: Roboto, sans-serif;">${p.displayName}</a>
                </#list>
            </div>
        </#if>
        </div></div>
        
        </#if>
       
    
        
        <div>
       
            <#--  <img class="copyright" src="${url.resourcesPath}/img/login-footer-bg.png" >  -->
        </div>
       
    </div>
 </div>
</div>
    
      </#if>
</@layout.registrationLayout>
