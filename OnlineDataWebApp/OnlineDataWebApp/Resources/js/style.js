$(document).ready(function () {
    var list = ".left-bottom ul li a";
    $(list).click(function () {
        $(list).removeClass('pag-active');
        $(this).addClass('pag-active');
    });
    var i = "td .fa-chevron-down";
    $(i).click(function () {
        $(this).toggleClass('rotate');
    })
    var faq = ".faq-question-div i";
    $(faq).click(function () {
        $(this).toggleClass('rotate');
    });
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    });

    //
    const hash = window.location.pathname;
    $('.menu-nav a').closest('li').removeClass('active');
    $('a[href="' + hash + '"]').closest('li').addClass('active');
    $('.menu-nav a').on('click', function () {
        const hash = window.location.hash;
        $('.menu-nav a').closest('li').removeClass('active');
        $('a[href="' + hash + '"]').closest('li').addClass('active');
    });
    //radio button effect
    if ($('#ContentPlaceHolder1_inputFemale').attr('checked') === 'checked') {
        $('.radio-gender').removeClass('active');
        $('#ContentPlaceHolder1_inputFemale').parent().addClass('active');
        $('.radio-gender input').removeAttr('checked');
        $('#ContentPlaceHolder1_inputFemale').attr('checked', 'checked');
    }
    if ($('#ContentPlaceHolder1_inputMale').prop('checked')) {
        $('.radio-gender').removeClass('active');
        $('#ContentPlaceHolder1_inputMale').parent().addClass('active');
        $('.radio-gender input').removeAttr('checked');
        $('#ContentPlaceHolder1_inputMale').attr('checked', 'checked');
    }
    $('.radio-gender input').on('click', function () {
        $('.radio-gender').removeClass('active');
        $(this).parent().addClass('active');
        $('.radio-gender input').removeAttr('checked');
        $(this).attr('checked', 'checked');
    });

    //
    $('#a').on('change', function () {
        $('.range1').val($(this).val());
    });
    $('#b').on('change', function () {
        $('.range2').val($(this).val());
    });
});
function pageLoad() {
    if ($('#ContentPlaceHolder1_inputFemale').attr('checked') === 'checked') {
        $('.radio-gender').removeClass('active');
        $('#ContentPlaceHolder1_inputFemale').parent().addClass('active');
        $('#ContentPlaceHolder1_inputFemale').attr('checked', 'checked');
    }
    if ($('#ContentPlaceHolder1_inputMale').attr('checked') === 'checked') {
        $('.radio-gender').removeClass('active');
        $('#ContentPlaceHolder1_inputMale').parent().addClass('active');
        $('.radio-gender input').removeAttr('checked');
        $('#ContentPlaceHolder1_inputMale').attr('checked', 'checked');
    }
    $('.radio-gender input').on('click', function () {
        $('.radio-gender').removeClass('active');
        $(this).parent().addClass('active');
        $(this).attr('checked', 'checked');
    });
    //
    $('#a').on('change', function () {
        $('.range1').val($(this).val());
    });
    $('#b').on('change', function () {
        $('.range2').val($(this).val());
    });
}

//Menu hamburger animation start
const menuBtn = document.querySelector('.menu-btn');
const hamburger = document.querySelector(".menu-btn_burger");
const nav = document.querySelector(".header-right");
const menunav = document.querySelector(".menu-nav");
let showMenu = false;
menuBtn.addEventListener('click', toggleMenu);

function toggleMenu() {
    if (!showMenu) {
        hamburger.classList.add('open');
        nav.classList.add('opennav');
        menunav.classList.add('openmenu');
        showMenu = true;
    } else {
        hamburger.classList.remove('open');
        nav.classList.remove('opennav');
        menunav.classList.remove('openmenu');
        showMenu = false;
    }
}


//end
//typing animation start
var TxtType = function (el, toRotate, period) {
    this.toRotate = toRotate;
    this.el = el;
    this.loopNum = 0;
    this.period = parseInt(period, 10) || 2000;
    this.txt = '';
    this.tick();
    this.isDeleting = false;
};

TxtType.prototype.tick = function () {
    var i = this.loopNum % this.toRotate.length;
    var fullTxt = this.toRotate[i];

    if (this.isDeleting) {
        this.txt = fullTxt.substring(0, this.txt.length - 1);
    } else {
        this.txt = fullTxt.substring(0, this.txt.length + 1);
    }

    this.el.innerHTML = '<span class="wrap">' + this.txt + '</span>';

    var that = this;
    var delta = 200 - Math.random() * 100;

    if (this.isDeleting) { delta /= 2; }

    if (!this.isDeleting && this.txt === fullTxt) {
        delta = this.period;
        this.isDeleting = true;
    } else if (this.isDeleting && this.txt === '') {
        this.isDeleting = false;
        this.loopNum++;
        delta = 500;
    }

    setTimeout(function () {
        that.tick();
    }, delta);
};

window.onload = function () {
    var elements = document.getElementsByClassName('typewrite');
    for (var i = 0; i < elements.length; i++) {
        var toRotate = elements[i].getAttribute('data-type');
        var period = elements[i].getAttribute('data-period');
        if (toRotate) {
            new TxtType(elements[i], JSON.parse(toRotate), period);
        }
    }
    // INJECT CSS
    var css = document.createElement("style");
    css.type = "text/css";
    css.innerHTML = ".typewrite > .wrap { border-right: 0.08em solid #fff}";
    document.body.appendChild(css);
};
//end