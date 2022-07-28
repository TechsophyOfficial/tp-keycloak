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
    <link rel="icon" href="${url.resourcesPath}/img/augment-logo.svg" />
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
<div id="body-wrapper">
<div class="col-md-6 full-height welcome">
    <div class="welcome-page-section">
        <div class="welcome-text">
            <h1> Welcome to AWGMENT </h1>
            <ul>
                <li>3X Delivery Speed</li>
                <li>Reusable Components</li>
                 <li>Rapid Application Development (RAD)</li>
            </ul>
        </div>
         <div class="cards-wrapper">
            <div class="row">
                <div class="col-md-6">
                    <div class="welcome-page-card">
                        <span>
                            <svg width="38" height="38" viewBox="0 0 38 38" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M0 3.16667C0 1.41776 1.41777 0 3.16667 0H12.6667C14.4156 0 15.8333 1.41777 15.8333 3.16667V12.6667C15.8333 14.4156 14.4156 15.8333 12.6667 15.8333H3.16667C1.41776 15.8333 0 14.4156 0 12.6667V3.16667ZM3.95833 11.875V3.95833H11.875V11.875H3.95833Z" fill="#1E202C"/>
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M22.1667 3.16667C22.1667 1.41776 23.5844 0 25.3333 0H34.8333C36.5822 0 38 1.41777 38 3.16667V12.6667C38 14.4156 36.5822 15.8333 34.8333 15.8333H25.3333C23.5844 15.8333 22.1667 14.4156 22.1667 12.6667V3.16667ZM26.125 11.875V3.95833H34.0417V11.875H26.125Z" fill="#1E202C"/>
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M25.3333 22.1667C23.5844 22.1667 22.1667 23.5844 22.1667 25.3333V34.8333C22.1667 36.5822 23.5844 38 25.3333 38H34.8333C36.5822 38 38 36.5822 38 34.8333V25.3333C38 23.5844 36.5822 22.1667 34.8333 22.1667H25.3333ZM26.125 26.125V34.0417H34.0417V26.125H26.125Z" fill="#1E202C"/>
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M0 25.3333C0 23.5844 1.41777 22.1667 3.16667 22.1667H12.6667C14.4156 22.1667 15.8333 23.5844 15.8333 25.3333V34.8333C15.8333 36.5822 14.4156 38 12.6667 38H3.16667C1.41776 38 0 36.5822 0 34.8333V25.3333ZM3.95833 34.0417V26.125H11.875V34.0417H3.95833Z" fill="#1E202C"/>
                            </svg>
                        </span>
                        <h2>Workflow</h2>
                        <h2>Modeler</h2>
                        <p>Build a series of tasks & decisions that make up your business process</p>
                    </div>
                </div>
                 <div class="col-md-6">
                    <div class="welcome-page-card" style="float: left">
                        <span>
                           <svg width="34" height="38" viewBox="0 0 34 38" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M1.88889 0C0.845684 0 0 0.850659 0 1.9C0 2.94934 0.845684 3.8 1.88889 3.8H28.3333C29.3765 3.8 30.2222 2.94934 30.2222 1.9C30.2222 0.850659 29.3765 0 28.3333 0H1.88889Z" fill="#1E202C"/>
                                <path d="M0 13.3C0 12.2507 0.845684 11.4 1.88889 11.4H24.5556C25.5988 11.4 26.4444 12.2507 26.4444 13.3C26.4444 14.3493 25.5988 15.2 24.5556 15.2H1.88889C0.845684 15.2 0 14.3493 0 13.3Z" fill="#1E202C"/>
                                <path d="M1.88889 22.8C0.845684 22.8 0 23.6507 0 24.7C0 25.7493 0.845684 26.6 1.88889 26.6H32.1111C33.1543 26.6 34 25.7493 34 24.7C34 23.6507 33.1543 22.8 32.1111 22.8H1.88889Z" fill="#1E202C"/>
                                <path d="M1.88889 34.2C0.845684 34.2 0 35.0507 0 36.1C0 37.1493 0.845684 38 1.88889 38H17C18.0432 38 18.8889 37.1493 18.8889 36.1C18.8889 35.0507 18.0432 34.2 17 34.2H1.88889Z" fill="#1E202C"/>
                            </svg>

                        </span>
                        <h2>Rule</h2>
                        <h2>Modeler</h2>
                        <p>Start creating, changing & managing rules for your inbox items</p>
                    </div>
                </div>
            </div>
        </div>

         <div style="display:none" class="row">
        
                 <div class="col-md-6">
                    <div class="welcome-page-card" style="float : left">
                        <span>
                            <svg width="42" height="38" viewBox="0 0 42 38" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M21 4.22222H37.8L37.7998 8.44444H21C19.3072 8.44444 17.8398 7.67565 17.0792 7.24841C16.2425 6.77844 15.3726 6.18435 14.6781 5.71008L14.5242 5.60503C13.7193 5.05604 13.1164 4.65399 12.6065 4.37831C12.4665 4.30264 12.3631 4.25329 12.293 4.22222H4.2V12.6667H37.8L37.7998 8.44444L37.8 4.22222C40.1196 4.22222 42 6.11255 42 8.44444V33.7778C42 36.1097 40.1196 38 37.8 38H4.2C1.88044 38 0 36.1097 0 33.7778V4.22222C0 1.89032 1.88044 0 4.2 0H12.6C13.7886 0 15.4133 1.10868 16.9977 2.1898C18.5052 3.21849 19.9761 4.22222 21 4.22222ZM4.2 16.8889V33.7778H37.8V16.8889H4.2Z" fill="#1E202C"/>
                            </svg>

                        </span>
                        <h2>Case</h2>
                        <h2>Modeler</h2>
                        <p>Depict a set of model to simplify the communications graphically</p>
                    </div>
                </div>
        </div>
    </div>
