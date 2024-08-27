<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
    <link href="${url.resourcesPath}/img/icon.svg" rel="icon" />
 
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap" rel="stylesheet">
    <style>
       .success-message {
            align-self: center;
            color: #4CAF50;
            font-family: 'Inter', sans-serif;
            font-size: 0.8rem;
            padding: 10px;
            background-color: #E8F5E9;
            border: 1px solid #4CAF50;
            border-radius: 4px;
            margin-top:-2.5rem;
            display: inline-flex;
            align-items: center;
          
        }
        .success-icon {
            width: 20px;
            height: 20px;
            margin-right: 10px;
            flex-shrink: 0;
        }
        .warning-message{
          align-self: center;
          font-size:0.95rem;
          color:#4CAF50;
          background-color: #E8F5E9;
          border: 1px solid #4CAF50;
          padding:0.5rem;
          border-radius: 4px;
          margin-top:1rem;
          display: inline-flex;
          align-items:center;
          justify-content:center;
          
        }
        .error-message {
          align-self: center;
          color: #FF0000;
          font-family: 'Inter', sans-serif;
          font-size: 1rem;
          padding: 10px;
          background-color: #FCE4E4;
          border: 1px solid #FF4B55;
          border-radius: 4px;
          display: flex;
          align-items: center;margin-top:-2.5rem;
          
          
      }
      .error-icon {
          width: 20px;
          height: 20px;
          margin-right: 10px;
          flex-shrink: 0;
      }
 
    
    </style>
    <script>
  // Function to change the submit button value
    document.addEventListener('DOMContentLoaded', function() {
      var button = document.querySelector("#kc-form-buttons input[type='submit']");
      if (button) {
        button.value = "Send Recovery mail";
      } else {
        console.error("Submit button not found!");
      }
 
    // update password button value
 
      var updateBtn = document.querySelector("#kc-passwd-update-form #kc-form-buttons input[type='submit']");
 
      if(updateBtn){
          button.value = "Reset Password";
 
      }
 
          var updatePasswordElement = document.querySelector("body > div.login-page-container > div.alert.alert-message-icon-div.alert-warning > span");
          if (updatePasswordElement) {
              updatePasswordElement.parentNode.innerHTML = `
                  <div id="message-text" class="warning-message">
                      <span>You need to change your password to activate your account.</span>
                  </div>`;
 
              // Hide the error message after 5 seconds (5000 milliseconds)
              setTimeout(function() {
                  var updatePasswordElement = document.querySelector('.warning-message');
                  if (updatePasswordElement) {
                      updatePasswordElement.style.display = 'none';
                  }
              }, 3000);
          }
 
 
        var errorElement = document.querySelector("body > div.login-page-container > div.alert.alert-message-icon-div.alert-error > span");
        if (errorElement) {
            errorElement.parentNode.innerHTML = `
                <div id="message-text" class="error-message">
                    <img src="${url.resourcesPath}/img/erroragain.svg" class="error-icon" alt="Error icon"/>
                    <span>Invalid username or password. Try again</span>
                </div>`;
 
             // Hide the error message after 5 seconds (5000 milliseconds)
            setTimeout(function() {
                var errorMsg = document.querySelector('.error-message');
                if (errorMsg) {
                    errorMsg.style.display = 'none';
                }
            }, 3000);
        }
 
        var successElement = document.querySelector("body > div.login-page-container > div.alert.alert-message-icon-div.alert-success");
        if (successElement) {
            successElement.innerHTML = `
                <div id="message-text" class="success-message">
                    <img src="${url.resourcesPath}/img/success.svg" class="error-icon" alt="Error icon"/>
 
                    You should receive an email shortly with further instructions.
                </div>`;
 
 
               // Hide the error message after 5 seconds (5000 milliseconds)
            setTimeout(function() {
                var successMsg = document.querySelector('.success-message');
                if (successMsg) {
                    successMsg.style.display = 'none';
                }
            }, 3000);
        }
 
        
 
    });
 
    document.addEventListener("DOMContentLoaded", function() {
            var element = document.querySelector("body > div > div.login-page-quarter-circle > div:nth-child(2) > div.alert.alert-error > span.message-text");
            if (element) {
                element.textContent = "Invalid username or password. Try again";
            }
        });
 
  </script>
    <title>
      <#nested "title">
    </title>
    <#if properties.styles?has_content>
      <#list properties.styles?split(' ') as style>
        <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
      </#list>
    </#if>
  </head>
  <body class="${properties.kcBodyClass!}">
      <div class="login-page-container">
          <div class="quarter-circle"></div>
        <div class="login-page-logo">
          <img class="logo" src="${url.resourcesPath}/img/cybersophy-logo.svg" alt="cyberwasp">
        </div>
        
        <div class="forgot-password-form-title">    
          <b><#nested "header"></b>
        </div>
 
        <#nested "form">
    
        <#if displayMessage && message?has_content>
            <div style="display:none" id="alert-message" class="alert alert-message-icon-div alert-${message.type}">
                <span class="message-text">${message.summary?no_esc}</span>
            </div>
        </#if>
 
       
      </div>
    </body>
  </html>
</#macro>