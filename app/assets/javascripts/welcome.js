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
// var contador = 0
// ,   select_opt = 0;

// function add_to_list(){
// var action = document.querySelector('#action_select').value,
// description = document.querySelector('.input_description').value, 
// title = document.querySelector('.input_title_desc').value,
// date = document.getElementById('date_select').value;
 

// switch (action) {
//   case "SHOPPING":
//  select_opt  = 0;
//     break;
// case "WORK":
// select_opt = 1; 
//     break;
// case "SPORT":
//  select_opt = 2;
//     break;
// case "MUSIC":
// select_opt = 3; 
//     break;
// }  
  
// var class_li  =['list_shopping list_dsp_none','list_work list_dsp_none','list_sport list_dsp_none','list_music list_dsp_none'];  

// var cont = '<div class="col_md_1_list">    <p>'+action+'</p>    </div> <div class="col_md_2_list"> <h4>'+title+'</h4> <p>'+description+'</p> </div>    <div class="col_md_3_list"> <div class="cont_text_date"> <p>'+date+'</p>  </div>  <div class="cont_btns_options">    <ul>  <li><a href="#finish" onclick="finish_action('+select_opt+','+contador+');" ><i class="material-icons"></i></a></li>   </ul>  </div>    </div>';  
 
// var li = document.createElement('li')  
// li.className = class_li[select_opt]+" li_num_"+contador;

// li.innerHTML = cont;
// document.querySelectorAll('.cont_princ_lists > ul')[0].appendChild(li);

// setTimeout(function(){  document.querySelector('.li_num_'+contador).style.display = "block";
// },100);
  
// setTimeout(function(){
//   document.querySelector('.li_num_'+contador).className = "list_dsp_true "+class_li[select_opt]+" li_num_"+contador;
// contador++;
// },200);

// }

// function finish_action(num,num2) {
 
// var class_li  =['list_shopping list_dsp_true','list_work  list_dsp_true','list_sport list_dsp_true','list_music list_dsp_true'];   
// console.log('.li_num_'+num2);
//  document.querySelector('.li_num_'+num2).className = class_li[num]+" list_finish_state"; 
// setTimeout(function(){
//            del_finish();
//            },500);
// }

// function del_finish(){
// var li = document.querySelectorAll('.list_finish_state');
//     for(var e = 0; e < li.length; e++){if (window.CP.shouldStopExecution(1)){break;}
// /* li[e].style.left = "-100px"; */    
// li[e].style.opacity = "0";
// li[e].style.height = "0px";      
// li[e].style.margin = "0px";      
//     }
// window.CP.exitedLoop(1);


//   setTimeout(function(){
// var li = document.querySelectorAll('.list_finish_state');
//     for(var e = 0; e < li.length; e++){if (window.CP.shouldStopExecution(2)){break;}
//   li[e].parentNode.removeChild(li[e]); 
//     }
// window.CP.exitedLoop(2);

//   },500);
  
  
// }
// var t = 0;
// function add_new(){  
// if(t % 2 == 0){  
//  document.querySelector('.cont_crear_new').className = "cont_crear_new cont_crear_new_active";

//   document.querySelector('.cont_add_titulo_cont').className = "cont_add_titulo_cont cont_add_titulo_cont_active";
//   t++;
// }else {  document.querySelector('.cont_crear_new').className = "cont_crear_new";
// document.querySelector('.cont_add_titulo_cont').className = "cont_add_titulo_cont";  
//   t++;
//   } 
// }

