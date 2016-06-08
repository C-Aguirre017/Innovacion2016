function search(url) {
  $('.ability-search').on('keyup', function() {
    if ($(this).val().length < 3) {
      $('.ability-search-results tbody').empty();
      $('.ability-search-results').addClass('hidden');
      return;
    }

    $(this).val($(this).val().split('.').join(""));

    $.ajax({
        url: url,
        type: 'GET',
        data: {
          query: $(this).val()
        }
      })
      .done(function(response) {
        if (response.length === 0) {
          $('.ability-search-results tbody').empty();
          $('.ability-search-results').addClass('hidden');
        } else {
          $('.ability-search-results tbody').empty();
          $('.ability-search-results').removeClass('hidden');
          response.forEach(function(user) {
            var trHTML = '';
            trHTML += '<tr>';
            trHTML += '<td>' + user.name + '</td>';
            trHTML += '<td>' + user.lastName + '</td>';
            trHTML += '<td><a href="/users/' + user.id + '" class="btn btn-xs btn-info">Ver<td>';
            trHTML += '</tr>';
            $('.ability-search-results tbody').append(trHTML);
          });
        }
      });
  });
}
