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

// todays tasks are highlighted in orange

  var tasks = $(".task")
    tasks.each( function() {
      $self = $(this);
      var dateAttribute = $self.attr('data-attribute-date');
      if ( dateAttribute == 0)  {
        var assignedClass = 'due-today'
        $self.addClass('due-today');
      }
      else if (dateAttribute == -1) {
        var assignedClass = 'overdue'
      };
      $self.addClass(assignedClass);
    });


//  embed a data-anything-num as an attribute in the element associated w
//  the class of task.  then call $(this).attr(data-anything-num) to get the value
//  you may need to call parseInt to turn the string into an integer



});