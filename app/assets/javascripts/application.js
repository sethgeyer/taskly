//= require jquery
//= require jquery_ujs
//= require_tree .


//Change default task list to hide all tasks.

$(document).ready(function() {

  var button = $('.task-list > button');

  button.click( function() {
    var section = $(this).parents('.task-list');
    $(this).siblings('.task').toggle();

    if ($(this).text() === '+') {
      $(this).text('x') ;
    }
    else {
    $(this).text('+');
    }
    section.siblings('.task-list').find('.task').hide();
    section.siblings('.task-list').find('button').text('+');
  });




  $(".flashy").fadeOut(5000);

  var button = $(".flashy > button")
  button.click(function() {
    $(".flashy").toggle();
  });





});