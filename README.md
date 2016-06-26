== README


![Imgur](http://i.imgur.com/YQGBczz.png)

![Build Status](https://codeship.com/projects/86385b50-e668-0133-16eb-06b21bf3bd66/status?branch=master)
![Code Climate](https://codeclimate.com/github/MeredithBubierRoss/recipe_finder.png)
![Coverage Status](https://coveralls.io/repos/MeredithBubierRoss/recipe_finder/badge.png)

This app is hosted on Heroku. (http://suppertime.herokuapp.com  )

SupperTime lets a user search for recipes by ingredient, prep time, or both.
If they are an authenticated user, they can add new recipes to the database, and
end or delete recipes they have added.

The design for this app was inspired by the challenge of trying to plan to cook
meals at home while working a schedule that isn't a 9-5. If the user doesn't like to
have everything planned out a week before, figuring out how to make dinner when they
get home from work at 7 and have to be at work for 7 the next morning while getting
to bed at a decent hour can be a challenge. Thinking about unconventional schedules
and combining that with a want to use up what might already be at home, the user has two
search options:

* The user can do a streamlined search of the internet through the Yummly API. This
allows users to enter either or both search parameters in a single search field, and Yummly
will bring back recipes sourced from multiple recipe websites to a single results
page.

* The user can search a user-sourced cookbook. Signing up for an account gives a user
the ability to add to the cookbook, edit recipes they have added, and delete recipes
they want to remove from the cookbook. Searches can be conducted on an ingredient,
a prep time, or both by filling in the appropriate fields on the search form.

Styling for SupperTime has been kept intentionally minimal to allow for an easy transition
from desktop to mobile, making meal planning on the fly (like in the grocery store
on the way home) easy to do. Users can always have their personal cookbook on them, so even if
they aren't on a time crunch, they know exactly what they need to buy to satisfy their
latest craving for a particular meal or treat.

Download instructions
---------------------
`git clone https://github.com/MeredithBubierRoss/recipe_finder.git`

`cd recipe_finder`

`bundle install`

`rake db:create`

`rake db:migrate`

Updates
-------
* Users can favorite recipes and see a list of what they've favorited
* Ajax responses for adding and editing recipes for a faster user experience.

Future Features
---------------

* Users can privatize certain recipes as "Family Secrets". These should be unavailable
to search in the global cookbook, but the user can access in their personal collection.
* Users can upload photos to go with their recipes.
* Users can sign in with a username or email, and will eventually be addressed in their
cookbook by first name instead of email.
* Mailer capability - recover lost passwords, get notifications if a favorite recipe is
removed from the database.
* Users can exclude allergy issues when searching internet recipes through API
* Users can exclude allergy issues when searching public cookbook
* Recipes are marked with submission information (what user submitted recipe)
