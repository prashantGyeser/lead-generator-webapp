$(document).ready(function(){
    $('.not_lead').click(function(event){
        event.preventDefault();

        // Todo: Post the data to the server
        // Todo: Remove the lead from the list

        $(this).parent().parent().parent().parent().hide(200);


    });
});