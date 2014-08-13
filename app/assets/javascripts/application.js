//= require jquery
//= require jquery_ujs
//= require_tree .


//Change default task list to hide all tasks.

$(document).ready(function() {

//var taskLists = $('.task-list');
//
//  taskLists.click( function() {
//    $(this).find('.task').toggle();
//    $(this).siblings('.task-list').find('.task').hide();
//
//  })



  var button = $('.task-list > button');

  button.click( function() {
    var section = $(this).parents('.task-list');
    $(this).siblings('.task').toggle();

    if ($(this).text() === '+') {
      $(this).text('x') ;
    }
    else {
    $(this).text('+');

    };
    section.siblings('.task-list').find('.task').hide();
    section.siblings('.task-list').find('button').text('+');
  })








});