let lang = window.navigator.language || navigator.userLanguage;
if (lang != 'sr' && lang != 'en'){
    lang = 'en';
}

$.i18n( {
    locale: lang
});

$.i18n().load({
    "sr": "js/sr.json",
    "en": "js/en.json"
}).done(function() {
    $('body').i18n();
});

