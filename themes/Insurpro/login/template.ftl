<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="robots" content="noindex, nofollow">
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
	<div style="display: flex;
            width: 100%;
            height: 100vh;
            overflow-x: hidden;
            overflow-y: hidden;
			box-sizing:border-box;">
              	<#nested "header">
			<div class="box1">
        	    <div class="image1">
        	        <img src="${url.resourcesPath}/img/Group 24042055.svg" style="margin-top:5vh;"
        	             alt="loginbannerimg" />
					<img src="${url.resourcesPath}/img/Excellence is amplified, Insurance Simplified.png" style="margin-top:2vh;"
        	             alt="loginbannerimg" />
        	    </div>
            </div>
            <div class="login-content">
					<div class="log-container">
              		<#if displayMessage && message?has_content>
					<div class="alert alert-${message.type}">
				    	<#if message.type = ' success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
						<#if message.type='warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
						<#if message.type='error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
						<#if message.type='info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
						<span class="message-text">${message.summary?no_esc}</span>
					</div>
					</#if>
					<#nested "form">
					</div>
					<div class="rights">
                        <p class="copyright"> © 2024 Copyrights reserved by InsurPro</p>
                    </div>
			</div>
	</div>
</body>
</html>
</#macro>