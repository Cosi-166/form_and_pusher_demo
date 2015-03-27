### Forms, Ajax and Pusher Demo

This is example illustrates three different ideas and how to implement them in Rails.

Note that at this time it requires:
	* ruby 2.0.0p353 (2013-11-22 revision 43784) [x86_64-darwin13.0.0]
	* which in turn is requiured for the Rails version that it works with: Rails 4.0.2

#### An interesting form

#### Ajax search results
* You can see it work when you go to the search page. The search results are displayed without the page refreshing.
* [apps/views/items/search.html.erb]
	* form_tag causes a "get" to do_search_items_path
	* Notice that it says "remote: true" This causes the flow to be different
	* The code generated will cause that get to be done in a background thread of the browser
	* The get, instead of returning a new page renders do_search.js.erb
	* Which gets received by the browser and 'executed'

#### Pusher support
* Pusher is a service that uses Websockets to push results out to clients.
* There is a rumor that Rails 5 will include Websockets directly
* You can see it work when you have two windows open showing a comment count on some item. If you add a comment to that item, the counter in the other windows incremenet.

* [gemfile]
	* Requires pusher gem
* [app/controllers/comments_controller]
	* require 'pusher' and declaration of app_id and other setup parameters
	* create: Calls push_count, which calls Pusher.trigger
* [app/views/layouts/application]
	* Note inclusion of js library for pusher
* [app/assets/javascripts/items.js]
	* Listen to pusher channel. And modify html on the fly when event happens


