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
			<div class="box1">
        	    <div class="header">
					<div style="display:flex;justify-content:space-between;flex-wrap:wrap;">
					 	<div><img src="${url.resourcesPath}/img/Logo.svg" alt="loginbannerimg" /></div>
						<div>
							<p class="banner-sub-text">Excellence is Amplified <br>Insurance is Simplified </p>
						</div>
					</div>
					<div style="width:95%;margin-left:auto">
						<div style="border:1px solid #FFFFFF30;width:97%"></div>
							<div style="display:flex;justify-content:space-between;margin-top:5vh;width:100%">
								<div  class="sub-icons">
									<img src="${url.resourcesPath}/img/notes.svg"  alt="notes" />
									<p class="sub-icons-heading">Instant Quotes</p>
									<p class="icons-sub-text">Get personalized insurance <br>quotes in seconds.</p>
								</div>
							<div class="sub-icons">
									<img src="${url.resourcesPath}/img/quality.svg"  alt="quality" />
									<p class="sub-icons-heading">Expert Guidance</p>
									<p class="icons-sub-text"> Access expert advice <br>tailored to your needs.</p>
							</div>
							<div class="sub-icons">
									<img src="${url.resourcesPath}/img/comparision.svg"  alt="comparision" />
									<p class="sub-icons-heading">Hassle-Free Comparison</p>
									<p class="icons-sub-text">Compare quotes effortlessly <br>and make informed decisions.</p>
							</div>
						</div>
						<div style="background-color:#FFFFFF;width:97%;padding: 1% 0 1% 0;margin-top:5vh;">
							<p class="footer-main-heading">Unlock personalized insurance quotes instantly, guided by experts, hassle-free.</p>
							<p class="footer-sub-text">Discover tailored insurance quotes in seconds, guided by experts for hassle-free comparison <br>and confident decisions.</p>
						</div>
        	        </div>
        	    </div>
				<div class="footer">
					<p style="text-align:right;color:#FFFFFF;font-family: Roboto,sans-serif">www.insurpro.com</p>
				</div>
            </div>
            <div class="login-content">
					<#--  <div style="text-align:center;margin-top:15vh"> 
                        <img class="logo" src="${url.resourcesPath}/img/Logo.png" alt="Logo-insur">
                    </div>  -->
					<#--  style="margin-top:-22vh"  -->
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
                        <p class="copyright"> © 2024 Copyrights reserved by InsurPro</p>
                    </div>
			</div>
	</div>
</body>
</html>
</#macro>