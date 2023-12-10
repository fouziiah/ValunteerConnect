$(function(){
    $('#interestedBtn').click(function() {
      var opportunityId = $(this).data('opportunity-id');
  
      $.ajax({
        type: 'GET',
        url: '/api/send_text',
        data: { opportunity_id: opportunityId }, 
        success: function(response) {
          alert('API call successful! Message: ' + response);
        },
        error: function(error) {
          console.error(error);
          alert('API call failed!');
        }
      });
    });
  });
  