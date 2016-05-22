$(function() {
    var primary;
    $("#mycircuit").on('change', function(){
        $( "#mycircuit option:selected" ).each(function(data) {
            primary = encodeURIComponent($( this ).val());
            $('.result_section').hide();
            if(primary == ""){
                $('#trips').attr('disabled', 'disabled');
            }
            $.get('additional_product_infos?select=' + encodeURIComponent($( this ).val()) + '&type=' + encodeURIComponent($('#mycircuit').attr('type')), function(text){
                console.log(text);
                if (primary == ""){
                    $('.result_section').hide();

                }else{

                }

            });
            //window.location.href = 'additional_product_infos?trips=' + $( this ).text();
        });
    });

    $('body').on('change', '#trips',  function(){
        $( "#trips option:selected" ).each(function(data) {
            if ($( this ).val() == ""){
                $('.result_section').hide();
            }
            $.get('additional_product_infos?secondary=' + encodeURIComponent($( this ).val()) + '&type=' + encodeURIComponent($('#mycircuit').attr('type')) + '&select=' + primary , function(text){
                console.log(text);
            });
        });

    });

    $('body').on('click',".result_link", function(){
        $(".products").children(".a_product").each(function(){

            $(this).removeClass('active');
        });
        $(this).parent().addClass('active');

    });

    $('body').on('click', '.external_link', function(){
       ga('send','event', $(this).attr('title'), 'click'+ $(this).attr('link_type'))
    })

    $('body').on('click', '#pmodal', function(){
        $('.modal').modal('hide');
        $(".products").children().each(function(){
            $(this).removeClass('active');
        });
        ga('send', 'event', $(this).attr('title') , 'click-'+ $(this).attr('link_type') );
        window.open($(this).attr('url'));
    });
})