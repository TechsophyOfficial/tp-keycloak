<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false; section>

      <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
	<#if section = "form">
      <div class="card card-3">
         <div class="card-body">
            <div style="text-align:center;">
               <img src="${url.resourcesPath}/img/kims_logo.png" alt="logo" style="height:60px; margin-top:30px; margin-bottom:60px">
            </div>
            <form id="kc-form-login" class="form form1" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
               <div class="input-group">
                  <h2 style="margin-bottom:25px; color: #5F6062; text-align: center">Verify OTP</h2>
               </div>
               <div class="input-group">
                  <input id="code" name="code" class="input--style-3 input-width" 

                     class="${properties.kcInputClass!}"
                     style="text-align: center"
                     placeholder="&#11044    &#11044    &#11044    &#11044    &#11044    &#11044"
                     type="password" autofocus/>
               </div>
               <div class="p-b-20" style="text-align:center;">
                  <button class="submit" value="${msg("doSubmit")}" type="submit">Verify OTP</button>
               </div>
            </form>
         </div>
         <div class="card-heading" style="background: url('${url.resourcesPath}/img/kims.png'); background-size: 100% 100%">
            <div class="card-sample-text">
               <h2>KIMS facilitates with a Best in class Emergency Response Team</h2>
            </div>
         </div>
      </div>
	<#elseif section = "info" >
	</#if>
</@layout.registrationLayout>