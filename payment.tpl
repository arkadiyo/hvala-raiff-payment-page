<!DOCTYPE html>
<html lang="${lang}">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Hvala Tips </title>

    <link rel="apple-touch-icon" sizes="57x57" href="img/${payment.templateName}/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="img/${payment.templateName}/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="img/${payment.templateName}/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="img/${payment.templateName}/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="img/${payment.templateName}/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="img/${payment.templateName}/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="img/${payment.templateName}/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="img/${payment.templateName}/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="img/${payment.templateName}/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="img/${payment.templateName}/android-icon-192x192.png">
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

</head>

<body>
    <div class="tips">
        <div class="container tips__container" style="width: 690px;padding: 0 10px;">
            <div class="header__logo tips__logo">
                <a href="/">
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
                   <a href="" id="goo_pay"></a>
                   <a href="" id="app_pay"></a>
                </div>
            </div>

            <div class="form-block">
                <form class="form card" name="cardForm" id="cardForm" action="./pay" method="post" style="margin-bottom: 40px;">
                    <input type="hidden" name="action" value="process" />
                    <input type="hidden" id="GenerateToken" name="GenerateToken" value="on">

                    <div style="margin-top: 28px;" >
                        <p data-i18n-key="hvalatips-iznos">Iznos</p>
                        <input type="text" class='gray-input' id='TotalAmount' name="TotalAmount" disabled />
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
                        <div style="
                            width: inherit;
                            display: flex;
                            align-items: center; 
                            margin-top: 28px;
                            margin-right: 15px;                           
                            " >
                            <p style="margin-right: 20px;" data-i18n-key="hvalatips-title4">Datum isteka</p>
                            <input  name="ExpMonth" type="text" class='white-input data card-expiry' id='mouth' maxlength="2" data-id="0" placeholder='MM' />
                            <p style="font-size: 30px;margin: 0 10px;" class="separator">/</p>
                            <input name="viewExpYear" type="text" class='white-input data card-expiry' id='year' maxlength="2"  data-id="0" placeholder='YY'  />
                            <input hidden name="ExpYear"/>
                            
                        </div>
                        

                        <!-- <div> -->
                            <div style="display: flex;align-items: center;margin-top: 28px;" class="input-wrapper">
                                <div class="input_cvv">
                                    <p>CVV2</p>
                                    <p style="color: #5E5E5E;">Security code</p>
                                </div>
                                <input name="Cvc" type="password" class='white-input cvv card-cvc' id='cvv' data-id="0" placeholder='***' maxlength="3" />
                            </div>
                            
                        <!-- </div> -->
                        
                        
                    </div>

                    <div class="input-wrapper errors-block">
                        <div class="small-text error error-date" data-i18n-key="card-expiry-error">Expiry error</div>
                        <div class="small-text error error-cvv">CVV error</div>
                    </div>

                    

                    <p style="margin-top: 21px;" data-i18n-key="hvalatips-title5">*Usluga nema pristup podacima o vašoj kartici, sve operacije se obavljaju na strani banke</p>
                    <div style="
                        margin-top: 21px;
                        font-family: 'Proxima Nova';
                        font-size: 18px;
                        font-weight: 400;
                        color: #393C49;">
                        <span data-i18n-key="hvalatips-title6">Vratite se do </span><a href="https://hvala.tips" style="color: #02964C;" data-i18n-key="hvalatips-title7">Sajt trgovca </a><span data-i18n-key="hvalatips-title8">(bez kompletiranja placanja)</span>
                    </div>
                    <button type="submit" class="btn proceed-btn" id="btn_pay" data-i18n-key="hvalatips-btn1" disabled data-i18n-key="proceed-btn">Nastaviti</button>
                    <span class="under_info"><span style="color: #EA7C69;" data-i18n-key="hvalatips-title9">Napomena: </span><span data-i18n-key="hvalatips-title10">U sledecem koraku moze biti zahtevana verifikacija placanja preko Banke izdavaoca kartice.</span>
                </form>
                <div hidden class="params">
                    <div id="description">
                        ${payment.description}
                    </div>
                    <div id="locale">
                        ${locale}
                    </div>
                </div>
            </div>            
        </div>
    </div>
    
<script nonce=${nonce}>
    // const cardData = `${upcTokenData}` ? JSON.parse(`${upcTokenData}`) : {};

    // TODO: remove after testing
    const cardData = {
        token: '573288C6D3214E193E613051EA57462D',
        pan: '499999******0011',
        month: '12',
        year: '2022',
    };
    console.log(cardData, 'cardData');
</script>
<script src="js/${payment.templateName}/localization.js"></script>
<script src="js/${payment.templateName}/main.js"></script>

</body>
</html>