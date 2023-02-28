document.addEventListener("DOMContentLoaded", function () {
    const localization = new Localization();
    localization.init();
});

class Localization {
    defaultLang = 'en';
    locale = document.getElementById('locale')?.innerText?.trim();

    init() {
        this.setLocalization();

        document.querySelector('#switch_lang').addEventListener('click', (event) => {
            if(this.locale === 'en') {
                document.getElementById('locale').innerText = 'rs';
                document.getElementById('lang').innerText = 'English';
            } else {
                document.getElementById('locale').innerText = 'en';
                document.getElementById('lang').innerText = 'Serbian';
            }
            this.setLocalization();
        });
    }

    setLocalization() {
        const TRANSLATIONS = {
            en: {
                "card-number-title": "Card number",
                "card-number-error": "Invalid card number",
                "card-expiry-title": "MM/YY",
                "card-expiry-error": "Check the validity of the card",
                "proceed-btn": "Proceed",
                "thank-btn": "Thanks",
                "repeat-btn": "Repeat",
                "close-btn": "Close",
                "success-text": "",
                "success-has-token": "",
                "failure-text": "Contact the bank that issued the card to find out the reason.",
                "disable-retry": "There appears to be an error in the card details.",
                "failure-exist": "",
                "failure-has-token": "We can't send this payment for some reason. Try refreshing the page or let's try again a little later.",
                
                "hvalatips-title1": "Enter your card details",
                "hvalatips-title2": "Payment details",
                "hvalatips-iznos": "Amount",
                "hvalatips-title3": "Card number",
                "hvalatips-title4": "Expiry date",
                "hvalatips-title5": "*The service does not have access to your card data, all operations are carried out on the side of the bank",
                "hvalatips-title6": "Return to ",
                "hvalatips-title7": "Merchant Site ",
                "hvalatips-title8": "(without completing payment)",
                "hvalatips-btn1": "Continue",
                "hvalatips-title9": "Note: ",
                "hvalatips-title10": "In the next step, payment verification may be requested through the card issuing bank."
            },
            rs: {
                "card-number-title": "Broj cartice",
                "card-number-error": "Proverite validnost kartice",
                "card-expiry-title": "MM/GG",
                "card-expiry-error": "Proverite validnost kartice",
                "proceed-btn": "Nastavi",
                "thank-btn": "Hvala",
                "repeat-btn": "Ponavljanje",
                "close-btn": "Blizu",
                "success-text": "",
                "success-has-token": "",
                "failure-text": "Obratite se banci koja je izdala karticu da biste saznali razlog.",
                "disable-retry": "Izgleda da postoji greška u detaljima kartice.",
                "failure-exist": "",
                "failure-has-token": "Ne možemo da pošaljemo ovu uplatu iz nekog razloga. Pokušajte da osvežite stranicu ili hajde da pokušamo ponovo malo kasnije.",
                
                "hvalatips-title1": "Unesite informacije o kartici",
                "hvalatips-title2": "Detalji placanja",
                "hvalatips-iznos": "Iznos",
                "hvalatips-title3": "Broj cartice",
                "hvalatips-title4": "Datum isteka",
                "hvalatips-title5": "*Usluga nema pristup podacima o vašoj kartici, sve operacije se obavljaju na strani banke",
                "hvalatips-title6": "Vratite se do ",
                "hvalatips-title7": "Sajt trgovca ",
                "hvalatips-title8": "(bez kompletiranja placanja)",
                "hvalatips-btn1": "Nastaviti",
                "hvalatips-title9": "Napomena: ",
                "hvalatips-title10": "U sledecem koraku moze biti zahtevana verifikacija placanja preko Banke izdavaoca kartice."
            }
        };

        

        // if(!TRANSLATIONS[locale] || locale === defaultLang) {
        //     return;
        // }
        this.locale = document.getElementById('locale')?.innerText?.trim();

        if(!TRANSLATIONS[this.locale]) { this.locale = this.defaultLang; }

        document.querySelectorAll("[data-i18n-key]")
            .forEach((element) => {
                const key = element.getAttribute("data-i18n-key");
                const translation = TRANSLATIONS[this.locale][key];
                element.innerText = translation;
            });

        
    }
}
