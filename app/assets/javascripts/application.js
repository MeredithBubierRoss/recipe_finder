// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });

$(function () {
  $('form#new_recipe').submit(function (event) {
        event.preventDefault();
        var newRecipeContent = $('#recipe_content').val();
        var newRecipe = {
                recipe: {
                    content: newRecipeContent
                }
            };

        var request = $.ajax({
                method: 'POST',
                data: newRecipe,
                url: '/recipes/new'
            });

        request.done(function () {
            var html = newRecipeContent;
            $('div.recipes').append(html);
            $('#recipe_content').val('');
        });
    });
});

$(function () {
  $('form#edit_recipe').submit(function (event) {
        event.preventDefault();
        var editRecipeContent = $('#recipe_content').val();
        var editRecipe = {
                recipe: {
                    content: editRecipeContent
                }
            };

        var request = $.ajax({
                method: 'POST',
                data: editRecipe,
                url: '/recipes/:id/edit'
            });

        request.done(function () {
            var html = editRecipeContent;
            $('div.recipes').append(html);
            $('#recipe_content').val('');
        });
    });
});

var $modal = $('#modal');

$.ajax('/url')
  .done(function(resp){
    $modal.html(resp.html).foundation('open');
});
