let curentWidth = window.innerWidth;
if(curentWidth<=505){
    $('.mc').attr('style', 'display:none');
    $('.visa').attr('style', 'display:none');
    $('.dina').attr('style', 'display:none');
    $('.mc_mob').attr('style', 'display:block');
    $('.visa_mob').attr('style', 'display:block');
    $('.dina_mob').attr('style', 'display:block');
} else {
    $('.mc').attr('style', 'display:block');
    $('.visa').attr('style', 'display:block');
    $('.dina').attr('style', 'display:block');
    $('.mc_mob').attr('style', 'display:none');
    $('.visa_mob').attr('style', 'display:none');
    $('.dina_mob').attr('style', 'display:none');
}

//маска для номера счета
$('body').on('input', '#broj_cartice', function(){
	this.value = this.value.replace(/[^0-9]/g, '');
  const mask = new IMask(this, {
    mask: "0000 0000 0000 0000",
  });
  
  //проверка заполнения поля
  if (this.value.length == 19){
    $('#disabled').attr('style', 'display: none;');
    $('#active').attr('style', 'display: block;');
    $(this).attr('data-id','1');
  } else {
    $('#disabled').attr('style', 'display: block;');
    $('#active').attr('style', 'display: none;');
    $(this).attr('data-id','0');
  }
  accessPay();
});

//маска для месяца
$('body').on('input', '#mouth', function(){
	this.value = this.value.replace(/[^0-9]/g, '');
  const mask = new IMask(this, {
    mask: "00",
  });

  $(this).attr('value', this.value);

  //проверка заполнения поля
  if (this.value.length == 2){
    $(this).attr('data-id','1');
  } else {
    $(this).attr('data-id','0');
  }
  accessPay();
});

//маска для года
$('body').on('input', '#year', function(){
	this.value = this.value.replace(/[^0-9]/g, '');
  const mask = new IMask(this, {
    mask: "00",
  });

  $(this).attr('value', this.value);

  //проверка заполнения поля
  if (this.value.length == 2){
    $(this).attr('data-id','1');
  } else {
    $(this).attr('data-id','0');
  }
  accessPay();
});

//проверка для кнопки оплаты
function accessPay(){
    let card = $('#broj_cartice').attr('data-id');
    let mouth = $('#mouth').attr('data-id');
    let mouthValue = $('#mouth').attr('value');
    let year = $('#year').attr('data-id');
    let yearValue = '20' + $('#year').attr('value');
    //let cvv = $('#cvv').attr('data-id');
    let dataFlag = checkData(mouthValue, yearValue);

    if (card==1 && mouth==1 && year==1 && dataFlag==1){
        $('#btn_pay').addClass('green-btn');
        $('#btn_pay').prop('disabled', false);
    } else {
        $('#btn_pay').removeClass('green-btn');
        $('#btn_pay').prop('disabled', true);
    }
}

//проверка даты
function checkData(mouth, year){
    let curentDate = new Date();
    let curentMouth = curentDate.getMonth() + 1;
    let curentYear = curentDate.getFullYear();
    let flag = 0;
    if (year == curentYear){
        if (mouth >= curentMouth && mouth.length==2 && mouth <= 12){
            flag = 1;
        }
    } else if (year > curentYear && mouth.length==2 && mouth > 0 && mouth <= 12){
        flag = 1;
    }
    if (flag==0 && mouth>=0 && year>=0){
        $('#mouth').attr('style', 'border: 1px solid red;');
        $('#year').attr('style', 'border: 1px solid red;');
    } else {
        $('#mouth').attr('style', 'border: 1px solid;');
        $('#year').attr('style', 'border: 1px solid;');
    }
    return flag;
}