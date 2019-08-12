$(function(){
    $('.slick').slick({
    asNavFor:'.thumbnail',
    arrows: false,
    slidesToShow:1,
    infinite: false,
    adaptiveHeight: true,
    });
    $('.thumbnail').slick({
    asNavFor:'.slick',
    focusOnSelect: true,
    arrows: false,
    slidesToShow:5,
    });
})