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
		<link href="https://fonts.googleapis.com/css2?family=Barlow:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

		<title>
			<#nested "title">
		</title>
		<#if properties.styles?has_content>
			<#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
</head>
	<script>
	// Function to change the submit button value
		document.addEventListener('DOMContentLoaded', function() {
			var button = document.querySelector("#kc-form-buttons input[type='submit']");
			if (button) {
				button.value = "Send Recovery mail";
			} else {
				console.error("Submit button not found!");
			}
		});
	</script>
<body class="${properties.kcBodyClass!}">
	<div class="login-page-container">
            <div class="login-page-quarter-circle">
				<div class="logo-container">
				    <div class="login-page-logo">
                    	<img class="logo" src="${url.resourcesPath}/img/cybersophy-logo.svg" alt="cyberwasp">
					</div>
				</div>	

			<div>
			<#if displayMessage && message?has_content>
				<div class="alert alert-${message.type}">
				<#if message.type = ' success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
				<#if message.type='warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
				<#if message.type='error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
				<#if message.type='info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
				<span class="message-text">${message.summary?no_esc}</span>
			</div>
			</#if>
            <div class="forgot-password-form-title">		
				<b><#nested "header"></b>
			</div>
			<#nested "form" >
			
			</div>
			<div class="rights">
				<p class="copyright"> © ${.now?string("yyyy")} Copyrights reserved by CyberWasp</p>
			</div>
		</div>
	</div>
</body>
</html>
</#macro>
