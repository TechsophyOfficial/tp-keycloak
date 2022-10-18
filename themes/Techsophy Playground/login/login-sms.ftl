<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
<#if section = "title">
${msg("loginTitle",(realm.displayName!''))}
<#elseif section = "header">
 <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
<style>
 .card-body {
  padding: 32px 50px 0 50px !important;
  width: 45% !important;
  display: table-cell;
  background-color: #ffffff;
  border-radius: 8px;
  
}
.submit {
  /* width: 100%;
  height: 36px; */
  padding: 10px 20px;
  border-radius: 7px;
  background-color: #162952;
  font-size: 14px;
  font-style: normal;
  text-align: center;
  color: #ffffff;
  border-style: none;
  cursor: pointer;
}
</style>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
      integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
      crossorigin="anonymous"
    ></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

<#elseif section = "form">
<div class="card card-3" style="background: url('${url.resourcesPath}/img/background.svg'); background-size: 90%">

<#--  <div class="card-heading" style="background: url('${url.resourcesPath}/img/banner.png'); background-size: 100% 100%">
</div>  -->
 
<div class="card-body">
<div id="back-wrap">
          <a id="back" href="${url.loginUrl}">< Back</a>
        </div>
 <div>
 <br/>

 <br/>
   
          <div id="right-login">
            <p id="wel-txt">Enter OTP</p>
            <p id="wel-line"></p>
            <p id="wel-sub-txt">
              4 digits OTP has been sent to your Email / Mobile
            </p>
          </div>

<form id="kc-form-login" class="form form1" return true;" action="${url.loginAction}" method="post">
     
        <div id="form-group">
            <div id="input-field-wrap">
              <input
                type="password"
                id="text1"
                style="font-size: 64px; text-align: center"
                name="otp1"
                maxlength="1"
                class="form-control"
                data-toggle="password"
                onkeyup="move(event, '', 'text1', 'text2')"
              />
              <input
                type="password"
                id="text2"
                style="font-size: 64px; text-align: center"
                name="otp2"
                maxlength="1"
                class="form-control"
                data-toggle="password"
               onkeyup="move(event, 'text1', 'text2', 'text3')"
              />
              <input
                type="password"
                id="text3"
                style="font-size: 64px; text-align: center"
                name="otp3"
                maxlength="1"
                class="form-control"
                data-toggle="password"
               onkeyup="move(event, 'text2', 'text3', 'text4')"
              />
              <input
                type="password"
                id="text4"
                style="font-size: 64px; text-align: center"
                name="otp4"
                maxlength="1"
                class="form-control"
                data-toggle="password"
               onkeyup="move(event, 'text3', 'text4', '')"
              />
            </div>
          </div>
    <input type="text" id="code" name="code" hidden/>
   <div style="text-align:center; margin-top: 15px">
   <div id="right-login">
            <button class="signup" id="btn">Verify OTP</button>
          </div>
        </div>     
        
</form>
 <div style="margin-top:50px;text-align:center">
          <#--  <div id="bottom-wrap">
            <p id="already-text">Already have an account? <a href="#">Sign in here</a></p>
<br/>
            <p id="cpy-text">&copy;2021 Hiringhood, All Rights Reserved</p>
         
          </div>  -->
        </div>
        <script>
            document.getElementById("btn").disabled = true;
            function move(e, p, c, n) {
               if(Number.isNaN(Number(e.target.value))) {
                  e.target.value = ''
                  return false;
               };
               const length = document.getElementById(c).value.length;
               const maxlength = document.getElementById(c).getAttribute('maxlength');
               if(length == maxlength) {
                  if(n !== '') document.getElementById(n).focus();
               }
               if(e.key === 'Backspace') {
                  if(p !== '') document.getElementById(p).focus();
               }
               if(document.getElementById('code').value.length < 4) {
                  var sum = document.getElementById('text1').value + document.getElementById('text2').value +
                  document.getElementById('text3').value + document.getElementById('text4').value;
                  document.getElementById('code').value = sum;
                  console.log( document.getElementById('code').value);

               }
               if(document.getElementById('code').value.length === 4) {
                  document.getElementById("btn").disabled = false;
                  document.getElementById("btn").style.background='#4D6CD9';
                  document.getElementById("btn").style.color='#ffffff';
               }
            }

        </script>
</#if>
</@layout.registrationLayout>