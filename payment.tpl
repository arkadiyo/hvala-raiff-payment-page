<!DOCTYPE html>
<#assign lang=locale!localeDefault>
<#setting number_format="0.00">
<html lang="${lang}">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hvala Tips</title>
    <link rel="apple-touch-icon" sizes="57x57" href="img/${payment.templateName}/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="img/${payment.templateName}/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="img/${payment.templateName}/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="img/${payment.templateName}/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="img/${payment.templateName}/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="img/${payment.templateName}/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="img/${payment.templateName}/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="img/${payment.templateName}/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="img/${payment.templateName}/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="img/${payment.templateName}/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="img/${payment.templateName}/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="img/${payment.templateName}/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="img/${payment.templateName}/favicon-16x16.png">
    <link rel="manifest" href="css/${payment.templateName}/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <link rel='stylesheet' href='css/${payment.templateName}/reset.css'>
    <link rel='stylesheet' href='css/${payment.templateName}/fonts.css'>
    <link rel='stylesheet' href='css/${payment.templateName}/main.css'>
    <link rel='stylesheet' href='css/${payment.templateName}/media.css'>
    <link rel='stylesheet' href='css/${payment.templateName}/app.css'>
    <style>
      .img_card {
        padding-left: 50px;
        background: url(img/${payment.templateName}/card.png) no-repeat 12px 19px;
        background-size: auto 30%;
        margin-right: 10px;
      }

      /* #googlePayButton {
        background: url(img/${payment.templateName}/GooPay.png)no-repeat 0px 0px;
        width: 150px;
        height: 82px;
        background-size: cover;
      }

      #googlePayButton:hover {
        background: url(img/${payment.templateName}/GooPay_act.png);
        background-size: cover;
      }

      #applePayButton {
        background: url(img/${payment.templateName}/AppPay.png);
        width: 150px;
        height: 82px;
        background-size: cover;
      }

      #applePayButton:hover {
        background: url(img/${payment.templateName}/AppPay_act.png);
        background-size: cover;
      } */

      @media only screen and (max-width: 540px) {
        .img_card {
          padding-left: 42px !important;
          background: url(img/${payment.templateName}/card.png) no-repeat 12px 15px !important;
        }

        .btn_g_a_pay {
            display: block;
        }
        .payments-block {
            margin-bottom: 20px;
        }
      }
    </style>
    <script nonce="${nonce}">
      const paymentData = {
        merchant: {
          id: "${payment.merchantId}",
          name: "${payment.merchantName}",
          url: "${payment.siteUrl}"
        },
        amount: "${payment.decimalAmount}",
        currencyCode: "${payment.currencyName}",
        countryCode: "${countryCode}"
      };
    </script>
    <#if allowApplePay>
      <style nonce="${nonce}">
         .applePay {
          display: none;
        } 

         .applePayButton {
          -webkit-appearance: -apple-pay-button;
          -apple-pay-button-type: buy;
          -apple-pay-button-style: black;
          --apple-pay-button-width: 250px;
          --apple-pay-button-height: 40px;
          --apple-pay-button-border-radius: 5px;
        }

       /* .googlePayButton {
          display: inline-block;
          width: 100%;
          padding: 50px;
          float: left;
        } */
      </style>
      <script type="text/javascript" src="jscript/lib/jquery-2.1.4.min.js"></script>
      <script src="jscript/lib/applePay.js" type="text/javascript"></script>
    </#if>
  </head>
  <body>
    <div class="tips">
      <div class="container tips__container" style="width: 690px;padding: 0 10px;">
        <div class="header__logo tips__logo">
          <a href="https://hvala.tips">
            <span>hvala.</span>
            <span>tips</span>
          </a>
          <div id="switch_lang" style="display: flex;align-items: center;cursor: pointer;">
            <img src="img/${payment.templateName}/globe.png" alt="icon" class="lang_logo">
            <p class="btn_header" id="lang">Serbian</p>
          </div>
          <img src="img/${payment.templateName}/raiffeisen_bank.png" class="logo_bank" alt="img-raiffeisen_bank">
        </div>
        <div class="header-block">
          <div class="p-title" data-i18n-key="hvalatips-title1">Unesite informacije o kartici</div>
          <div class="btn_g_a_pay">
              <#if allowGooglePay>
                  <div class="payments-block">
                      <div class="gBlock" id="googlePayButton"></div>
                  </div>
              </#if>
      
              <#if allowApplePay>
                  <div class="payments-block">
                      <div class="applePay">
                          <div class="applePayButton" id="applePayButton"></div>
                      </div>
                  </div>
              </#if>
          </div>
        </div>
        <div class="form-block">
          <form class="form card" name="cardForm" id="cardForm" action="${actionUrl}" method="post" style="margin-bottom: 40px;">
            <input type="hidden" name="action" value="process" />
            <input type="hidden" id="GenerateToken" name="GenerateToken" value="on">
            <div style="margin-top: 28px;" >
              <p data-i18n-key="hvalatips-iznos">Iznos</p>
              <input type="text" class='gray-input' id='TotalAmount' name="TotalAmount" disabled value="${payment.decimalAmount}" />
            </div> 
            <div style="margin-top: 28px;" class="input-wrapper">
              <div style="display: flex;align-items: center;">
                <p style="margin-right: 11px;" data-i18n-key="hvalatips-title3" class="card-title" data-i18n-key="card-number-title">Broj cartice</p>
                <img src="img/${payment.templateName}/mc.png" alt="" class="mc_mob">
                <img src="img/${payment.templateName}/visa.png" alt="" class="visa_mob">
                <img src="img/${payment.templateName}/dinacard.png" alt="" class="dina_mob">
              </div>
              <div style="display: flex;align-items: center;">
                <input name="viewCardNumber" type="text" class='white-input img_card card-number' id='broj_cartice' data-id="0" placeholder='0000 0000 0000 0000' maxlength="19">
                <input hidden name="CardNumber"/>
                <img src="img/${payment.templateName}/disabled.png" alt="" id="disabled" class="check">
                <img src="img/${payment.templateName}/active.png" alt="" id="active" class="check" style="display: none;">
                <img src="img/${payment.templateName}/mc.png" alt="" class="mc">
                <img src="img/${payment.templateName}/visa.png" alt="" class="visa">
                <img src="img/${payment.templateName}/dinacard.png" alt="" class="dina">
              </div>
              <div class="small-text error" data-i18n-key="card-number-error">Invalid card number</div>
              <div class="small-text error" data-i18n-key="failure-exist">You've already added This card. Try adding another one</div>
            </div>
            <div style="display: flex;flex-wrap: wrap;justify-content: space-between;" class="input-wrapper expiry">
              <div>
                <div style="
                                width: inherit;
                                display: flex;
                                align-items: center; 
                                margin-top: 28px;
                                margin-right: 15px;                           
                                ">
                  <p style="margin-right: 30px;" data-i18n-key="hvalatips-title4">Datum isteka</p>
                  <input name="ExpMonth" type="text" class='white-input data card-expiry' id='mouth' maxlength="2" data-id="0" placeholder='MM' />
                  <p style="font-size: 30px;margin: 0 10px;" class="separator">/</p>
                  <input name="viewExpYear" type="text" class='white-input data card-expiry' id='year' maxlength="2" data-id="0" placeholder='YY' />
                  <input hidden name="ExpYear" />
                </div>
                <div class="input-wrapper">
                  <div class="small-text error" style="margin-bottom: 5px;" data-i18n-key="card-expiry-error">Expiry error</div>
                </div>
              </div>
              <!-- <div> -->
              <div style="
                                align-self: center;
                                margin-top: 28px;
                            ">
                <div style="display: flex;align-items: center;" class="input-wrapper">
                  <div class="input_cvv">
                    <p>CVV2</p>
                    <p style="color: #5E5E5E;">Security code</p>
                  </div>
                  <input name="Cvc" type="password" class='white-input cvv card-cvc' id='cvv' data-id="0" placeholder='***' maxlength="3" />
                </div>
                <div class="input-wrapper">
                  <div class="small-text error error-cvv">CVV error</div>
                </div>
              </div>
              <!-- </div> -->
            </div>
            <p style="margin-top: 21px;" data-i18n-key="hvalatips-title5">*Usluga nema pristup podacima o vašoj kartici, sve operacije se obavljaju na strani banke</p>
            <div style="
                        margin-top: 21px;
                        font-family: 'Proxima Nova';
                        font-size: 18px;
                        font-weight: 400;
                        color: #393C49;">
              <span data-i18n-key="hvalatips-title6">Vratite se do </span>
              <a href="https://hvala.tips" style="color: #02964C;" data-i18n-key="hvalatips-title7">Sajt trgovca </a>
              <span data-i18n-key="hvalatips-title8">(bez kompletiranja placanja)</span>
            </div>
            <button type="submit" class="btn proceed-btn" id="btn_pay" data-i18n-key="hvalatips-btn1" disabled data-i18n-key="proceed-btn">Nastaviti</button>
            <span class="under_info">
              <span style="color: #EA7C69;" data-i18n-key="hvalatips-title9">Napomena: </span>
              <span data-i18n-key="hvalatips-title10">U sledecem koraku moze biti zahtevana verifikacija placanja preko Banke izdavaoca kartice.</span>
          </form>
          <div hidden class="params">
            <div id="description"> ${payment.description} </div>
            <div id="locale"> ${locale} </div>
          </div>
        </div>
      </div>
    </div>
    <script nonce=${nonce}>
      const cardData = `${upcTokenData}` ? JSON.parse(`${upcTokenData}`) : {};
    </script>
    <#if allowApplePay>
      <script nonce="${nonce}">
        const merchId = "${applePayIdentifier}",
          paymentForm = "cardForm";
        var idSubmitOfPaymentForm = "btn_pay";
        if (typeof window.ApplePaySession == 'function') {
          var paymentRequest = {
            currencyCode: "${currency}",
            countryCode: "${countryCode}",
            lineItems: [{
              label: "${payment.merchantName}",
              amount: "${payment.decimalAmount}"
            }],
            total: {
              label: "${payment.merchantName}",
              amount: "${payment.decimalAmount}"
            },
            supportedNetworks: ['masterCard', 'visa'],
            merchantCapabilities: ['supports3DS', 'supportsCredit', 'supportsDebit']
          };
          const applePay = new UPCApplePay(merchId, paymentRequest);
        } else {
          console.log("ApplePay is not supported");
        }
        $("#btn_pay").click(function() {
          return true;
        });
      </script>
    </#if>
    <#if allowGooglePay>
      <script nonce="${nonce}">
        let idSubmitOfPaymentForm1 = "btn_pay";
        paymentData.google = {
          gateway: '${googlePayGatewayId}',
          profile: '${googlePayEnvironment}',
          allowedCards: ['VISA', 'MASTERCARD'],
          domData: {
            googleContainer: "googlePayButton",
            paymentForm: "cardForm",
            paymentButton: idSubmitOfPaymentForm1
          },
          button: {
            color: 'black',
            type: 'long'
          }
        };
        $("#btn_pay").click(function() {
          return true;
        });
      </script>
      <script type="text/javascript" src="jscript/googlePay.js?v=${app_version}"></script>
      <script type="text/javascript" src="jscript/lib/gPay.js?v=${app_version}"></script>
      <script nonce="${nonce}">
        $(document).ready(function() {
          onGooglePayLoaded();
        });
      </script>
    </#if>
    <script src="js/${payment.templateName}/localization.js"></script>
    <script src="js/${payment.templateName}/main.js"></script>
  </body>
</html>