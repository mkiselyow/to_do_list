$(document).ready(function() {
  // sign_in & sign_up buttons
  $(document).on("ajax:success", "form#sign_in_user, form#sign_up_user", function(event, xhr, settings) {
    // return $(this).parents('.modal').modal('hide');
  });
  $(document).on("ajax:error", "form#sign_in_user, form#sign_up_user", function(e, xhr, status, error) {
    // error_messages = "<div class='alert alert-danger pull-left'>Unknown error</div>";
    // return $(this).parents('.modal-content').children('.modal-footer').html(error_messages);
  });
});