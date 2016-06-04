function search() {
  $('.user-search').on('keyup', function() {
    if ($(this).val().length < 3) {
      $('.user-search-results tbody').empty();
      $('.user-search-results').addClass('hidden');
      return;
    }

    $(this).val($(this).val().split('.').join(""));

    $.ajax({
        url: 'find_file',
        type: 'GET',
        data: {
          query: $(this).val()
        }
      })
      .done(function(response) {
        if (response.length === 0) {
          $('.user-search-results tbody').empty();
          $('.user-search-results').addClass('hidden');
        } else {
          $('.user-search-results tbody').empty();
          $('.user-search-results').removeClass('hidden');
          response.forEach(function(user) {
            var trHTML = '';
            trHTML += '<tr>';
            trHTML += '<td>' + user.name + '</td>';
            trHTML += '<td>' + user.lastName + '</td>';
            trHTML += '<td><a href="/users/' + user.id + '" class="btn btn-xs btn-info">Ver<td>';
            trHTML += '</tr>';
            $('.user-search-results tbody').append(trHTML);
          });
        }
      });
  });
}
