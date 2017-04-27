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




 $(document).ready(function(){
     $('.carousel[data-type="multi"] .item').each(function(){
         var next = $(this).next();
         if (!next.length) {
             next = $(this).siblings(':first');
         }
         next.children(':first-child').clone().appendTo($(this));

         for (var i=0;i<4;i++) {
             next=next.next();
             if (!next.length) {
                 next = $(this).siblings(':first');
             }

             next.children(':first-child').clone().appendTo($(this));
         }
     });
 });

