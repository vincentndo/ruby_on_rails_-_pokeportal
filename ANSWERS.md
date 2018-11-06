# Q0: Why are these two errors being thrown?
The first one is the database error occurring when the database has not been updated with the changes.
The second one is due to the missing of the Pokemon model.

# Q1: How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear? *
After # rails db:seed, there are 4 pokemons populated in the database. Whenever we refresh, the router calls home_controller.rb that, in turn, invokes the index method. This method randomly sample a pokemon and assign it to @pokemon, i.e. @pokemon = trainerless_pokemon.sample

# Question 2a: What does the following line do "<%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %>"? Be specific about what "capture_path(id: @pokemon)" is doing. If you're having trouble, look at the Help section in the README.
The line creates a button clicking on which sends a patch request with pokemon id.

# Question 3: What would you name your own Pokemon?
Sakura

# Question 4: What did you pass into the redirect_to? If it is a path, what did that path need? If it is not a path, why is it okay not to have a path here?
A path with a trainer_id. If it is not a path, just go back.

# Question 5: Explain how putting this line "flash[:error] = @pokemon.errors.full_messages.to_sentence" shows error messages on your form.
I didn't put this line but I used the similar line <font color="red"><%= @error.full_messages.join(', ') %></font> . It works because I got the error from the backend and put it in the front end.

# Give us feedback on the project and decal below!
This project is not hard but we didn't have enough knowledge/practice for it so it is time-consuming.
Please go back to Piazza. Slack is not a good platform for Q&A.

# Extra credit: Link your Heroku deployed app
