$(function() {
  function filterNeeds(){
    if($("#filterText").val() != ""){ 
      $('li').filter("li:not(contains("+$("#filterText").val()+"))").css("display","none");
      $('li').filter("li:contains("+$("#filterText").val()+")").css("display","");
    }
    else{
      $('li').filter("li").css("display", "");
    }
    return false;
  }

  $("#filterText").keyup(function(){
    filterNeeds();
  });
});
