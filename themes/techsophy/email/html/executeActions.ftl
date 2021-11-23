<#outputformat "plainText">
<#assign requiredActionsText><#if requiredActions??><#list requiredActions><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#sep></#items></#list></#if></#assign>
</#outputformat>

<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
            rel="stylesheet"
    />
    <style>
        .container {
            margin: 10px;
            padding: 10px;
            font-family: Roboto;
            align-items: center;
        }
        p {
            margin: 0;
            padding: 0;
        }
        .ticketContainer {
            margin: 15px;
        }
        .ticketHeader {
            background-color: #f4f4f4;
            height: 140px;
            color: #162952;
            text-align: center;
        }
        .title {
            padding-top: 30px;
            font-weight: 600;
            font-size: 18px;
        }
        .ticketName {
            font-weight: 500;
            font-size: 15px;
            margin-top: 10px;
            margin-bottom: 16px;
        }
        .ticketBody {
            background-color: #fdfcfa;
            padding: 60px 20px 30px 20px;
        }
        .ticketInfo {
            font-size: 13px;
            margin-bottom: 15px;
            color: #162952;
        }
        .ticketFooter {
            height: 40px;
            padding: 0 15px;
            background-color: #f4f4f4;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .icons > a {
            margin: 0;
            padding: 0;
            text-decoration: none;
            margin-right: 5px;
        }
        .links > a {
            margin: 0;
            padding: 0;
            font-size: 11px;
            text-decoration: none;
            margin-left: 5px;
            color: #162952;
        }
        .copyright {
            text-align: center;
            font-size: 10px;
            color: #969696;
        }
        .org-logo {
            display: block;
            margin: auto;
        }
    </style>
</head>
<body>
<div class="container">
    <img class="org-logo" src="https://techsophy.com/assets/images/techsophy_logo.png" alt="Techsophy" />
    <div class="ticketHeader">
        <p class="title">Update Password</p>
        <img src="https://techsophy.com/assets/images/completed.png" alt="Icon" />
    </div>
    ${kcSanitize(msg("executeActionsBodyHtml",link, linkExpiration, realmName, requiredActionsText,
linkExpirationFormatter(linkExpiration), user.getFirstName()))?no_esc}
<div class="ticketFooter">
    <div class="icons">
        <a href="https://www.linkedin.com/company/techsophy" target="_blank" >
            <img height="13px" src="https://techsophy.com/assets/images/linkedin.png" alt="Linkedin" />
        </a>
        <a href="https://twitter.com/techsophyinc" target="_blank">
            <img height="12px" src="https://techsophy.com/assets/images/twitter.png" alt="Twitter" />
        </a> </div> <div class="links"> <a href="https://techsophy.com" target="_blank">Company</a>
        <a href="https://techsophy.com/terms_of_use" target="_blank" >Privacy Policy</a >
        <a href="https://techsophy.com/contact_us" target="_blank" >Contact Us</a >
    </div>
</div>

<p class="copyright">© Copyright 2021 TechSophy</p>
</div>
</body>
</html>
