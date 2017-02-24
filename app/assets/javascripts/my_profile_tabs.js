$(function(){

  $(".tab").on("click", function(e){
    $(".tab.active").removeClass("active");
    $(this).addClass("active");
    // Hide all tab-content (use class="hidden")
    $(".tab-content").addClass("hidden");
    // Show target tab-content (use class="hidden")
    var content = $(this).data("target");
    $(content).removeClass("hidden");
  });

});

