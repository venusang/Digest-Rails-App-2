$(function() {
    $(".btn").click(function(){
        if($(this).find('.fa').hasClass('fa-minus')){
            $(this).find('.fa').removeClass('fa-minus');
            $(this).find('.fa').addClass('fa-plus');
        }else if ($(this).find('.fa').hasClass('fa-plus')){
            $(this).find('.fa').removeClass('fa-plus');
            $(this).find('.fa').addClass('fa-minus');
        }

    });
});