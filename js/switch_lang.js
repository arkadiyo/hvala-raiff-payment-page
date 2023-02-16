$('body').i18n();

if ($.i18n().locale == 'sr'){
    $('#lang').html('English');
} else {
    $('#lang').html('Serbian');
}

$('#switch_lang').click(function() {
    if ($.i18n().locale == 'en'){
        $.i18n().locale = 'sr';
        $('#lang').html('English');
    } else {
        $.i18n().locale = 'en';
        $('#lang').html('Serbian');
    }

    $('body').i18n();
});