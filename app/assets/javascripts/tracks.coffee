appendContent = (trackUrl, trackId) ->
  $('#tracks').append '<div class="col s12">' + '<div class="thumbnail"><a href="' + trackUrl + '">Name here</a>' + '<div class="caption">' + '<input id="tracks_" name="tracks[]" value="' + trackId + '" type="checkbox">' + '</div>' + '</div></div>'
  $('#delete').removeAttr 'disabled'
  $('#no-media').html ''
  return