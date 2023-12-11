<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <title><#nested "title"></title>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
</head>

<body class="${properties.kcBodyClass!}">
	<div style="display: flex;
            width: 100%;
            height: 100%;
            overflow-x: hidden;
            overflow-y: hidden;">
              	<#nested "header">
    
		<div class="box1">
        	   
        	<div class="image1">
            <div style="position: relative; width: 100%; height: 100vh; overflow: hidden;">
                <img src="${url.resourcesPath}/img/img_left.svg" style="width: 100%; height: 100%; object-fit: cover;" alt="loginbannerimg" />
                <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: linear-gradient(180deg, #D9D9D9 0%, #090D2D 100%); mix-blend-mode: multiply;"></div>
                <img src="${url.resourcesPath}/img/Logo_company.svg" style="position: absolute; bottom: 4%; left: 50%; transform: translateX(-50%); width: 60%;" alt="companyLogo" />
                <img src="${url.resourcesPath}/img/for the new normal.svg" style="position: absolute; top: 51%; right: 0;height: 42%; margin: 2%;" alt="newNormalImage" />
            </div>
            </div>

              	</div>
              	<div class="login-content" style="width: 50%">
                
              		<#if displayMessage && message?has_content>
				<div class="alert alert-${message.type}">
				     <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
				     <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
				     <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
				     <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
				     <span class="message-text">${message.summary?no_esc}</span>
				</div>
			</#if>
			<#nested "form">
              	</div>
              
        </div>
     
    </div>    
</body>
</html>
</#macro>
