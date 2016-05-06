$(function() {
  $('form#new_recipe').submit(function(event) {
    event.preventDefault();
    var newRecipeContent = $('#recipe_content').val();
    var newRecipe = {
      recipe: {
        content: newRecipeContent;
      });
    };

    var request = $.ajax({
      method: 'POST',
      data: newRecipe,
      url: '/recipes/new'
    });

    request.done(function() {
      var html = '<div class ='callout success'>' + newRecipeContent + '</div>';
      $('div.recipes').append(html);
      $('#recipe_content').val('');
    });
  });
};

$(function() {
  $('form#edit_recipe').submit(function(event) {
    event.preventDefault();
    var editRecipeContent = $('#recipe_content').val();
    var editRecipe = {
      recipe: {
        content: editRecipeContent;
      });
    };

  var request = $.ajax({
    method: 'POST',
    data: editRecipe,
    url: '/recipes/:id/edit'
  });

  request.done(function() {
    var html = '<div class ='callout success'>' + editRecipeContent + '</div>';
      $('div.recipes').append(html);
      $('#recipe_content').val('');
    });
  });
};

var $modal = $('#modal');

$.ajax('/url')
  .done(function(resp){
    $modal.html(resp.html).foundation('open');
});