$(document).ready(function() {
  var notice_hiding;
  // $('.new_user').hide();
  // $('body').on('click', '#add_user', function() {
  //   $('.new_user').toggle(1000);
  //   $('#add_user').hide(1000);
  //   document.location.href = 'https://' + document.location.hostname + ':' + document.location.port + '/' + '#users_form';
  //   return false;
  // });
  // $('.new_user').on('ajax:success', function() {
  //   document.getElementById("notice").innerHTML = "User created via AJAX";
  //   $('.new_user').toggle(1000);
  //   $('#notice').show();
  //   notice_hiding();
  //   return false;
  // });
  // $('table').on('ajax:success', '.destroy_user', function() {
  //   $(this).closest('tr').remove();
  //   document.getElementById("notice").innerHTML = "User has been deleted";
  //   $('.new_user').hide(1000);
  //   $('#notice').show();
  //   notice_hiding();
  //   return false;
  // });
  // $('.new_project').hide();
  // $('body').on('click', '#add_project', function() {
  //   $('.new_project').toggle(1000);
  //   $('#add_project').hide(1000);
  //   $("#project_name").focus();
  //   return false;
  // });
  // $('.new_project').on('ajax:success', function() {
  //   document.getElementById("notice").innerHTML = "Project created via AJAX";
  //   $('#add_project').toggle(1000);
  //   $('.new_project').toggle(1000);
  //   $('.new_task').hide();
  //   $('#notice').show();
  //   notice_hiding();
  //   return false;
  // });
  // $('.jumbotron').on('ajax:success', '.destroy_project', function() {
  //   $(this).closest('ul.list-group').remove(1000);
  //   document.getElementById("notice").innerHTML = "Project has been deleted";
  //   $('#notice').show();
  //   notice_hiding();
  //   return false;
  // });
  notice_hiding = function() {
    setTimeout((function() {
      $('.notifications div').fadeOut(1000);
      $('.modal-footer div').fadeOut(1000);
      return false;
    }), 1000);
    return false;
  };
  $('body').on('ajax:success', function() {
    // alert('hello');
    notice_hiding();
  });
  // notice_hiding();
  // $('.super_functions').hide();
  // $('#super_functions').hide();
  // $('#description').on('click', function() {
  //   $('.super_functions').toggle(1000);
  //   $('#super_functions').toggle(1000);
  //   return false;
  // });
  $('body').on('click', '.add_task', function() {
    $(this).closest('.cont_centrar').find('.new_task').toggleClass(" cont_crear_new_active");
    return false;
  });
  $('body').on('click', '.cancel_button', function(){
    $(this).closest('.edit_task').toggle();
  });

//   $('li.edit_task').hide();
//   $('li.edit_task').attr("draggable", "false");
//   $('body').on('click', '.ed_task', function() {
//     $(this).closest('li').toggle(1000);
//     $(this).closest('.task_each_div').find('li.edit_task').toggle(1000);
//     $('.task_each_div').attr("draggable", "false");
//     return false;
//   });
//   $('body').on('click', '.back', function() {
//     $(this).closest('li').toggle(1000);
//     $(this).closest('.task_each_div').find('li.list-group-item.item.task').toggle(1000);
//     $('.task_each_div').attr("draggable", "true");
//     return false;
//   });
//   $('.new_task').on('ajax:success', function() {
//     document.getElementById("notice").innerHTML = "Task created via AJAX";
//     $('.new_task').hide(1000);
//     $('#notice').show();
//     notice_hiding();
//     $('.new_task').hide(1000);
//     return false;
//   });
//   $('ul.list-group.sortable.list').on('ajax:success', '.destroy_task', function() {
//     $(this).closest('li.list-group-item.item').remove(1000);
//     document.getElementById("notice").innerHTML = "Task has been deleted";
//     $('#notice').show();
//     notice_hiding();
//     return false;
//   });
//   $('body').on('click', '.destroy_session', function() {
//     $('li.edit_task').hide();
//     $('.new_task').hide();
//     $('.new_user').hide();
//     return false;
//   });
//   $('.destroy_session').on('ajax:success', function() {
//     console.log('Session deleted via AJAX');
//     return false;
//   });
//   $(function() {
//     $('.datetimepicker1').datetimepicker({
//       format: 'DD-MM-YYYY HH:MM'
//     });
//     return false;
//   });
//   $('body').on('click', '.edit_user', function() {
//     $('.new_user').toggle(1000);
//     return false;
//   });
//   return $(function() {
//     $('[data-toggle="popover"]').popover();
//     return false;
//   });
});
// function statusDone(task) {
//   alert('ss')
//   $("form#edit_task_"+task).submit();
//   return false;
// };

function statusDone(task, project) {

    var url = "/projects/" + project + "/tasks/" + task; // the script where you handle the form input.
    var form_id = '#edit_task_' + task;
    $.ajax({
           type: "PATCH",
           url: url,
           data: $(form_id).serialize(), // serializes the form's elements.
         });
    return false; // avoid to execute the actual submit of the form.
};