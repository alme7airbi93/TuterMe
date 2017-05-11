 jQuery(document).ready(function($) {
 
    $(".scroll a, .navbar-brand, .gototop").click(function(event){   
    event.preventDefault();
    $('html,body').animate({scrollTop:$(this.hash).offset().top}, 600,'swing');
    $(".scroll li").removeClass('active');
    $(this).parents('li').toggleClass('active');
    });
    });






var wow = new WOW(
  {
    boxClass:     'wowload',      // animated element css class (default is wow)
    animateClass: 'animated', // animation css class (default is animated)
    offset:       0,          // distance to the element when triggering the animation (default is 0)
    mobile:       true,       // trigger animations on mobile devices (default is true)
    live:         true        // act on asynchronously loaded content (default is true)
  }
);
wow.init();




$('.carousel').swipe( {
     swipeLeft: function() {
         $(this).carousel('next');
     },
     swipeRight: function() {
         $(this).carousel('prev');
     },
     allowPageScroll: 'vertical'
 });



$(function() {    		
			//alert($('#rating').val());
                        
                        
                        var width = 0;
                        for(var i = 0; i<document.getElementsByName('rating').length; i++){
                            width = 16*parseFloat(document.getElementsByName('rating')[i].value);
                            document.getElementsByName('stars')[i].innerHTML = 
                                    '<span style="width:'+width+'px;"></span>';
                        }
                        });
		