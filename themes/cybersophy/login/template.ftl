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
<body class="${properties.kcBodyClass!}">
	<div style="display: flex;
            width: 100%;
            height: 100vh;
            overflow-x: hidden;
            overflow-y: hidden;
			box-sizing:border-box;">
			<div class="box1">
        	    <div class="header">
					<h1>SECURE YOUR WEB APPLICATIONS</h1>
					<h2>with</h2>
					<img src="${url.resourcesPath}/img/cybersophy-logo.svg" alt="Logo">
					
        	    </div>
				
            </div>

			
            <div class="login-content">
			
					<div class="log-container" >
					<#if displayMessage && message?has_content>
			<div class="alert alert-${message.type}">
				<#if message.type = ' success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
				<#if message.type='warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
				<#if message.type='error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
				<#if message.type='info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
				<span class="message-text">${message.summary?no_esc}</span>
			</div>
			</#if>
              		
					<b><#nested "header"></b>
					<#nested "form">
					</div>
					<div class="rights">
    					<p class="copyright"> © ${.now?string("yyyy")} Copyrights reserved by CyberWasp</p>
                    </div>
			</div>
	</div>
</body>
</html>
</#macro>