</div>
<div class="col-md-6 login-wrap">
  <div class="${properties.kcLoginClass!}" >
    <div id="kc-header" class="${properties.kcHeaderClass!}">
      <div id="kc-header-wrapper" class="${properties.kcHeaderWrapperClass!}"></div>
    </div>
    <div class="${properties.kcFormCardClass!} <#if displayWide>${properties.kcFormCardAccountClass!}</#if>">
      <header class="${properties.kcFormHeaderClass!}">
        <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
            <div id="kc-locale">
                <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                    <div class="kc-dropdown" id="kc-locale-dropdown">
                        <a href="#" id="kc-current-locale-link">${locale.current}</a>
                        <ul>
                            <#list locale.supported as l>
                                <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li>
                            </#list>
                        </ul>
                    </div>
                </div>
            </div>
        </#if>
        <#if !(auth?has_content && auth.showUsername() && !auth.showResetCredentials())>
            <#if displayRequiredFields>
                <div class="${properties.kcContentWrapperClass!}">
                    <div class="${properties.kcLabelWrapperClass!} subtitle">
                        <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                    </div>
                    <div class="col-md-10">
                        <h1 id="kc-page-title"><#nested "header"></h1>
                    </div>
                </div>
            <#else>
            </#if>
        <#else>
            <#if displayRequiredFields>
                <div class="${properties.kcContentWrapperClass!}">
                    <div class="${properties.kcLabelWrapperClass!} subtitle">
                        <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                    </div>
                    <div class="col-md-10">
                        <#nested "show-username">
                        <div class="${properties.kcFormGroupClass!}">
                            <div id="kc-username">
                                <label id="kc-attempted-username">${auth.attemptedUsername}</label>
                                <a id="reset-login" href="${url.loginRestartFlowUrl}">
                                    <div class="kc-login-tooltip">
                                        <i class="${properties.kcResetFlowIcon!}"></i>
                                        <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            <#else>
                <#nested "show-username">
                <div class="${properties.kcFormGroupClass!}">
                    <div id="kc-username">
                        <label id="kc-attempted-username">${auth.attemptedUsername}</label>
                        <a id="reset-login" href="${url.loginRestartFlowUrl}">
                            <div class="kc-login-tooltip">
                                <i class="${properties.kcResetFlowIcon!}"></i>
                                <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                            </div>
                        </a>
                    </div>
                </div>
            </#if>
        </#if>
      </header>
      <div id="kc-content">
        <div id="kc-content-wrapper">

          <#-- App-initiated actions should not see warning messages about the need to complete the action -->
          <#-- during login.                                                                               -->
          <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
              <div class="alert alert-${message.type}">
                  <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                  <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                  <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                  <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                  <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
              </div>
          </#if>

          <#nested "form">

          <#if auth?has_content && auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
          <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post" <#if displayWide>class="${properties.kcContentWrapperClass!}"</#if>>
              <div <#if displayWide>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
                  <div class="${properties.kcFormGroupClass!}">
                    <input type="hidden" name="tryAnotherWay" value="on" />
                    <a href="#" id="try-another-way" onclick="document.forms['kc-select-try-another-way-form'].submit();return false;">${msg("doTryAnotherWay")}</a>
                  </div>
              </div>
          </form>
          </#if>

          <#if displayInfo>
              <div id="kc-info" class="${properties.kcSignUpClass!}">
                  <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                      <#nested "info">
                  </div>
              </div>
          </#if>
        </div>
      </div>

    </div>
  </div>
  </div>
 </div>
  <!-- Footer -->
<footer class="page-footer font-small blue">

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
</footer>
<!-- Footer -->
</body>
</html>
</#macro>
