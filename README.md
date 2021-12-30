# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...

# devise

username を追加

```
rails generate devise:views -v registrations
rails g migration add_username_to_users username:string
rails db:migrate
```

app/views/devise/registrations/(edit|new).html.erb に追加

```
  <div class="field">
    <%= f.label :username %><br />
    <%= f.text_field :username %>
  </div>
```
