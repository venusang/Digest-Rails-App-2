// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
    supplementalCollapse.init();  
    awesomeGridSupplemental.init();
});

var supplementalCollapse = {
    init:function(){
        
        $('.panel-supplement').on('show.bs.collapse', function () {
           // console.debug('1: show.bs.collapse');

        });

        $('.panel-supplement').on('shown.bs.collapse', function () {
            // console.debug('2: shown.bs.collapse');
            awesomeGridSupplemental.init();
            $(this).toggleClass('opened-'+this.id);
            $(this).toggleClass('opened');
            // $(this).children().find('.book-intro').hide();
            // $(this).children().find('.book-files').show();
        });
        
        $('.panel-supplement').on('hide.bs.collapse', function () {
            // console.debug('3: hide.bs.collapse');
            $(this).toggleClass('opened-'+this.id);
            $(this).toggleClass('opened');
            // $(this).children().find('.book-files').hide();
            // $(this).children().find('.book-intro').show();
        });

        $('.panel-supplement').on('hidden.bs.collapse', function () {
            // console.debug('4: hidden.bs.collapse');
            awesomeGridSupplemental.init();
        });
    }
}
var awesomeGridSupplemental = {
    init:function(){
        console.debug('line 42');
        $('.supplemental-wrapper').AwesomeGrid({
            rowSpacing  : 0,
            colSpacing  : 1,
            initSpacing : 0,
            responsive  : true,
            fadeIn      : false,
            item        : 'div.panel-wrapper',
            columns     : {                  // supply an object to display columns based on the viewport
                'defaults' : 3,              // default number of columns
                '480'     : 1         // when viewport <= 800, show 2 columns
            }
        });
    }
 }

