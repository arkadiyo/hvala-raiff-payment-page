(function () {
    window.addEventListener("load", function () {
        

        let curentWidth = window.innerWidth;
        // console.log(curentWidth);
        if(curentWidth <= 505) {
            document.querySelector('.mc').setAttribute('style', 'display:none');
            document.querySelector('.visa').setAttribute('style', 'display:none');
            document.querySelector('.dina').setAttribute('style', 'display:none');
            document.querySelector('.mc_mob').setAttribute('style', 'display:block');
            document.querySelector('.visa_mob').setAttribute('style', 'display:block');
            document.querySelector('.dina_mob').setAttribute('style', 'display:block');
        } else {
            document.querySelector('.mc').setAttribute('style', 'display:block');
            document.querySelector('.visa').setAttribute('style', 'display:block');
            document.querySelector('.dina').setAttribute('style', 'display:block');
            document.querySelector('.mc_mob').setAttribute('style', 'display:none');
            document.querySelector('.visa_mob').setAttribute('style', 'display:none');
            document.querySelector('.dina_mob').setAttribute('style', 'display:none');
        }

        init();
    });

    function init() {
        onInputExpMonth();
        cardNumberMask();
        errorValidation();
        setExpYear();
        setCardNumber();
        submitFormWhenSkip();
        fillInputsWhenHasToken();
    }

    function onInputExpMonth() {
        const expMonth = document.querySelector('[name="ExpMonth"]');
        const separator = document.querySelector('.separator');
        const viewExpYear = document.querySelector('[name="viewExpYear"]');

        expMonth.addEventListener('input', (event) => {
            const target = event.target;
            setClassToSeparator(target, separator);
            autoTab(target, viewExpYear);
        });

        viewExpYear.addEventListener('input', (event) => {
            const target = event.target;
            autoTab(target, expMonth, true);
        });
    }

    function setClassToSeparator(target, separator) {
        const maxlength = 2;
        if(target?.value?.length === maxlength) {
            separator?.classList.add('active');
        } else {
            separator?.classList.remove('active');
        }
    }

    function cardNumberMask() {
        const cardNumber = document.querySelector('[name="viewCardNumber"]');
        cardNumber.addEventListener('input', (event) => {
            let val = event.target.value;
            let newVal = '';

            val = val.replace(/\s/g, '');

            for(let i = 0; i < val.length; i++) {
                if(i % 4 == 0 && i > 0) {
                    newVal = newVal.concat(' ');
                };
                newVal = newVal.concat(val[i]);
            }

            event.target.value = newVal;
        });
    }

    function errorValidation() {
        const btn = document.querySelector('.proceed-btn');
        btn.setAttribute('disabled', 'true');
        const descriptionCardsNumber = getDescriptionCardsNumber();

        document.querySelectorAll('.card input')
            .forEach(input => {
                input.addEventListener('input', (event) => {
                    replaceOnlyNumbers(event.target);

                    if(event.target.classList.contains('card-number')) {
                        cardNumberValidation(event.target);
                        isExistCardNumberValidation(event.target, descriptionCardsNumber);
                    }

                    if(event.target.classList.contains('card-expiry')) {
                        dateValidation(event.target);
                    }

                    if(event.target.classList.contains('card-cvc')) {
                        cvcValidation(event.target);
                    }
                })
            });

        const cardNumber = document.querySelector('.card-number');
        cardNumber.addEventListener('blur', (event) => {
            cardNumberValidation(event.target);
            isExistCardNumberValidation(event.target, descriptionCardsNumber);
        });
    }

    function dateValidation(target) {
        const parentEl = document.querySelector(".expiry");
        const errorEl = document.querySelector('.error-date');
        const expMonth = parentEl.querySelector('[name="ExpMonth"]');
        const expYear = parentEl.querySelector('[name="viewExpYear"]');

        if(expMonth.value == false || +expMonth.value > 12 || expYear.value === '') {
            setError(errorEl);
            return;
        }

        const today = new Date();
        const date = new Date();
        date.setFullYear(+`20${expYear.value}`, +expMonth.value - 1, 1);

        if(today > date) {
            setError(errorEl);
        } else {
            removeError(errorEl);
        }
    }

    function replaceOnlyNumbers(target) {
        const errorEl = target?.closest(".input-wrapper")?.querySelector('.error');

        if(target.value === '') {
            setError(errorEl);
            return;
        }

        target.value = target.value.replace(/[^0-9\s]/g, '');
    }

    function cvcValidation(target) {
        const cvcRegexp = /^[0-9]{3}$/;
        const errorEl = document.querySelector(".errors-block")?.querySelector('.error-cvv');

        if(target.value === '') {
            setError(errorEl);
            return;
        }

        if(!cvcRegexp.test(target.value)) {
            setError(errorEl);
        } else {
            removeError(errorEl);
        }
    }

    function cardNumberValidation(target) {
        const CARD_NUMBER_LENGTH = 19;
        const errorEl = target?.closest(".input-wrapper")?.querySelector('.error');

        // if(luhnAlgorithm(target.value)
        //     && target.value?.length === CARD_NUMBER_LENGTH
        // ) {
        if(target.value?.length === CARD_NUMBER_LENGTH) {
            removeError(errorEl);
            document.getElementById('disabled').style.display = 'none';
            document.getElementById('active').style.display = 'block';
        } else {
            setError(errorEl);
            document.getElementById('disabled').style.display = 'block';
            document.getElementById('active').style.display = 'none';
        }
    }

    function luhnAlgorithm(value) {
        value = value.replace(/\D/g, '');

        // console.log(value);

        let nCheck = 0;
        let bEven = false;

        for (let n = value.length - 1; n >= 0; n--) {
            let nDigit = parseInt(value.charAt(n), 10);

            if (bEven && (nDigit *= 2) > 9) {
                nDigit -= 9;
            }

            nCheck += nDigit;
            bEven = !bEven;
        }

        return (nCheck % 10) == 0;
    }

    function setError(errorEl) {
        const btn = document?.querySelector('.proceed-btn');
        errorEl?.classList.add('active');

        if(notValidForm()) {
            btn.setAttribute('disabled', 'true');
        }
    }

    function removeError(errorEl) {
        const btn = document?.querySelector('.proceed-btn');
        errorEl?.classList.remove('active');

        if(!notValidForm()) {
            btn.removeAttribute('disabled');
        }
    }

    function notValidForm() {
        const errorEl = document.querySelectorAll('.error.active');
        const inputs = document.querySelectorAll('.card-number, .card-expiry, .card-cvc');
        const isEmpty = [...inputs].some(input => !input.value);
        return !!errorEl.length || isEmpty;
    }

    function setExpYear() {
        const expYear = document.querySelector('[name="ExpYear"]');
        const viewExpYear = document.querySelector('[name="viewExpYear"]');

        viewExpYear.addEventListener('input', (event) => {
            expYear.value = `20${event.target.value}`;
        });
    }

    function setCardNumber() {
        const cardNumber = document.querySelector('[name="CardNumber"]');
        const viewCardNumber = document.querySelector('[name="viewCardNumber"]');

        viewCardNumber.addEventListener('input', (event) => {
            cardNumber.value = event.target.value?.replace(/\D/g, '');
        });
    }

    function autoTab(current, to, back) {
        if (back && current.value.length === 0) {
            to.focus();
            return;
        }

        if (!back && current.getAttribute && String(current.value.length) === current.getAttribute("maxlength")) {
            to.focus();
        }
    }

    function parseDescription() {
        const DEFAULT_DESCRIPTION = {
            cards: [''],
            skipForm: false,
        };
        const description = document.getElementById('description')?.innerText;

        return description.trim()?.split(';').reduce((acc, curr) => {
            const item = curr.split(':');
            acc[item[0]] = /[$[\]]/.test(item[1]) ? item[1]?.replace(/"|'|\[|]/g, '').split(',') : item[1]?.replace(/"|'|\[|]/g, '');

            return acc;
        }, DEFAULT_DESCRIPTION);
    }

    function getDescriptionCardsNumber() {
        const description = parseDescription() || {cards: ['']};
        return description.cards?.map(item => item.replace(/[^0-9.]/g, '')) || [];
    }

    function isExistCardNumberValidation(target, descriptionCardsNumber) {
        const CARD_NUMBER_LENGTH = 19;
        const firstSix = 6;
        const lastFour = -4;
        const errorEl = document.querySelector('[data-i18n-key="failure-exist"]');
        const hiddenErrorEl = document.querySelector('[data-i18n-key="card-number-error"]');

        const onlyNumbers = target.value.replace(/[^0-9.]/g, '');
        const start = onlyNumbers.slice(0, firstSix);
        const end = onlyNumbers.slice(lastFour);
        const slicedNumber = start.concat(end);
        const isExist = descriptionCardsNumber?.some(item => item === slicedNumber);

        if(target.value?.length === CARD_NUMBER_LENGTH && isExist) {
            hiddenErrorEl.style.display = 'none';
            setError(errorEl);
        } else {
            hiddenErrorEl.style.display = 'block';
            removeError(errorEl);
        }
    }

    function isSubmitFormOnLoad() {
        const description = parseDescription();
        return JSON.parse(description.skipForm);
    }

    function submitFormWhenSkip() {
        if(isSubmitFormOnLoad()) {
            const form = document.querySelector('.form');
            const shadowWrapper = document.querySelector('.shadow-wrapper');
            shadowWrapper.classList.add('active')
            form.submit();
        }
    }

    function fillInputsWhenHasToken() {
        if(!cardData?.token) {
            return;
        }

        const cardNumber = document.querySelector('[name="CardNumber"]');
        const viewCardNumber = document.querySelector('[name="viewCardNumber"]');
        const expMonth = document.querySelector('[name="ExpMonth"]');
        const viewExpYear = document.querySelector('[name="viewExpYear"]');
        const expYear = document.querySelector('[name="ExpYear"]');

        cardNumber.value = cardData.token;
        viewCardNumber.value = cardData.pan;
        expMonth.value = cardData.month;
        viewExpYear.value = cardData.year.slice(2);
        expYear.value = cardData.year;

        viewCardNumber.classList.add('half-hidden');
        expMonth.classList.add('half-hidden');
        viewExpYear.classList.add('half-hidden');
    }
})();
