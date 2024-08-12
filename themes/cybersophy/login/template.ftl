<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <link href="${url.resourcesPath}/img/icon.svg" rel="icon" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap" rel="stylesheet">
    <style>
       .success-message {
            display: flex;
            align-items: center;
            color: #4CAF50;
            font-family: 'Inter', sans-serif;
            font-size: 0.8rem;
            padding: 10px;
            background-color: #E8F5E9;
            border: 1px solid #4CAF50;
            border-radius: 4px;
            margin: 10px 0;
            position:relative;
            left:18%;
        }
        .success-icon {
            width: 20px;
            height: 20px;
            margin-right: 10px;
            flex-shrink: 0;
        }
        .error-message {
          display: flex;
          align-items: center;
          color: #FF0000;
          font-family: 'Inter', sans-serif;
          font-size: 1rem;
          padding: 10px;
          <#--  background-color: #FCE4E4;  -->
          <#--  border: 1px solid #FF4B55;  -->
          border-radius: 4px;
          margin: 10px 0;
          position: relative;
          left: 12%;
      }
      .error-icon {
          width: 20px;
          height: 20px;
          margin-right: 10px;
          flex-shrink: 0;
      }
        /* Media Queries for different screen sizes */
    @media (max-width: 1200px) {
        .error-message {
            left: 60%;
            transform: translateX(-60%);
        }
    }
    @media (max-width: 992px) {
        .error-message {
            left: 60%;
            transform: translateX(-60%);
        }
    }
    @media (max-width: 768px) {
        .error-message {
            left: 50%;
            transform: translateX(-50%);
        }
    }
    @media (max-width: 576px) {
        .error-message {
            left: 50%;
            transform: translateX(-50%);
        }
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

        var errorElement = document.querySelector("body > div.login-page-container > div.alert.alert-message-icon-div.alert-error > span");
        if (errorElement) {
            errorElement.parentNode.innerHTML = `
                <div class="error-message">
                    <img src="${url.resourcesPath}/img/erroragain.svg" class="error-icon" alt="Error icon"/>
                    <span>Invalid username or password. Try again</span>
                </div>`;
        }

        var successElement = document.querySelector("body > div.login-page-container > div.alert.alert-message-icon-div.alert-success");
        if (successElement) {
            successElement.innerHTML = `
                <div class="success-message">
                    <img src="${url.resourcesPath}/img/success.svg" class="error-icon" alt="Error icon"/>

                    You should receive an email shortly with further instructions.
                </div>`;
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
        <div class="login-page-logo">
          <img class="logo" src="${url.resourcesPath}/img/cybersophy-logo.svg" alt="cyberwasp">
        </div>
        
        <div class="forgot-password-form-title">    
          <b><#nested "header"></b>
        </div>

        <#nested "form">
		
        <#if displayMessage && message?has_content>
          <div class="alert alert-message-icon-div alert-${message.type}">
            <img src="${url.resourcesPath}/img/erroragain.svg" class="error-msg-icon" alt="img"/>
            <span class="message-text">${message.summary?no_esc}</span>
          </div>
        </#if>

        <!-- Copyright section moved inside the login-page-container -->
        <#--  <div class="rights">
          <p class="copyright"> © ${.now?string("yyyy")} Copyrights reserved by CyberWasp</p>
        </div>  -->
      </div>
    </body>
  </html>
</#macro>
