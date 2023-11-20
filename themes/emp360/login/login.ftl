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
<div class=" box2" style="background: url('${url.resourcesPath}/img/abstract-white-lines-background-minimal-dynamic-shape-3d-rendering 1.svg') no-repeat top right fixed; background-size: contain; ">
 	
      <div style="display: flex; width:100%">

                <img src="${url.resourcesPath}/img/Innovations.svg" style="width: 60px; margin-right: 10px; margin-top:8%"alt="innovationsImg " />

            

                <div class="box2-container">
    <div style="display: flex; flex-direction: column; align-items: flex-start; max-width: 600px; width: 100%;">
            
                <div class="application-name" style="text-align: center;margin-left:24%  " > Log In</div>
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
            <div id="social-providers1">
                <#list social.providers as p>
                <input class="social-link-style" type="button" onclick="location.href='${p.loginUrl}';" value="${p.displayName}"/>
                </#list>
            </div>
        </#if>
        </div></div>
        
        </#if>
       
    
        
        <div>
       
            <#--  <img class="copyright" src="${url.resourcesPath}/img/login-footer-bg.png" >  -->
        </div>
       
    </div>
    
      </#if>
</@layout.registrationLayout>
