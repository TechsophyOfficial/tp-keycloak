<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false displayWide=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    
    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body class="${properties.kcBodyClass!}">
<div style="width: 100%; background: #004c91; height: 60px">
    <img class="client_logo" src="${url.resourcesPath}/img/medunited_logo.svg" style="width: 160px; padding: 12px">
</div>
<div id="body-wrapper">

<div class="col-12">
  <div class="${properties.kcLoginClass!}" >
    <#--  <div id="kc-header" class="${properties.kcHeaderClass!}">
      <div id="kc-header-wrapper" class="${properties.kcHeaderWrapperClass!}"></div>
    </div>  -->
    <#nested "form">
    
  </div>
  </div>
 </div>
  <!-- Footer -->
<#--  <footer class="page-footer font-small blue">

  <div class="footer-wrapper">
                <div class="footer-text">
                    <p>
                        A product of <b>techsophy</b> 2021
                    </p>
                </div>
                <div class="footer-text">
                    <p style="width: 100%; text-align: right">
                        Powered by <b>AWGMENT</b>
                    </p>
                </div>
            </div>
</footer>  -->
<!-- Footer -->
</body>
</html>
</#macro>
